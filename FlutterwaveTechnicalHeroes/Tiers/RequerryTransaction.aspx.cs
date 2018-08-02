using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FlutterwaveTechnicalHeroes.ErrorLog;
using FlutterwaveTechnicalHeroes.MessageHandler;
using FlutterwaveTechnicalHeroes.SqlDbUtilities;

namespace FlutterwaveTechnicalHeroes.Tiers
{
    public partial class RequerryTransaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var activationCode = !string.IsNullOrEmpty(Request.QueryString["ActivationCode"]) ? Request.QueryString["ActivationCode"] : null;
                if (activationCode == null)
                {
                    //Response.Redirect("~/Home");
                }
                else
                {
                    Session["EmailTransId"] = activationCode;
                    TransactionStatusEmail();
                }
            }
        }
        protected void BtnSearches_OnServerClick(object sender, EventArgs e)
        {
            var bc = new MessageClass();
            try
            {
                if (string.IsNullOrWhiteSpace(utinorasstref.Text))
                {
                    LblMsg.Text = "Please enter valid Transaction Ref. Number";
                    LblMsg.Visible = true;
                    utinorasstref.Text = "";
                    utinorasstref.Focus();
                    return;
                }
                bc = CrossCheckEntries();
            }
            catch
            {
                var ex = new Exception($"Something went wrong when try querry transaction - {bc?.StatusMessage}");
                CreateLogFiles.ExceptionLogging.SendErrorTomail(ex,
                    HttpContext.Current.Request.Url.ToString());
            }

            if (bc.IsSuccessful)
            {
                var amountpaid = Session["transDbAmount"].ToString();
                Session["transidno"] = utinorasstref.Text.Trim();
                Session["txtpayeamt"] = amountpaid;
                Response.Redirect("~/ProcessFailTransaction");
            }
            else
            {
                
                LblMsg.Text = bc.StatusMessage;
            }

        }
        private void TransactionStatusEmail()
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["EmailTransId"]))) return;
            var emailTransId = Session["EmailTransId"].ToString();
            Session["responseTransId"] = emailTransId;

            var bc = new MessageClass();
            var cmdMyQuery = new SqlCommand("Barsh.Querr_LogTransaction") { CommandType = CommandType.StoredProcedure };
            cmdMyQuery.Parameters.AddWithValue("@TransRefNo", Session["responseTransId"].ToString());
            var dtresult = DataBaseHandler.SqlSelectDataSet(cmdMyQuery);
            Console.WriteLine(dtresult);

            if (dtresult != null && dtresult.Tables.Count > 0 && dtresult.Tables[0].Rows.Count > 0)
            {
                var transDbAmount = Convert.ToString(dtresult.Tables[0].Rows[0]["AmountPaid"]);
                var dBtransId = Convert.ToString(dtresult.Tables[0].Rows[0]["TransRefNo"]);
                var dbpaymentReferenceNo = Convert.ToString(dtresult.Tables[0].Rows[0]["PaymentReference"]);
                var dbReceiptNo = Convert.ToString(dtresult.Tables[0].Rows[0]["ReceiptNo"]);
                var dbRevenueName = Convert.ToString(dtresult.Tables[0].Rows[0]["RevenueName"]);
                Session["dBtransId"] = dBtransId;
                Session["dbpaymentReferenceNo"] = dbpaymentReferenceNo;
                Session["dbReceiptNo"] = dbReceiptNo;
                Session["dbRevenueName"] = dbRevenueName;
                Session["transDbAmount"] = transDbAmount;
                bc.StatusId = 1;
                var amountpaid = Session["transDbAmount"].ToString();
                Session["transidno"] = Session["EmailTransId"].ToString();
                Session["txtpayeamt"] = amountpaid;
                Response.Redirect("~/ProcessFailTransaction");
            }
            else
            {
                bc.StatusMessage = "Transaction Ref. No. does not exist, please try again.";
                bc.StatusId = -1;
                LblMsg.Text = bc.StatusMessage;
            }
        }
        private MessageClass CrossCheckEntries()
        {
            var xresponseTransId = utinorasstref.Text.Trim();
            var bc = new MessageClass();
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
                var dbRevenueName = Convert.ToString(dtresult.Tables[0].Rows[0]["RevenueName"]);
                var dbTranStatus = Convert.ToString(dtresult.Tables[0].Rows[0]["TransactionStatus"]);
                Session["dBtransId"] = dBtransId;
                Session["dbpaymentReferenceNo"] = dbpaymentReferenceNo;
                Session["dbReceiptNo"] = dbReceiptNo;
                Session["dbRevenueName"] = dbRevenueName;
                var resultwithoutComma = $"{transDbAmount.Replace(",", "").Replace(".", "")}";
                Session["transDbAmount"] = transDbAmount;
                Session["dbTranStatus"] = dbTranStatus;
                bc.StatusId = 1;
            }
            else
            {
                bc.StatusMessage = "Transaction Ref. No. does not exist, please try again.";
                bc.StatusId = -1;
                LblMsg.Text = bc.StatusMessage;
            }

            return bc;
        }
        protected void Return2RevDetails_OnServerClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Home");
        }
    }
}