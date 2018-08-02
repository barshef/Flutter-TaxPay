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
    public partial class RevenueDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(Convert.ToString(Session["InstitutionCode"])))
                {
                    Response.Redirect("~/Home");
                }
                else
                {
                    AccessPayGate();
                    Geturl();
                }
            }
        }

        //To check weda is local or online
        private static string GetDomainNameFromRequest(HttpRequest request)
        {
            var match = Regex.Match(request.Url.Host, "([^.]+\\.[^.]{1,3}(\\.[^.]{1,3})?)$");
            var domain = match.Groups[1].Success ? match.Groups[1].Value : null;
            return domain;
        }
        public static bool IsLocal => System.Web.HttpContext.Current.Request.Url.Authority.Contains("localhost");

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
                    Lblurl.Text = reader["StateUrlName"].ToString();
                    Session["url"] = Lblurl.Text;
                    LblStateCode.Text = reader["StateCode"].ToString();
                    Session["StateCode"] = LblStateCode.Text;
                    LblDbGatewayName.Text = reader["GateWayID"].ToString();
                    Session["DbGateWayID"] = LblDbGatewayName.Text;
                    LbluseUrl.Text = reader["StateName"].ToString();
                    Session["StateName"] = LbluseUrl.Text;
                    LblUrlInstcode.Text = reader["InstitutionCode"].ToString();
                    Session["InstitutionCode"] = LblUrlInstcode.Text;

                }
                //else
                //{
                //    //Lblurl.Text = "No autheticated url";
                //    //Response.Redirect("~/Boss/LogBoss.aspx");
                //}
                con.Close();
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                var err = new CreateLogFiles();
                // err.ErrorLog(Server.MapPath("Logs/ErrorLog"), ex.Message);
                CreateLogFiles.ExceptionLogging.SendErrorTomail(ex,
                    HttpContext.Current.Request.Url.ToString());
            }

        }
        // To get url
        protected MessageClass LoadAgenyType()
        {
            var messageClass = new MessageClass();
            var institud = Session["InstitutionCode"].ToString();
            var cmdMyQuery = new SqlCommand("Barsh.Querr_LoadAgencyPerRevenue") { CommandType = CommandType.StoredProcedure };
            cmdMyQuery.Parameters.AddWithValue("@AgencyCode", LblAgencyID.Text);
            var dtresponse = DataBaseHandler.SqlSelectDataSet(cmdMyQuery);
            var xpressResponseResult = Newtonsoft.Json.JsonConvert.SerializeObject(dtresponse);
            Console.WriteLine(dtresponse);

            if (dtresponse.Tables[0].Rows.Count > 0)
            {
                RptRevenueName.DataSource = dtresponse;
                RptRevenueName.DataBind();
            }
            else
            {
                messageClass.StatusMessage = "Unable to fetch records";
            }

            return messageClass;
        }
        private void AccessPayGate()
        {
            LblAgencyName.Text = Session["agencyName"].ToString();
            LblAgencyID.Text = Session["agencyID"].ToString();
            LblMerchantCode.Text = Session["MerchantCode"].ToString();
            var gateWayId = Session["DbGateWayID"].ToString();
            LoadAgencyType();
        }

        private MessageClass LoadAgencyType()
        {
            var messageClass = new MessageClass();
            var institud = Session["InstitutionCode"].ToString();
            var cmdMyQuery = new SqlCommand("Barsh.Querr_LoadAgencyPerRevenue") { CommandType = CommandType.StoredProcedure };
            cmdMyQuery.Parameters.AddWithValue("@AgencyCode", LblAgencyID.Text);
            var dtresponse = DataBaseHandler.SqlSelectDataSet(cmdMyQuery);
            var xpressResponseResult = Newtonsoft.Json.JsonConvert.SerializeObject(dtresponse);
            Console.WriteLine(dtresponse);

            if (dtresponse.Tables[0].Rows.Count > 0)
            {
                RptRevenueName.DataSource = dtresponse;
                RptRevenueName.DataBind();
            }
            else
            {
                messageClass.StatusMessage = "Unable to fetch records";
            }

            return messageClass;
        }

        private MessageClass CheckAgencyExeception()
        {
            var messageClass = new MessageClass();
            var cmdMyQuery = new SqlCommand("Barsh.Querr_CheckAgencyException") { CommandType = CommandType.StoredProcedure };
            cmdMyQuery.Parameters.AddWithValue("@AgencyCode", LblAgencyID.Text);
            cmdMyQuery.Parameters.AddWithValue("@StateCode", LblMerchantCode.Text);
            var dtresponse = DataBaseHandler.SqlSelect(cmdMyQuery);
            var xpressResponseResult = Newtonsoft.Json.JsonConvert.SerializeObject(dtresponse);
            Console.WriteLine(dtresponse);

            if (dtresponse.Rows.Count > 0)
            {
                //Session["Payer"] = "Payer";
                //Session["RevAgency"] = "RevAgency";
                ////Session["RevException"] = string.Empty;
                //Session["agencyName"] = LblAgencyName.Text;
                //Session["agencyID"] = LblAgencyID.Text;
                //Session["revenueName"] = LblSelectedRevName.Text;
                //Response.Redirect("~/PayerSearch");
                CheckRevenueExeception();
            }
            else
            {
                Session["Payer"] = "Payer";
                Session["RevException"] = string.Empty;
                Session["RevAgency"] = string.Empty;
                Session["agencyName"] = LblAgencyName.Text;
                Session["agencyID"] = LblAgencyID.Text;
                Session["revenueName"] = LblSelectedRevName.Text;
                Session["revenueID"] = LblSelectRevID.Text;
                Session["NoPayerRefNo"] = string.Empty;
                //var xpresspaytransId = HashPasswordHelper.GeneratePassword(10);
                var xpresspaytransId = HashPasswordHelper.GetUniqueKey(6);
                Session["transidno"] = "PAYREF" + xpresspaytransId;
                Session["url"] = LbluseUrl.Text;
                Session["DbGateWayID"] = LblDbGatewayName.Text;
                Session["StateName"] = LbluseUrl.Text;
                Session["StateCode"] = LblMerchantCode.Text;
                Response.Redirect("~/PayerDetails");
            }

            return messageClass;
        }
        private MessageClass CheckRevenueExeception()
        {
            var messageClass = new MessageClass();
            //var institud = Session["InstitutionCode"].ToString();
            var cmdMyQuery = new SqlCommand("Barsh.Querr_CheckRevenueException") { CommandType = CommandType.StoredProcedure };
            cmdMyQuery.Parameters.AddWithValue("@RevenueCode", LblSelectRevID.Text);
            cmdMyQuery.Parameters.AddWithValue("@StateCode", LblMerchantCode.Text);
            var dtresponse = DataBaseHandler.SqlSelect(cmdMyQuery);
            var xpressResponseResult = Newtonsoft.Json.JsonConvert.SerializeObject(dtresponse);
            Console.WriteLine(dtresponse);

            if (dtresponse.Rows.Count > 0)
            {
                Session["Payer"] = "Payer";
                Session["RevException"] = string.Empty;
                Session["RevAgency"] = string.Empty;
                Session["agencyName"] = LblAgencyName.Text;
                Session["agencyID"] = LblAgencyID.Text;
                Session["revenueName"] = LblSelectedRevName.Text;
                Session["revenueID"] = LblSelectRevID.Text;
                Response.Redirect("~/PayerSearch");


            }
            else
            {
                //CheckAgencyExeception();
                Session["Payer"] = "Payer";
                Session["RevAgency"] = "RevAgency";
                Session["RevException"] = "RevException";
                Session["agencyName"] = LblAgencyName.Text;
                Session["agencyID"] = LblAgencyID.Text;
                Session["revenueName"] = LblSelectedRevName.Text;
                Session["revenueID"] = LblSelectRevID.Text;
                Response.Redirect("~/PayerSearch");

            }

            return messageClass;
        }

        private void RedirectToPayement()
        {
            Session["Payer"] = "Payer";
            Session["RevException"] = string.Empty;
            Session["RevAgency"] = string.Empty;
            Session["agencyName"] = LblAgencyName.Text;
            Session["agencyID"] = LblAgencyID.Text;
            Session["revenueName"] = LblSelectedRevName.Text;
            Session["revenueID"] = LblSelectRevID.Text;
            Session["NoPayerRefNo"] = string.Empty;
            //var xpresspaytransId = HashPasswordHelper.GeneratePassword(10);
            var xpresspaytransId = HashPasswordHelper.GetUniqueKey(6);
            Session["transidno"] = "PAYREF" + xpresspaytransId;
            Session["url"] = LbluseUrl.Text;
            Session["DbGateWayID"] = LblDbGatewayName.Text;
            Session["StateName"] = LbluseUrl.Text;
            Session["StateCode"] = LblMerchantCode.Text;
            Response.Redirect("~/PayerDetails");
        }
        protected void RptRevenueName_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName != "SelectedRow") return;
            string hiddenRevenueId = (e.Item.FindControl("HiddenRevenueID") as HiddenField)?.Value;
            var revenueId = hiddenRevenueId;
            LblSelectRevID.Text = revenueId;
            string hiddenRevenueName = (e.Item.FindControl("HiddenRevenueName") as HiddenField)?.Value;
            var revenueName = hiddenRevenueName;
            LblSelectedRevName.Text = revenueName;
            //CheckAgencyExeception();
            RedirectToPayement();
        }
        private void EmptySessionform()
        {
            Session["agencyName"] = string.Empty;
            Session["agencyID"] = string.Empty;
            Session["revenueName"] = string.Empty;
            Session["revenueID"] = string.Empty;
        }
    }
}