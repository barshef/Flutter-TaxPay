using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FlutterwaveTechnicalHeroes.ErrorLog;
using FlutterwaveTechnicalHeroes.MessageHandler;
using FlutterwaveTechnicalHeroes.SqlDbUtilities;
using FlutterwaveTechnicalHeroes.WebApiConnector;
using Newtonsoft.Json;

namespace FlutterwaveTechnicalHeroes.Tiers
{
    public partial class RetryFailTransaction : System.Web.UI.Page
    {
        private readonly Helper _helper = new Helper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Geturl();
            }
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
            var bc = new MessageClass();
            try
            {
                if (IsLocal) return;
                var con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                var url = GetDomainNameFromRequest(Request);
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
                    var institutioncode = reader["InstitutionCode"].ToString();
                    Session["InstitutionCode"] = institutioncode;
                    var merchantCode = reader["StateCode"].ToString();
                    var stateUrlName = reader["StateUrlName"].ToString();
                    var stateName = reader["StateName"].ToString();
                    var dbGateWayId = reader["GateWayID"].ToString();
                    Session["DbGateWayID"] = dbGateWayId;
                    Session["StateCode"] = merchantCode;
                    Session["StateUrlName"] = stateUrlName;
                    Session["StateName"] = stateName;
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

            var pageSource = Session["failedPage"].ObjectToString();
            var xresponseTransId = Session["newTransRefNo"].ObjectToString();

            if (!string.IsNullOrEmpty(pageSource) && !string.IsNullOrEmpty(xresponseTransId))
            {
                bc = CrossCheckResponse(Session["newTransRefNo"].ToString());
                if (bc.IsSuccessful)
                {
                    if (!string.IsNullOrEmpty(Convert.ToString(Session["ravelink"])))
                    {
                        var redirecturl = Session["ravelink"].ObjectToString();
                        Response.Redirect(redirecturl);
                    }
                    else
                    {
                        bc.StatusMessage = "Invalid GateWay Code";
                        bc.StatusId = -1;
                        ExceptionLogging.SendErrorTomail(new Exception(bc.StatusMessage), HttpContext.Current.Request.Url.ToString());
                        Response.Redirect("~/ErrorPage");
                    }
                }
            }
            else
            {
                Response.Redirect("~/ErrorPage");
            }

        }
        // To get url

