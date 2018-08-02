using System;
using System.Configuration;
using System.Globalization;
using System.Net;
using System.Net.Mail;

//using context = System.Web.HttpContext;

namespace FlutterwaveTechnicalHeroes.ErrorLog
{
    public static class ExceptionLogging
    {

        private static string _errorlineNo, _errormsg, _errorLocation, _extype, _exurl, _frommail, _toMail, _pass, _sub, _hostAdd, _emailHead, _emailSing;


        public static void SendErrorTomail(Exception exmail, string url)
        {

            //try
            //{
            var stackTrace = exmail.Output(); //the .Output was from "MyCustomException Class"
            const string newline = "<br/>";
            _errorlineNo = exmail.StackTrace.Substring(exmail.StackTrace.Length - 7, 7);
            _errormsg = exmail.GetType().Name;
            _extype = exmail.GetType().ToString();
            _exurl = url; //context.Current.Request.Url.ToString();
            _errorLocation = exmail.Message;
            _emailHead = "<b>Dear Team,</b>" + "<br/>" + "<br/>" + "An exception occurred in an application Url" + " " + _exurl + " " + "with the following details : -" + "<br/>" + "<br/>";
            _emailSing = newline + "Thanks and Regards" + newline + "    " + "     " + "<b>Application Admin </b>" + "</br>";
            _sub = "An Exception Error as occurred" + " " + "in an Application" + " " + _exurl;
            _hostAdd = ConfigurationManager.AppSettings["Host"];
            var errortomail = _emailHead + "<b>Log Written Date: </b>" + " " + DateTime.Now.ToString(CultureInfo.InvariantCulture) + newline + "<b>Error Line No :</b>" + " " + _errorlineNo + "\t\n" + " " + newline + "<b>Error Message:</b>" + " " + _errormsg + newline + "<b>Exception Type:</b>" + " " + _extype + newline + "<b> Error Details :</b>" + " " + _errorLocation + newline + "<b>Error Page Url:</b>" + " " + _exurl + newline + newline + stackTrace + newline + newline + newline + _emailSing;

            using (var mailMessage = new MailMessage())
            {
                _frommail = ConfigurationManager.AppSettings["UserEmail"];
                _toMail = ConfigurationManager.AppSettings["ToMail"];
                _pass = ConfigurationManager.AppSettings["Password"];

                mailMessage.From = new MailAddress(_frommail);
                mailMessage.Subject = _sub;
                mailMessage.Body = errortomail;
                mailMessage.IsBodyHtml = true;

                var multiEmailId = _toMail.Split(',');
                foreach (var userEmails in multiEmailId)
                {
                    mailMessage.To.Add(new MailAddress(userEmails));
                }

                var smtp = new SmtpClient
                {
                    Host = _hostAdd,
                    EnableSsl = true
                }; // creating object of smptpclient
                   //host of emailaddress for example smtp.gmail.com etc
                var networkCred = new NetworkCredential
                {
                    UserName = mailMessage.From.Address,
                    Password = _pass
                };
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = networkCred;
                smtp.Port = 587;
                smtp.Send(mailMessage); //sending Email

            }
            //}
            //catch (Exception em)
            //{
            //    //Console.WriteLine(em.Message);
            //    throw;
            //}
        }

    }
}