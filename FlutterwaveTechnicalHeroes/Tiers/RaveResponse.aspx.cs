using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Net.Mail;
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
    public partial class RaveResponse : System.Web.UI.Page
    {
        private readonly Helper _helper = new Helper();
        protected void Page_Load(object sender, EventArgs e)
        {
            var bc = new MessageClass();
            if (string.IsNullOrEmpty(Convert.ToString(Session["url"])))
            {
                Response.Redirect("~/Home");
            }
            else
            {
                Geturl();
                string transactionref = null;
                if (!string.IsNullOrEmpty(Request.Params["txref"]))
                {
                    transactionref = Request.Params["txref"];
                    Session["transactionref"] = transactionref;
                }

                if (!string.IsNullOrEmpty(Convert.ToString(Session["failedPage"])) && !string.IsNullOrEmpty(Convert.ToString(Session["newTransRefNo"])))
                {
                    var transidwithsessionValid = Session["newTransRefNo"].ObjectToString();
                    Session["transidwithsessionValid"] = transidwithsessionValid;
                    bc = VerifyRaveResponse(transidwithsessionValid);
                    if (!bc.IsSuccessful)
                    {
                        Session["bcSuccessMessage"] = bc.StatusMessage;
                        Response.Redirect("~/Declined");
                    }
                    Session["bcSuccessMessage"] = bc.StatusMessage;
                    Response.Redirect("~/Successful");
                }
                else
                {
                    var transidwithsessionValid = transactionref; 
                    Session["transidwithsessionValid"] = transidwithsessionValid;
                    bc= VerifyRaveResponse(transidwithsessionValid);
                    if (!bc.IsSuccessful)
                    {
                        Session["bcSuccessMessage"] = bc.StatusMessage;
                        Response.Redirect("~/Declined");
                    }
                    Session["bcSuccessMessage"] = bc.StatusMessage;
                    Response.Redirect("~/Successful");
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
                    var institutioncode = reader["InstitutionCode"].ToString();
                    Session["InstitutionCode"] = institutioncode;
                    var merchantCode = reader["StateCode"].ToString();
                    Session["StateCode"] = merchantCode;
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

        private MessageClass VerifyRaveResponse(string dbTransValue)
        {
            var bc = new MessageClass();
            var secretKey = Global.Raveconfigs.Privatekey;
            var raveVerifyPararameters = new RavePararameters
            {
                Txref = dbTransValue,
                Secretkey = secretKey
            };

            //Instatiate the baseurl
            var client = _helper.InitializeClient();

            var content = new StringContent(JsonConvert.SerializeObject(raveVerifyPararameters), Encoding.UTF8, "application/json");
            var res = client.PostAsync("flwv3-pug/getpaidx/api/v2/verify", content).Result;
            if (res.IsSuccessStatusCode)
            {
                var messageClass = res.Content.ReadAsAsync<RaveResponseClass.ResponseObject>().Result;
                if (messageClass != null && messageClass.Status == "success" && messageClass.Data.Chargecode == "00" && messageClass.Message == "Tx Fetched")
                {
                    bc = new MessageClass();
                    try
                    {
                        bc.StatusId = 1;
                        bc.StatusMessage = $"Service return a successfully response - {messageClass.Message}";
                        var raveTransId = dbTransValue;
                        bc = CrossCheckResponse(raveTransId);
                    }
                    catch (Exception exception)
                    {
                        Console.WriteLine(exception);
                        var err = new CreateLogFiles();
                        err.ErrorLog(Server.MapPath("~/Logs/ErrorLog"), exception.Message);
                        ExceptionLogging.SendErrorTomail(exception, HttpContext.Current.Request.Url.ToString());
                        bc.StatusMessage = exception.Message;
                        bc.StatusId = -1;
                    }
                }
                else
                {
                    bc = new MessageClass();
                    try
                    {
                        if (messageClass != null) bc.StatusMessage = messageClass.Message;
                        bc = UpdateFalseTransLog(dbTransValue);
                    }
                    catch (Exception exception)
                    {
                        Console.WriteLine(exception);
                        var err = new CreateLogFiles();
                        err.ErrorLog(Server.MapPath("~/Logs/ErrorLog"), exception.Message);
                        ExceptionLogging.SendErrorTomail(exception, HttpContext.Current.Request.Url.ToString());
                        bc.StatusMessage = $"TransactionError:: {exception.Message}";
                        bc.StatusId = -1;
                    }

                    if (messageClass != null) bc.StatusMessage = messageClass.Message;
                    bc.StatusId = -1;
                    bc.StatusMessage = $"Service return a successfully response - {messageClass?.Message}";
                }

            }
            else
            {
                bc = new MessageClass();
                try
                {
                    bc = UpdateFalseTransLog(dbTransValue);
                }
                catch (Exception exception)
                {
                    Console.WriteLine(exception);
                    var err = new CreateLogFiles();
                    err.ErrorLog(Server.MapPath("~/Logs/ErrorLog"), exception.Message);
                    ExceptionLogging.SendErrorTomail(exception, HttpContext.Current.Request.Url.ToString());
                    bc.StatusMessage = $"TransactionError:: {exception.Message}";
                    bc.StatusId = -1;
                }
                bc.StatusId = -1;
                bc.StatusMessage = "Service return unsuccessful message";
            }
            return bc;
        }
        private MessageClass CrossCheckResponse(string raveTransIdValue)
        {
            var bc = new MessageClass();
            var raveTransId = raveTransIdValue;
            var cmdMyQuery = new SqlCommand("Barsh.Querr_LogTransaction") { CommandType = CommandType.StoredProcedure };
            cmdMyQuery.Parameters.AddWithValue("@TransRefNo", raveTransId);
            var dtresult = DataBaseHandler.SqlSelectDataSet(cmdMyQuery);
            Console.WriteLine(dtresult);

            if (dtresult.Tables[0].Rows.Count > 0)
            {
                var dBtransId = Convert.ToString(dtresult.Tables[0].Rows[0]["TransRefNo"]);
                if (dBtransId == raveTransIdValue)
                {
                    bc.StatusId = 1;
                    UpdateTrueTransLog(dBtransId);
                }
                else
                {
                    bc.StatusId = -1;
                    var ex = new Exception("Transaction Ref No. Mismatched From RaveSwitch");
                    CreateLogFiles.ExceptionLogging.SendErrorTomail(ex,
                        HttpContext.Current.Request.Url.ToString());
                    bc.StatusMessage = ex.Message;
                }
            }
            else
            {
                bc.StatusMessage = "Amount Paid Mismatched From RaveSwitch";
            }

            return bc;
        }
        private MessageClass UpdateTrueTransLog(string raveTransValue)
        {
            var bc = new MessageClass();
            const string gudmsg = "Successful";
            const string gudcode = "01";
            var raveTransId = raveTransValue;
            var merchantCode = Session["StateCode"].ObjectToString();
            var currentDate = DateTime.Today.ToString("ddMMyyyy");
            var generatedNo = Hash512Helper.GetDigitRandomNumbers();
            const string providername = "JAMZ";
            const string platformname = "WEB";
            var formedPaymentRef = merchantCode + "|" + providername + "|" + platformname + "|" + currentDate + "|" + generatedNo;
            const string receiptPrefix = "372";
            var formatedReceiptNo = receiptPrefix + string.Join(string.Empty, generatedNo.Skip(2));

            var commandToExecute = new SqlCommand("Barsh.UpdateTrue_LogTransaction") { CommandType = CommandType.StoredProcedure };
            commandToExecute.Parameters.AddWithValue("@TransRefNo", raveTransId);
            commandToExecute.Parameters.AddWithValue("@TransStatusMsg", gudmsg);
            commandToExecute.Parameters.AddWithValue("@TransStatusCode", gudcode);
            commandToExecute.Parameters.AddWithValue("@PaymentReference", formedPaymentRef);
            commandToExecute.Parameters.AddWithValue("@ReceiptNo", formatedReceiptNo);
            var recCount = DataBaseHandler.ExecuteSqlCommand(commandToExecute);
            bc.StatusId = recCount > 0 ? 1 : 0;
            if (recCount > 0)
            {
                SendGudTransDetailsEmail(raveTransId);
            }
            else
            {
                bc.StatusMessage = "Unable to update successful payment";
            }

            return bc;

        }
        private MessageClass UpdateFalseTransLog(string raveTransValue)
        {
            var bc = new MessageClass();
            const string failmsg = "Declined";
            const string failcode = "-1";
            var raveTransId = raveTransValue;
            var commandToExecute = new SqlCommand("Barsh.UpdateFalse_LogTransaction") { CommandType = CommandType.StoredProcedure };
            commandToExecute.Parameters.AddWithValue("@TransRefNo", raveTransId);
            commandToExecute.Parameters.AddWithValue("@TransStatusMsg", failmsg);
            commandToExecute.Parameters.AddWithValue("@TransStatusCode", failcode);
            var recCount = DataBaseHandler.ExecuteSqlCommand(commandToExecute);
            bc.StatusId = recCount > 0 ? 1 : 0;
            if (recCount > 0)
            {
                bc.StatusId = 1;
                SendFailTransDetailsEmail(raveTransId);
            }
            else
            {
                bc.StatusMessage = "Unable to update declined payment";
                bc.StatusId = -1;
            }
            return bc;
        }

        #region This code user to Email Sending Server.MapPath "Event.html" mailbody.Replace using html email templates
        private MessageClass SendGudTransDetailsEmail(string dBtransId)
        {
            var bc = new MessageClass();
            var cmdMyQuery = new SqlCommand("Barsh.QuerryAll_LogTransaction") { CommandType = CommandType.StoredProcedure };
            cmdMyQuery.Parameters.AddWithValue("@TransRefNo", dBtransId);
            var dtresult = DataBaseHandler.SqlSelectDataSet(cmdMyQuery);
            Console.WriteLine(dtresult);

            if (dtresult.Tables[0].Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(Session["url"].ToString()) || !string.IsNullOrEmpty(Session["StateName"].ToString()))
                {
                    var payGateWay = Session["url"].ToString();
                    var stateName = Session["StateName"].ToString();
                    var transDbAmount = Convert.ToDecimal(dtresult.Tables[0].Rows[0]["AmountPaid"]);
                    var transDbAmtfinal = $"{transDbAmount:n2}";
                    var fullpayername = Convert.ToString(dtresult.Tables[0].Rows[0]["Surname"]) + " " + Convert.ToString(dtresult.Tables[0].Rows[0]["OtherNames"]);
                    var address = Convert.ToString(dtresult.Tables[0].Rows[0]["Address"]) + " " + Convert.ToString(dtresult.Tables[0].Rows[0]["Area"]) + " " + Convert.ToString(dtresult.Tables[0].Rows[0]["City"]) + " , " + Convert.ToString(dtresult.Tables[0].Rows[0]["LGA"]) + " LGA " + " , " + Convert.ToString(dtresult.Tables[0].Rows[0]["StateName"]) + " , " + Convert.ToString(dtresult.Tables[0].Rows[0]["CountryName"]);
                    const string gudreturnmsg = "Transaction Successful";
                    var filename = Server.MapPath("~/Tiers/PayResponseMail.html");
                    var mailbody = System.IO.File.ReadAllText(filename);
                    mailbody = mailbody.Replace("##PayerName##", fullpayername);
                    mailbody = mailbody.Replace("##DateCreated##", Convert.ToString(dtresult.Tables[0].Rows[0]["DateCreated"]));
                    mailbody = mailbody.Replace("##TransRefNo##", Convert.ToString(dtresult.Tables[0].Rows[0]["TransRefNo"]));
                    mailbody = mailbody.Replace("##PaymentRefNo##", Convert.ToString(dtresult.Tables[0].Rows[0]["PaymentReference"]));
                    mailbody = mailbody.Replace("##ReciptNo##", Convert.ToString(dtresult.Tables[0].Rows[0]["ReceiptNo"]));
                    mailbody = mailbody.Replace("##Address##", address);
                    mailbody = mailbody.Replace("##RevenueName##", Convert.ToString(dtresult.Tables[0].Rows[0]["RevenueName"]));
                    mailbody = mailbody.Replace("##RevenueCode##", Convert.ToString(dtresult.Tables[0].Rows[0]["RevenueCode"]));
                    mailbody = mailbody.Replace("##AmountPaid##", transDbAmtfinal);
                    mailbody = mailbody.Replace("##TransStatusMsg##", gudreturnmsg);
                    mailbody = mailbody.Replace("##StateUrl##", payGateWay);
                    mailbody = mailbody.Replace("##StateName##", stateName);
                    mailbody = mailbody.Replace("##ActivationLink##", "'" + Request.Url.AbsoluteUri.Replace("RaveResponse", "Tiers/RequerryTransaction.aspx?ActivationCode=" + Convert.ToString(dtresult.Tables[0].Rows[0]["TransRefNo"])) + "'");
                    var to = Convert.ToString(dtresult.Tables[0].Rows[0]["Email"]);
                    var from = ConfigurationManager.AppSettings["UserEmail"];

                    if (!string.IsNullOrWhiteSpace(to))
                    {
                        var message = new MailMessage(from, to)
                        {
                            Subject = "TaxOnline Payment Details",
                            Body = mailbody,
                            BodyEncoding = Encoding.UTF8,
                            IsBodyHtml = true
                        };
                        var client = new SmtpClient(ConfigurationManager.AppSettings["Host"], Convert.ToInt32(ConfigurationManager.AppSettings["Port"]));
                        var basicCredential = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["UserEmail"], ConfigurationManager.AppSettings["Password"]);
                        client.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                        client.UseDefaultCredentials = true;
                        client.Credentials = basicCredential;
                        try
                        {
                            client.Send(message);
                            bc.StatusId = 1;
                        }
                        catch (Exception exception)
                        {
                            Console.WriteLine(exception);
                            var err = new CreateLogFiles();
                            err.ErrorLog(Server.MapPath("~/Logs/ErrorLog"), exception.Message);
                            ExceptionLogging.SendErrorTomail(exception, HttpContext.Current.Request.Url.ToString());
                            //isError = true;
                            bc.StatusMessage = "Error sending mail to your specified email address";
                        }
                    }
                    else
                    {
                        bc.StatusMessage = "Error sending mail to your specified email address";
                    }
                }
                else
                {
                    bc.StatusMessage = "Invalid merchant address";
                    Console.WriteLine("Invalid merchant address");
                }

            }
            else
            {
                bc.StatusMessage = "Error fetching transaction records";
            }

            return bc;
        }
        private MessageClass SendFailTransDetailsEmail(string dBtransId)
        {
            var bc = new MessageClass();
            var cmdMyQuery = new SqlCommand("Barsh.QuerryAll_LogTransaction") { CommandType = CommandType.StoredProcedure };
            cmdMyQuery.Parameters.AddWithValue("@TransRefNo", dBtransId);
            var dtresult = DataBaseHandler.SqlSelectDataSet(cmdMyQuery);
            Console.WriteLine(dtresult);

            if (dtresult.Tables[0].Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(Session["url"].ToString()) || !string.IsNullOrEmpty(Session["StateName"].ToString()))
                {
                    var payGateWay = Session["url"].ToString();
                    var stateName = Session["StateName"].ToString();
                    var transDbAmount = Convert.ToDecimal(dtresult.Tables[0].Rows[0]["AmountPaid"]);
                    var transDbAmtfinal = $"{transDbAmount:n2}";
                    var fullpayername = Convert.ToString(dtresult.Tables[0].Rows[0]["Surname"]) + " " + Convert.ToString(dtresult.Tables[0].Rows[0]["OtherNames"]);
                    var address = Convert.ToString(dtresult.Tables[0].Rows[0]["Address"]) + " " + Convert.ToString(dtresult.Tables[0].Rows[0]["Area"]) + " " + Convert.ToString(dtresult.Tables[0].Rows[0]["City"]) + " , " + Convert.ToString(dtresult.Tables[0].Rows[0]["LGA"]) + " LGA " + " , " + Convert.ToString(dtresult.Tables[0].Rows[0]["StateName"]) + " , " + Convert.ToString(dtresult.Tables[0].Rows[0]["CountryName"]);
                    const string messages = "(Payment not successful)";
                    var transactionStatus = !string.IsNullOrWhiteSpace(dtresult.Tables[0].Rows[0]["TransStatusMsg"].ToString()) ? Convert.ToString(dtresult.Tables[0].Rows[0]["TransStatusMsg"]) : null;
                    var finalmessage = transactionStatus + messages;

                    var filename = Server.MapPath("~/Tiers/PayResponseMail.html");
                    var mailbody = System.IO.File.ReadAllText(filename);
                    mailbody = mailbody.Replace("##PayerName##", fullpayername);
                    mailbody = mailbody.Replace("##DateCreated##", Convert.ToString(dtresult.Tables[0].Rows[0]["DateCreated"]));
                    mailbody = mailbody.Replace("##TransRefNo##", Convert.ToString(dtresult.Tables[0].Rows[0]["TransRefNo"]));
                    mailbody = mailbody.Replace("##PaymentRefNo##", !string.IsNullOrWhiteSpace(dtresult.Tables[0].Rows[0]["PaymentReference"].ToString()) ? Convert.ToString(dtresult.Tables[0].Rows[0]["PaymentReference"]) : null);
                    mailbody = mailbody.Replace("##ReciptNo##", !string.IsNullOrWhiteSpace(dtresult.Tables[0].Rows[0]["ReceiptNo"].ToString()) ? Convert.ToString(dtresult.Tables[0].Rows[0]["ReceiptNo"]) : null);
                    mailbody = mailbody.Replace("##TransStatusMsg##", finalmessage);
                    mailbody = mailbody.Replace("##Address##", address);
                    mailbody = mailbody.Replace("##RevenueName##", Convert.ToString(dtresult.Tables[0].Rows[0]["RevenueName"]));
                    mailbody = mailbody.Replace("##RevenueCode##", Convert.ToString(dtresult.Tables[0].Rows[0]["RevenueCode"]));
                    mailbody = mailbody.Replace("##AmountPaid##", transDbAmtfinal);
                    mailbody = mailbody.Replace("##StateUrl##", payGateWay);
                    mailbody = mailbody.Replace("##StateName##", stateName);
                    mailbody = mailbody.Replace("##ActivationLink##", "'" + Request.Url.AbsoluteUri.Replace("RaveResponse", "Tiers/RequerryTransaction.aspx?ActivationCode=" + Convert.ToString(dtresult.Tables[0].Rows[0]["TransRefNo"])) + "'");
                    var to = Convert.ToString(dtresult.Tables[0].Rows[0]["Email"]);
                    var from = ConfigurationManager.AppSettings["UserEmail"];

                    if (!string.IsNullOrWhiteSpace(to))
                    {
                        var message = new MailMessage(from, to)
                        {
                            Subject = "TaxOnline Payment Details",
                            Body = mailbody,
                            BodyEncoding = Encoding.UTF8,
                            IsBodyHtml = true
                        };
                        var client = new SmtpClient(ConfigurationManager.AppSettings["Host"], Convert.ToInt32(ConfigurationManager.AppSettings["Port"]));
                        var basicCredential = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["UserEmail"], ConfigurationManager.AppSettings["Password"]);
                        client.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                        client.UseDefaultCredentials = true;
                        client.Credentials = basicCredential;
                        try
                        {
                            client.Send(message);
                        }
                        catch (Exception exception)
                        {
                            Console.WriteLine(exception);
                            var err = new CreateLogFiles();
                            err.ErrorLog(Server.MapPath("~/Logs/ErrorLog"), exception.Message);
                            ExceptionLogging.SendErrorTomail(exception, HttpContext.Current.Request.Url.ToString());
                            //isError = true;
                            bc.StatusMessage = "Error sending mail to your specified email address";
                        }
                    }
                    else
                    {
                        bc.StatusMessage = "Error sending mail to your specified email address";
                    }
                }
                else
                {
                    bc.StatusMessage = "Invalid merchant address";
                    Console.WriteLine("Invalid merchant address");
                }

            }
            else
            {
                bc.StatusMessage = "Error fetching transaction records";
            }

            return bc;
        }
        #endregion
    }
}