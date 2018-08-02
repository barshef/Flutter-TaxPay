using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FlutterwaveTechnicalHeroes.ErrorLog;
using FlutterwaveTechnicalHeroes.MessageHandler;
using FlutterwaveTechnicalHeroes.SqlDbUtilities;

namespace FlutterwaveTechnicalHeroes.Tiers
{
    public partial class SuccessTrans : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LblPartialMsg.Visible = false;
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
            //try
            //{
            if (IsLocal)
            {
                Response.Redirect("~/Home");
            }
            else
            {
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
                    var statename = reader["StateName"].ToString();
                    Session["statename"] = statename;
                    var xresponseTransId = Session["transidno"].ObjectToString();
                    if (string.IsNullOrWhiteSpace(xresponseTransId))
                    {
                        LblStateName.Text = Session["statename"].ToString();
                        LblPartialMsg.Visible = true;
                        btnthirdpartyemail.Visible = false;
                        txtthirdpartyemail.Visible = false;
                        sendMail.Visible = false;
                        Btnsubmit.Visible = false;
                    }
                    else
                    {
                        DisplaySuccessInfo();
                    }
                }
                else
                {
                    Response.Redirect("~/Home");
                }
                con.Close();
            }

        }
        // To get url
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
                    mailbody = mailbody.Replace("##ActivationLink##", "'" + Request.Url.AbsoluteUri.Replace("Successful", "Tiers/RequerryTransaction.aspx?ActivationCode=" + Convert.ToString(dtresult.Tables[0].Rows[0]["TransRefNo"])) + "'");

                    var thirdpartyEmail = Session["txtthirdpartyemail"].ObjectToString();

                    if (!IsValidEmailAddress(thirdpartyEmail))
                    {
                        LblMsg.Text = "Your email address seems incorrect. Please try again";
                        LblMsg.Visible = true;
                    }
                    else
                    {
                        var to = Convert.ToString(thirdpartyEmail);
                        var from = ConfigurationManager.AppSettings["UserEmail"];

                        if (!string.IsNullOrWhiteSpace(to))
                        {
                            var message = new MailMessage(from, to)
                            {
                                Subject = "Online Payment Details",
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
                                bc.StatusMessage = "Error sending mail to your specified email address";
                            }
                        }
                        else
                        {
                            bc.StatusMessage = "Error sending mail to your specified email address";
                        }
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
        protected void btnthirdpartyemail_ServerClick(object sender, EventArgs e)
        {
            txtthirdpartyemail.Visible = true;
            sendMail.Visible = true;
            btnthirdpartyemail.Visible = false;
        }
        protected void sendMail_ServerClick(object sender, EventArgs e)
        {
            var email = txtthirdpartyemail.Text.Trim();
            var bc = new MessageClass();
            if (!string.IsNullOrEmpty(email))
            {
                if (!IsValidEmailAddress(email))
                {
                    LblMsg.Text = "Please enter valid email address";
                    LblMsg.Visible = true;
                    return;
                }
                Session["txtthirdpartyemail"] = email;
                var dBtransId = Session["dBtransId"].ObjectToString();
                bc = SendGudTransDetailsEmail(dBtransId);

            }
            else
            {
                LblMsg.Text = "Please enter valid email address";
                LblMsg.Visible = true;
                return;
            }
            if (bc.IsSuccessful)
            {
                LblMsg.Text = "Email sent successfully";
                LblMsg.Visible = true;
                txtthirdpartyemail.Visible = false;
                sendMail.Visible = false;
                btnthirdpartyemail.Visible = true;
            }
            else
            {
                LblMsg.Text = "Email not sent, please try again";
                LblMsg.Visible = true;
            }
        }

        private bool IsValidEmailAddress(string email)
        {
            try
            {
                var emailChecked = new System.Net.Mail.MailAddress(email);
                return true;
            }
            catch
            {
                return false;
            }
        }

        [ToolboxData("<{0}:EmailValidator runat=server></{0}:EmailValidator>")]
        public class EmailValidator : BaseValidator
        {
            protected override bool EvaluateIsValid()
            {
                string val = this.GetControlValidationValue(this.ControlToValidate);
                string pattern = @"^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z][a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$";
                Match match = Regex.Match(val.Trim(), pattern, RegexOptions.IgnoreCase);

                if (match.Success)
                {

                    return true;
                }
                else
                {
                    return false;
                }

            }
        }

        private MessageClass DisplaySuccessInfo()
        {
            var bc = new MessageClass();
            if (!string.IsNullOrEmpty(Convert.ToString(Session["failedPage"])) && !string.IsNullOrEmpty(Convert.ToString(Session["newTransRefNo"])))
            {
                var transidwithsessionValid = Session["newTransRefNo"].ObjectToString();
                Session["transidwithsessionValid"] = transidwithsessionValid;
            }
            else
            {
                var transidwithsessionValid = Session["transidno"].ObjectToString();
                Session["transidwithsessionValid"] = transidwithsessionValid;
            }
            var xresponseTransId = Session["transidwithsessionValid"].ObjectToString();
            var cmdMyQuery = new SqlCommand("Barsh.Querr_LogTransaction") { CommandType = CommandType.StoredProcedure };
            cmdMyQuery.Parameters.AddWithValue("@TransRefNo", xresponseTransId);
            var dtresult = DataBaseHandler.SqlSelectDataSet(cmdMyQuery);
            Console.WriteLine(dtresult);

            if (dtresult != null && dtresult.Tables.Count > 0 && dtresult.Tables[0].Rows.Count > 0)
            {
                var transDbAmount = Convert.ToString(dtresult.Tables[0].Rows[0]["AmountPaid"]);
                var dBtransId = Convert.ToString(dtresult.Tables[0].Rows[0]["TransRefNo"]);
                var dbpaymentReferenceNo = Convert.ToString(dtresult.Tables[0].Rows[0]["PaymentReference"]);
                var dbReceiptNo = Convert.ToString(dtresult.Tables[0].Rows[0]["ReceiptNo"]);
                var dbAgencyName = Convert.ToString(dtresult.Tables[0].Rows[0]["AgencyName"]);
                var dbDateCreated = dtresult.Tables[0].Rows[0]["DateCreated"];
                var dbRevenueName = Convert.ToString(dtresult.Tables[0].Rows[0]["RevenueName"]);
                var dbStateName = Convert.ToString(dtresult.Tables[0].Rows[0]["PayGateWay"]);
                var dbAmtPaid = Convert.ToString(dtresult.Tables[0].Rows[0]["AmountPaid"]);
                var fullpayername = Convert.ToString(dtresult.Tables[0].Rows[0]["Surname"]) + " " + Convert.ToString(dtresult.Tables[0].Rows[0]["OtherNames"]);
                Session["dBtransId"] = dBtransId;
                Session["dbpaymentReferenceNo"] = dbpaymentReferenceNo;
                Session["dbReceiptNo"] = dbReceiptNo;
                var resultwithoutComma = $"{transDbAmount.Replace(",", "").Replace(".", "")}";
                Session["transDbAmount"] = transDbAmount;
                bc.StatusId = 1;

                LblDateTime.Text = dbDateCreated.ToString();
                var amtspaid = Convert.ToDouble(dbAmtPaid) / 100;  
                var ghghh = amtspaid.ToString("N2");
                var amtpaid1 = $"{amtspaid:n2}"; //Output: 1,234.00
                var formatedamtspaid = Convert.ToDouble(dbAmtPaid);
                var amtpaid = $"{formatedamtspaid:n2}"; //Output: 1,234.00
                txtthirdpartyemail.Visible = false;
                sendMail.Visible = false;
                Lblamtpaid.Text = amtpaid;
                LblPayerName.Text = fullpayername;
                Lbltransrefno.Text = dbpaymentReferenceNo;
                LblReceiptNo.Text = dbReceiptNo;
                LblAgencyName.Text = dbAgencyName;
                LblStateName.Text = dbStateName;

                LblRevName.Text = !string.IsNullOrEmpty(Convert.ToString(Session["RevenueName"])) ? Session["RevenueName"].ToString() : dbRevenueName;
            }
            else
            {
                bc.StatusMessage = "Transaction Ref. No. does not exist, please try again.";
                bc.StatusId = -1;
                LblMsg.Text = bc.StatusMessage;
            }

            return bc;
        }

        protected void btnhome_OnServerClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Home");
        }
    }
}