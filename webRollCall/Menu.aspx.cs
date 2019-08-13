using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webRollCall
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["isLogin"] == null || Session["isLogin"].ToString() != "Y")
                Response.Redirect("Login.aspx");
        }

        protected void RCRecordBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("RCRecordPage.aspx");
        }

        protected void photoRCBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("photoRCPage.aspx");
        }

        protected void randomPickBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("randomPickPage.aspx");
        }

        protected void studentListBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("studentListPage.aspx");
        }

        protected void termSummaryBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("termSummaryPage.aspx");
        }

        protected void changePWBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("changePWPage.aspx");
        }

        protected void LogoutBT_Click(object sender, EventArgs e)
        {
            Session["isLogin"] = "N";
            Response.Redirect("Login.aspx");
        }
    }
}