        private MessageClass Selectgateway(string appNewTransValue)
        {
            var bc = new MessageClass();
            var gateWayId = Session["DbGateWayID"].ObjectToString();
            if (gateWayId == Global.Raveconfigs.RaveSwitchGateWayId)
            {
                var dbEmail = Session["dbEmail"].ObjectToString();
                var dbAmount = Session["transDbAmount"].ObjectToString();
                bc = RaveGateWay(dbEmail, dbAmount, appNewTransValue);
                bc.StatusId = 1;
            }
            else
            {
                bc.StatusMessage = "Invalid Institution Code";
                bc.StatusId = -1;
                Response.Redirect("~/ErrorPage");
            }
            return bc;
        }
        private MessageClass RaveGateWay(string email, string amount, string newTransvalue)
        {
            var bc = new MessageClass();
            var xpresspaytransIds = newTransvalue;
            var icmapublickey = Global.Raveconfigs.Publickey;
            var baseUrl = Request.Url.GetLeftPart(UriPartial.Authority);
            var returnUrl = baseUrl + "/" + Global.Raveconfigs.Callbackurl;
            var callbackurl = returnUrl;
            const string proceedButton = "Proceed to payment";

            //Get parameter to post
            var ravePararameters = new RavePararameters
            {
                Txref = xpresspaytransIds,
                PbfPubKey = icmapublickey,
                CustomerEmail = email,
                Amount = Convert.ToDecimal(amount).ToString(CultureInfo.InvariantCulture),
                Currency = Global.Raveconfigs.RaveCountrycurrency,
                Redirecturl = callbackurl,
                Paybuttontext = proceedButton
            };

            //Instatiate the baseurl
            var client = _helper.InitializeClient();

            var content = new StringContent(JsonConvert.SerializeObject(ravePararameters), Encoding.UTF8, "application/json");
            var res = client.PostAsync("flwv3-pug/getpaidx/api/v2/hosted/pay", content).Result;
            if (res.IsSuccessStatusCode)
            {
                var messageClass = res.Content.ReadAsAsync<RaveResponseClass.ResponseObject>().Result;
                if (messageClass != null && messageClass.Status == "success")
                {
                    bc.StatusId = 1;
                    bc.StatusMessage = "Service return a successfully response";
                    var ravelink = messageClass.Data.Link;
                    Session["ravelink"] = ravelink;
                }
                else
                {
                    bc.StatusId = -1;
                    bc.StatusMessage = $"Service return null - {messageClass?.Status}";
                }
            }

            return bc;
        }
        private MessageClass LogPayaNewPayInfor()
        {
            var bc = new MessageClass();

            if (!string.IsNullOrEmpty(Convert.ToString(Session["InstitutionCode"])))
            {
                var xpresspaytransId = HashPasswordHelper.GetUniqueKey(6);
                var newTransRefNo = "PAYREF" + xpresspaytransId;
                Session["newTransRefNo"] = newTransRefNo;

                var instutud = Convert.ToString(Session["InstitutionCode"]);
                var commandToExecute = new SqlCommand("Barsh.LogTransaction_InsertOrUpdate") { CommandType = CommandType.StoredProcedure };
                commandToExecute.Parameters.AddWithValue("@TransRefNo", newTransRefNo);
                commandToExecute.Parameters.AddWithValue("@Surname", Session["dbSurname"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@OtherNames", Session["dbOtherNames"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@Address", Session["dbAddress"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@Email", Session["dbEmail"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@PhoneNo", Session["dbPhoneNo"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@RevenueName", Session["dbRevenueName"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@RevenueCode", Session["dbRevenueCode"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@AgencyName", Session["dbAgencyName"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@AgencyCode", Session["dbAgencyCode"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@AmountPaid", Convert.ToDecimal(Session["transDbAmount"].ObjectToString()));
                commandToExecute.Parameters.AddWithValue("@PayGateWay", Session["dbPayGateWay"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@institutionCode", instutud);
                commandToExecute.Parameters.AddWithValue("@CountryName", Session["dbCountryName"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@StateName", Session["dbStateName"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@LGA", Session["dbLGA"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@City", Session["dbCity"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@Area", Session["dbArea"].ObjectToString());

                var recCount = DataBaseHandler.ExecuteSqlCommand(commandToExecute);
                bc.StatusId = recCount > 0 ? 1 : 0;
                if (recCount > 0)
                {
                    bc = Selectgateway(newTransRefNo);
                    bc.StatusId = 1;
                }
                else
                {
                    bc.StatusMessage = "Unable to fetch all logged transaction";
                    bc.StatusId = -1;
                }
            }
            else
            {
                bc.StatusMessage = "Invalid Merchant Code";
                bc.StatusId = -1;
            }
            return bc;
        }
        private MessageClass CrossCheckResponse(string transRefsNo)
        {
            var bc = new MessageClass();
            var pageSource = Session["failedPage"].ObjectToString();
            var xresponseTransId = transRefsNo;
            var cmdMyQuery = new SqlCommand("Barsh.QuerryAll_LogTransaction") { CommandType = CommandType.StoredProcedure };
            cmdMyQuery.Parameters.AddWithValue("@TransRefNo", xresponseTransId);
            var dtresult = DataBaseHandler.SqlSelectDataSet(cmdMyQuery);
            Console.WriteLine(dtresult);

            if (dtresult.Tables[0].Rows.Count > 0)
            {
                var transDbAmount = Convert.ToString(dtresult.Tables[0].Rows[0]["AmountPaid"]);
                var dBtransId = Convert.ToString(dtresult.Tables[0].Rows[0]["TransRefNo"]);
                var dbpaymentReferenceNo = Convert.ToString(dtresult.Tables[0].Rows[0]["PaymentReference"]);
                var dbReceiptNo = Convert.ToString(dtresult.Tables[0].Rows[0]["ReceiptNo"]);
                var dbRevenueName = Convert.ToString(dtresult.Tables[0].Rows[0]["RevenueName"]);
                var dbRevenueCode = Convert.ToString(dtresult.Tables[0].Rows[0]["RevenueCode"]);
                var dbTranStatus = Convert.ToString(dtresult.Tables[0].Rows[0]["TransactionStatus"]);
                var dbTranStatusMgs = Convert.ToString(dtresult.Tables[0].Rows[0]["TransStatusMsg"]);
                var dbEmail = Convert.ToString(dtresult.Tables[0].Rows[0]["Email"]);
                Session["dBtransId"] = dBtransId;
                Session["dbpaymentReferenceNo"] = dbpaymentReferenceNo;
                Session["dbReceiptNo"] = dbReceiptNo;
                Session["dbRevenueName"] = dbRevenueName;
                Session["dbRevenueCode"] = dbRevenueCode;
                Session["dbTranStatusMgs"] = dbTranStatusMgs;
                Session["transDbAmount"] = transDbAmount;
                Session["dbEmail"] = dbEmail;
                Session["dbSurname"] = Convert.ToString(dtresult.Tables[0].Rows[0]["Surname"]);
                Session["dbOtherNames"] = Convert.ToString(dtresult.Tables[0].Rows[0]["OtherNames"]);
                Session["dbAddress"] = Convert.ToString(dtresult.Tables[0].Rows[0]["Address"]);
                Session["dbPhoneNo"] = Convert.ToString(dtresult.Tables[0].Rows[0]["PhoneNo"]);
                Session["dbAgencyName"] = Convert.ToString(dtresult.Tables[0].Rows[0]["AgencyName"]);
                Session["dbAgencyCode"] = Convert.ToString(dtresult.Tables[0].Rows[0]["AgencyCode"]);
                Session["dbPayGateWay"] = Convert.ToString(dtresult.Tables[0].Rows[0]["PayGateWay"]);
                Session["dbCountryName"] = Convert.ToString(dtresult.Tables[0].Rows[0]["CountryName"]);
                Session["dbStateName"] = Convert.ToString(dtresult.Tables[0].Rows[0]["StateName"]);
                Session["dbCity"] = Convert.ToString(dtresult.Tables[0].Rows[0]["City"]);
                Session["dbArea"] = Convert.ToString(dtresult.Tables[0].Rows[0]["Area"]);
                Session["dbLGA"] = Convert.ToString(dtresult.Tables[0].Rows[0]["LGA"]);

                if (dbTranStatus == "False" && pageSource == "FailedPage")
                {
                    bc = LogPayaNewPayInfor();
                    bc.StatusId = 1;
                }
                else if (dbTranStatus == "False")
                {
                    bc.StatusId = -1;
                    bc.StatusMessage = Session["dbTranStatusMgs"].ToString();
                }

            }
            else
            {
                bc.StatusMessage = "Amount Paid Mismatched From InterSwitch";
                var ex = new Exception($"Amount Paid Mismatched From InterSwitch - {bc.StatusMessage}");
                CreateLogFiles.ExceptionLogging.SendErrorTomail(ex,
                    HttpContext.Current.Request.Url.ToString());
                bc.StatusId = -1;
            }
            return bc;
        }
    }
}