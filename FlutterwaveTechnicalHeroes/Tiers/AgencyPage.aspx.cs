using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FlutterwaveTechnicalHeroes.ErrorLog;
using FlutterwaveTechnicalHeroes.MessageHandler;
using FlutterwaveTechnicalHeroes.SqlDbUtilities;

namespace FlutterwaveTechnicalHeroes.Tiers
{
    public partial class AgencyPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Abandon();
                Geturl();
                //PanelSecondPage.Visible = false;
                //PanelSecondGoBack.Visible = false;
            }
        }

        private MessageClass LoadAgency()
        {
            var messageClass = new MessageClass();
            var institud = Convert.ToInt32(LblgeturlInstcode.Text);
            var cmdMyQuery = new SqlCommand("Barsh.Querr_AgencyList") { CommandType = CommandType.StoredProcedure };
            //cmdMyQuery.Parameters.AddWithValue("@institutionCode", institud);
            var dtresponse = DataBaseHandler.SqlSelectDataSet(cmdMyQuery);
            var xpressResponseResult = Newtonsoft.Json.JsonConvert.SerializeObject(dtresponse);
            Console.WriteLine(dtresponse);

            if (dtresponse.Tables[0].Rows.Count > 0)
            {
                RptAgencyName.DataSource = dtresponse;
                RptAgencyName.DataBind();
            }
            else
            {
                messageClass.StatusMessage = "Unable to fetch records";
                //LblMsg.Text = messageClass.StatusMessage;
                //LblMsg.ForeColor = System.Drawing.Color.Red;
                //LblMsg.Visible = true;
            }

            return messageClass;
        }

        private void AccessPayGate()
        {
            LoadAgency();
        }
       
        //To check weda is local or online
        private static string GetDomainNameFromRequest(HttpRequest request)
        {
            var match = Regex.Match(request.Url.Host, "([^.]+\\.[^.]{1,3}(\\.[^.]{1,3})?)$");
            var domain = match.Groups[1].Success ? match.Groups[1].Value : null;
            return domain;
        }

        private static bool IsLocal => System.Web.HttpContext.Current.Request.Url.Authority.Contains("localhost");

        //To check weda is local or online

        // To get url
        private void Geturl()
        {
            try
            {
                if (IsLocal) return;
                var con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                var url = GetDomainNameFromRequest(Request);
                //var url = LblgeturlInstcode.Text;
                //Lblurl.Text = url;
                if (string.IsNullOrWhiteSpace(url)) return;
                var cmd = new SqlCommand("usp_StateUrl_Compare", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.Add("@StateUrlName", SqlDbType.VarChar).Value = url;
                var reader = cmd.ExecuteReader();
                reader.Read();
                if (reader.HasRows)
                {
                    LblgeturlInstcode.Text = reader["InstitutionCode"].ToString();
                    Session["InstitutionCode"] = LblgeturlInstcode.Text;
                    LblMerchantCode.Text = reader["StateCode"].ToString();
                    Session["MerchantCode"] = LblMerchantCode.Text;
                    LblGateWayId.Text = reader["GateWayID"].ToString();
                    LbluseUrl.Text = reader["StateName"].ToString();
                    Session["StateName"] = LbluseUrl.Text;
                    Lblurl.Text = reader["StateUrlName"].ToString();
                    Session["url"] = Lblurl.Text;
                    AccessPayGate();
                }
                else
                {
                    return;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                var err = new CreateLogFiles();
                err.ErrorLog(Server.MapPath("Logs/ErrorLog"), ex.Message);
                CreateLogFiles.ExceptionLogging.SendErrorTomail(ex,
                    HttpContext.Current.Request.Url.ToString());
            }

        }
        // To get url
        protected void RptAgencyName_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName != "SelectedRow") return;
            var hiddenAgencyId = (e.Item.FindControl("HiddenAgencyID") as HiddenField)?.Value;
            var agencyId = hiddenAgencyId;
            Session["agencyID"] = agencyId;
            var hiddenAgencyName = (e.Item.FindControl("HiddenAgencyName") as HiddenField)?.Value;
            var agencyName = hiddenAgencyName;
            Session["agencyName"] = agencyName;
            Session["MerchantCode"] = LblMerchantCode.Text;
            Session["DbGateWayID"] = LblGateWayId.Text;
            Session["InstitutionCode"] = LblgeturlInstcode.Text;
            Response.Redirect("~/RevenueDetail");
        }
    }
}