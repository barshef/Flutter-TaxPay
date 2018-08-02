using FlutterwaveTechnicalHeroes.ErrorLog;
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

namespace FlutterwaveTechnicalHeroes.Tiers
{
    public partial class RaveMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var urlnames = HttpContext.Current.Request.Url.AbsoluteUri;
                //Session.Abandon();
                Geturl();
            }
        }

        //To check weda is local or online
        public static string GetDomainNameFromRequest(HttpRequest request)
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
                    LbluseUrl.Text = reader["StateUrlName"].ToString();
                    Session["StateUrlName"] = LbluseUrl.Text;
                    Session["url"] = LbluseUrl.Text;
                    LblDbGatewayName.Text = reader["GateWayID"].ToString();
                    Session["DbGateWayID"] = LblDbGatewayName.Text;
                    LblStateCode.Text = reader["StateCode"].ToString();
                    Session["StateCode"] = LblStateCode.Text;
                    LblStateName.Text = reader["StateName"].ToString();
                    Session["StateName"] = LblStateName.Text;
                    Llbstatephon.Text = reader["StatePhone"].ToString();
                    Lblstateconemail.Text = reader["StateEmail"].ToString();
                    LblAddress.Text = reader["StateAddress"].ToString();
                    LblAnodaTeleNo.Text = reader["StatePhone"].ToString();
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
        protected string InslogintImg
        {
            get
            {
                var path = $"~/Assets/Engine/img/payimg/loginimage/{LblgeturlInstcode.Text}/logo.png";
                Session["path"] = path;
                return path;

            }
        }
        protected string StateLogoImg
        {
            get
            {
                var path = $"~/Assets/Engine/img/payimg/loginimage/{LblgeturlInstcode.Text}/LogoBanner.png";
                Session["path"] = path;
                return path;
            }
        }
        protected string InstImgIco
        {
            get
            {
                var path = $"~/Assets/Engine/img/payimg/loginimage/{LblgeturlInstcode.Text}/favicon.ico";
                return path;
            }
        }
        protected string stateurl
        {
            get
            {
                var path = $"https://{LbluseUrl.Text}";
                return path;
            }
        }
    }
}