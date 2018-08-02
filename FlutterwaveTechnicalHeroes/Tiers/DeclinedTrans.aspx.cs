using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FlutterwaveTechnicalHeroes.SqlDbUtilities;

namespace FlutterwaveTechnicalHeroes.Tiers
{
    public partial class DeclinedTrans : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(Convert.ToString(Session["url"])))
                {
                    Response.Redirect("~/Home");
                }
                else
                {
                    Lbltransmsg.Text = Session["failmsg"].ObjectToString();
                    if (string.IsNullOrWhiteSpace(Lbltransmsg.Text))
                    {
                        Lbltransmsg.Text = "Unable to retreive response.";
                    }
                    Lbltransrefno.Text = Session["transidno"].ObjectToString();
                }

            }
        }
        protected void Btnsubmits_OnServerClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Home");
        }
        protected void bntRetry_OnServerClick(object sender, EventArgs e)
        {
            Session["newTransRefNo"] = Lbltransrefno.Text;
            Session["failedPage"] = "FailedPage";
            Response.Redirect("~/RetryFailTransaction");
        }
    }
}