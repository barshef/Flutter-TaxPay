using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace FlutterwaveTechnicalHeroes
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        private static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("Home", "Home", "~/Tiers/HomePage.aspx");
            routes.MapPageRoute("Agency", "Agency", "~/Tiers/AgencyPage.aspx");
            routes.MapPageRoute("RevenueDetail", "RevenueDetail", "~/Tiers/RevenueDetails.aspx");
            routes.MapPageRoute("RaveResponse", "RaveResponse", "~/Tiers/RaveResponse.aspx");
            routes.MapPageRoute("PayerDetails", "PayerDetails", "~/Tiers/PaymentDetails.aspx");
            routes.MapPageRoute("FailTransaction", "FailTransaction", "~/Tiers/RequerryTransaction.aspx");
            routes.MapPageRoute("ProcessFailTransaction", "ProcessFailTransaction", "~/Tiers/RequerryFailTransaction.aspx");
            routes.MapPageRoute("RetryFailTransaction", "RetryFailTransaction", "~/Tiers/RetryFailTransaction.aspx");
            routes.MapPageRoute("Successful", "Successful", "~/Tiers/SuccessTrans.aspx");
            routes.MapPageRoute("Declined", "Declined", "~/Tiers/DeclinedTrans.aspx");
            routes.MapPageRoute("ErrorPage", "ErrorPage", "~/Tiers/ErrorPage.aspx");

        }
        public static class Raveconfigs
        {
            public static readonly string RaveBaseUrl = ConfigurationManager.AppSettings["RaveBaseUrl"];
            public static readonly string Callbackurl = ConfigurationManager.AppSettings["Callbackurl"];
            public static readonly string Publickey = ConfigurationManager.AppSettings["Publickey"];
            public static readonly string Privatekey = ConfigurationManager.AppSettings["Privatekey"];
            public static readonly string AppCurrency = ConfigurationManager.AppSettings["AppCurrency"];
            public static readonly string RaveCountrycurrency = ConfigurationManager.AppSettings["RaveCountrycurrency"];
            public static readonly string RaveSwitchGateWayId = ConfigurationManager.AppSettings["RaveSwitchGateWayID"];
        }
    }
}