using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net.Http;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using FlutterwaveTechnicalHeroes.ErrorLog;
using FlutterwaveTechnicalHeroes.MessageHandler;
using FlutterwaveTechnicalHeroes.SqlDbUtilities;
using FlutterwaveTechnicalHeroes.WebApiConnector;
using Newtonsoft.Json;

namespace FlutterwaveTechnicalHeroes.Tiers
{
    public partial class PaymentDetails : System.Web.UI.Page
    {
        private readonly Helper _helper = new Helper();
        protected void Page_Load(object sender, EventArgs e)
        {
            var bc = new MessageClass();
            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(Convert.ToString(Session["StateName"])) || string.IsNullOrEmpty(Convert.ToInt32(Session["DbGateWayID"]).ObjectToString()))
                {
                    Response.Redirect("~/Home");
                }
                else
                {
                    Geturl();
                    LblStateName.Text = Session["StateName"].ObjectToString();
                    DisplayPayerInfo();
                    
                    var query = "select CountryId, CountryName from Country";
                    BindDropDownList(ddlCountries, query, "CountryName", "CountryId", "Select Country");
                    ddlStates.Enabled = false;
                    ddlCities.Enabled = false;
                    ddlStates.Items.Insert(0, new ListItem("Select State", "0"));
                    ddlCities.Items.Insert(0, new ListItem("Select City", "0"));
                }

            }
        }
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
                    LblUrlInstcode.Text = reader["InstitutionCode"].ToString();
                    Session["InstitutionCode"] = LblUrlInstcode.Text;
                    LbluseUrl.Text = reader["StateUrlName"].ToString();
                    Session["StateUrlName"] = LbluseUrl.Text;
                    Session["url"] = LbluseUrl.Text;
                    LblDbGatewayName.Text = reader["GateWayID"].ToString();
                    Session["DbGateWayID"] = LblDbGatewayName.Text;
                    LblStateCode.Text = reader["StateCode"].ToString();
                    Session["StateCode"] = LblStateCode.Text;
                    LblStateName.Text = reader["StateName"].ToString();
                    Session["StateName"] = LblStateName.Text;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                var err = new CreateLogFiles();
                err.ErrorLog(Server.MapPath("~/Logs/ErrorLog"), ex.Message);
                CreateLogFiles.ExceptionLogging.SendErrorTomail(ex,
                    HttpContext.Current.Request.Url.ToString());
            }

        }
        // To get url
        private MessageClass BindDropDownList(ListControl ddl, string query, string text, string value, string defaultText)
        {
            var bc = new MessageClass();
            var conString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            var cmd = new SqlCommand(query);
            using (var con = new SqlConnection(conString))
            {
                using (new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    con.Open();
                    ddl.DataSource = cmd.ExecuteReader();
                    ddl.DataTextField = text;
                    ddl.DataValueField = value;
                    ddl.DataBind();
                    con.Close();
                }
            }
            ddl.Items.Insert(0, new ListItem(defaultText, "0"));
            return bc;
        }

        [WebMethod]
        public static ArrayList PopulateState(int countryId)
        {
            var list = new ArrayList();
            var strConnString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            using (var con = new SqlConnection(strConnString))
            {
                using (var cmd = new SqlCommand("[Barsh].[Querr_StateBasedOnCountry]", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CountryId", countryId);
                    cmd.Connection = con;
                    con.Open();
                    var sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        list.Add(new ListItem(
                       sdr["StateName"].ToString(),
                       sdr["StateId"].ToString()
                        ));
                    }
                    con.Close();
                    return list;
                }
            }
        }

        [WebMethod]
        public static ArrayList PopulateLga(int stateId)
        {
            var list = new ArrayList();
            var strConnString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            using (var con = new SqlConnection(strConnString))
            {
                using (var cmd = new SqlCommand("[Barsh].[Querr_LgaBasedOnState]", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@StateId", stateId);
                    cmd.Connection = con;
                    con.Open();
                    var sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        list.Add(new ListItem(
                       sdr["LgaName"].ToString(),
                       sdr["LgaId"].ToString()
                        ));
                    }
                    con.Close();
                    return list;
                }
            }
        }
        private void DisplayPayerInfo()
        {
            var isError = false;
            var bc = new MessageClass();
            try
            {
                Lblpayersurname.Value = string.Empty;
                LblpayerOtherNames.Value = string.Empty;
                txtOtherState.Value = string.Empty;
                txtCityName.Value = string.Empty;
                LblpayerArea.Value = string.Empty;
                txtStrtNo.Value = string.Empty;
                txtlga.Value = string.Empty;
                txtEmail.Value = string.Empty;
                Txbphone.Value = string.Empty; 
                HiddenFieldEnteredUtinAssRefNo.Value = "";
                HiddenFieldUTIN.Value = "";
                Lbltransref.Text = Session["transidno"].ObjectToString();
                HftransRefNo.Value = Session["transidno"].ObjectToString();
                Lblstatusmsg.Text = "False";
                Lblstatusmsg.Visible = false;
                Panelpayamt.Enabled = true;
                Panelpayamt.Visible = true;
                HiddenFieldAgencyName.Value = Session["agencyName"].ObjectToString();
                LblAgencyNameShow.Text = Session["agencyName"].ObjectToString();
                HiddenFieldAgencycode.Value = Session["agencyID"].ObjectToString();
                LblRevenueName.Text = Session["revenueName"].ObjectToString();
                HiddenFieldRevenueName.Value = Session["revenueName"].ObjectToString();
                HiddenFieldRevenueCode.Value = Session["revenueID"].ObjectToString();
                HiddenFieldPayer.Value = Session["Payer"].ObjectToString();
            }

            catch (Exception exception)
            {
                Console.WriteLine(exception);
                var err = new CreateLogFiles();
                err.ErrorLog(Server.MapPath("~/Logs/ErrorLog"), exception.Message);
                ExceptionLogging.SendErrorTomail(exception, HttpContext.Current.Request.Url.ToString());
                bc.StatusMessage = exception.Message;
                bc.StatusId = -1;
                isError = true;
            }
            if (!isError) return;
            Response.Redirect("~/ErrorPage");
        }
        private void ProceedToPayment()
        {
            var bc = new MessageClass();
            var isError = false;
            try
            {
                bc = LogPayaPayInfor();
                bc.StatusId = 1;
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                var err = new CreateLogFiles();
                err.ErrorLog(Server.MapPath("~/Logs/ErrorLog"), exception.Message);
                ExceptionLogging.SendErrorTomail(exception, HttpContext.Current.Request.Url.ToString());
                bc.StatusMessage = exception.Message;
                bc.StatusId = -1;
                isError = true;
            }

            if (bc.IsSuccessful)
            {
                if (!string.IsNullOrEmpty(Convert.ToString(Session["InstitutionCode"])))
                {
                    bc = Selectgateway();
                }
                else
                {
                    bc.StatusMessage = "Invalid Institution Code";
                    bc.StatusId = -1;
                    isError = true;
                }
            }

            if (!isError) return;
            Response.Redirect("~/ErrorPage");
        }
        private MessageClass Selectgateway()
        {
            var bc = new MessageClass();
            var gateWayId = Session["DbGateWayID"].ObjectToString();
            if (gateWayId == Global.Raveconfigs.RaveSwitchGateWayId)
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
            return bc;
        }
        private MessageClass RaveGateWay()
        {
            var bc = new MessageClass();
            var xpresspaytransIds = Session["transidno"].ObjectToString();
            var icmapublickey = Global.Raveconfigs.Publickey;
            var icmaprivatekey = Global.Raveconfigs.Privatekey;
            var decodedicmaprivatekey = Hash512Helper.GenerateSha256String(icmaprivatekey);
            var stateUrl = Session["url"].ObjectToString();
            var baseUrl = Request.Url.GetLeftPart(UriPartial.Authority);
            var returnUrl = baseUrl + "/" + Global.Raveconfigs.Callbackurl;
            var callbackurl = returnUrl;
            const string proceedButton = "Proceed to payment";

            //Get parameter to post
            var ravePararameters = new RavePararameters
            {
                Txref = xpresspaytransIds,
                PbfPubKey = icmapublickey,
                CustomerEmail = txtEmail.Value,
                Amount = Convert.ToDecimal(txtpayeamt.Text).ToString(CultureInfo.InvariantCulture),
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
        private MessageClass AccessPayGate()
        {
            var bc = new MessageClass();
            var gateWayId = Session["DbGateWayID"].ObjectToString();
            if (gateWayId == Global.Raveconfigs.RaveSwitchGateWayId)
            {
                Session["RevenueName"] = HiddenFieldRevenueName.Value;
                Session["txtpayeamt"] = txtpayeamt.Text;
                bc = RaveGateWay();
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
       
        private MessageClass LogPayaPayInfor()
        {
            var bc = new MessageClass();
            var amountpaid = $"{Convert.ToDecimal(txtpayeamt.Text):n2}";

            var countryId = int.Parse(ddlCountries.SelectedItem.Value);
            if (countryId != 161)
            {
                var statename = txtOtherState.Value;
                Session["statename"] = statename;
                var lga = txtlga.Value;
                Session["lga"] = lga;
            }
            else
            {
                Session["statename"] = HfSelectedStateItem.Value;
                Session["lga"] = HfSelectedLgaItem.Value;
            }

            HiddenFieldAgencyName.Value = Session["agencyName"].ObjectToString();
            LblAgencyNameShow.Text = Session["agencyName"].ObjectToString();
            HiddenFieldAgencycode.Value = Session["agencyID"].ObjectToString();
            if (!string.IsNullOrEmpty(Convert.ToString(Session["InstitutionCode"])))
            {
                var instutud = Convert.ToString(Session["InstitutionCode"]);
                var commandToExecute = new SqlCommand("Barsh.LogTransaction_InsertOrUpdate") { CommandType = CommandType.StoredProcedure };
                commandToExecute.Parameters.AddWithValue("@TransRefNo", Lbltransref.Text);
                commandToExecute.Parameters.AddWithValue("@Surname", Lblpayersurname.Value);
                commandToExecute.Parameters.AddWithValue("@OtherNames", LblpayerOtherNames.Value);
                commandToExecute.Parameters.AddWithValue("@Address", txtStrtNo.Value);
                commandToExecute.Parameters.AddWithValue("@Email", txtEmail.Value);
                commandToExecute.Parameters.AddWithValue("@PhoneNo", Txbphone.Value);
                commandToExecute.Parameters.AddWithValue("@RevenueName", LblRevenueName.Text);
                commandToExecute.Parameters.AddWithValue("@RevenueCode", HiddenFieldRevenueCode.Value);
                commandToExecute.Parameters.AddWithValue("@AgencyName", HiddenFieldAgencyName.Value);
                commandToExecute.Parameters.AddWithValue("@AgencyCode", HiddenFieldAgencycode.Value);
                commandToExecute.Parameters.AddWithValue("@AmountPaid", Convert.ToDecimal(txtpayeamt.Text));
                commandToExecute.Parameters.AddWithValue("@PayGateWay", LblStateName.Text);
                commandToExecute.Parameters.AddWithValue("@institutionCode", instutud);
                commandToExecute.Parameters.AddWithValue("@CountryName", ddlCountries.SelectedItem.Text);
                commandToExecute.Parameters.AddWithValue("@StateName", Session["statename"].ToString());
                commandToExecute.Parameters.AddWithValue("@LGA", Session["lga"].ObjectToString());
                commandToExecute.Parameters.AddWithValue("@City", txtCityName.Value);
                commandToExecute.Parameters.AddWithValue("@Area", LblpayerArea.Value);
                commandToExecute.Parameters.AddWithValue("@payerpayperiod", lblpayperiod.Value);

                var recCount = DataBaseHandler.ExecuteSqlCommand(commandToExecute);
                bc.StatusId = recCount > 0 ? 1 : 0;
                if (recCount > 0)
                {
                    bc = AccessPayGate();
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
                bc.StatusMessage = "No valid route found";
                bc.StatusId = -1;
            }

            var transRefNo = Lbltransref.Text.Trim();
            SendGudTransDetailsEmail(transRefNo);
            return bc;
        }
        protected void BtnSubPayment_OnClick(object sender, EventArgs e)
        {
            ProceedToPayment();
        }

        #region This code user to Email Sending Server.MapPath "Event.html" mailbody.Replace using html email templates
        private void SendGudTransDetailsEmail(string dBtransId)
        {
            var bc = new MessageClass();
            var cmdMyQuery = new SqlCommand("Barsh.QuerryAll_LogTransaction") { CommandType = CommandType.StoredProcedure };
            cmdMyQuery.Parameters.AddWithValue("@TransRefNo", dBtransId);
            var dtresult = DataBaseHandler.SqlSelectDataSet(cmdMyQuery);
            Console.WriteLine(dtresult);

            if (dtresult.Tables[0].Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(Session["url"].ObjectToString()) || !string.IsNullOrEmpty(Session["StateName"].ObjectToString()))
                {
                    var payGateWay = Session["url"].ObjectToString();
                    var stateName = Convert.ToString(dtresult.Tables[0].Rows[0]["PayGateWay"]);
                    var transDbAmount = Convert.ToDecimal(dtresult.Tables[0].Rows[0]["AmountPaid"]);
                    var transDbAmtfinal = $"{transDbAmount:n2}";
                    var transDbMail = Convert.ToString(dtresult.Tables[0].Rows[0]["Email"]);
                    var fullpayername = Convert.ToString(dtresult.Tables[0].Rows[0]["Surname"]) + " " + Convert.ToString(dtresult.Tables[0].Rows[0]["OtherNames"]);
                    var address = Convert.ToString(dtresult.Tables[0].Rows[0]["Address"]) + " " + Convert.ToString(dtresult.Tables[0].Rows[0]["Area"]) + " " + Convert.ToString(dtresult.Tables[0].Rows[0]["City"]) + " , " + Convert.ToString(dtresult.Tables[0].Rows[0]["LGA"]) + " LGA " + " , " + Convert.ToString(dtresult.Tables[0].Rows[0]["StateName"]) + " , " + Convert.ToString(dtresult.Tables[0].Rows[0]["CountryName"]);
                    var filename = Server.MapPath("~/Tiers/PrePaymentNotificationEmail.html");
                    var mailbody = System.IO.File.ReadAllText(filename);
                    mailbody = mailbody.Replace("##PayerName##", fullpayername); 
                    mailbody = mailbody.Replace("##DateCreated##", Convert.ToString(dtresult.Tables[0].Rows[0]["DateCreated"]));
                    mailbody = mailbody.Replace("##TransRefNo##", Convert.ToString(dtresult.Tables[0].Rows[0]["TransRefNo"]));
                    mailbody = mailbody.Replace("##Address##", address); 
                    mailbody = mailbody.Replace("##AmountPaid##", transDbAmtfinal);
                    mailbody = mailbody.Replace("##StateUrl##", payGateWay);
                    mailbody = mailbody.Replace("##StateName##", stateName);
                    mailbody = mailbody.Replace("##ActivationLink##", "'" + Request.Url.AbsoluteUri.Replace("PayerDetails", "Tiers/RequerryTransaction.aspx?ActivationCode=" + Convert.ToString(dtresult.Tables[0].Rows[0]["TransRefNo"])) + "'");

                    var receivermail = transDbMail;
                    if (!IsValidEmailAddress(receivermail))
                    {
                        var cs = this.ClientScript;
                        cs.RegisterStartupScript(this.GetType(), "Attention", "alert('Your email address seems incorrect. Please try again.')", true);
                    }
                    else
                    {
                        var to = Convert.ToString(receivermail);
                        var from = ConfigurationManager.AppSettings["UserEmail"];

                        if (!string.IsNullOrWhiteSpace(to))
                        {
                            var message = new MailMessage(from, to)
                            {
                                Subject = "Online Pre-Payment Notification",
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
        }
        #endregion

        private bool IsValidEmailAddress(string email)
        {
            try
            {
                var emailChecked = new MailAddress(email);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}