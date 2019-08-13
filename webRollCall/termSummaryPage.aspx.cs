using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webRollCall
{
    public partial class termSummaryPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLogin"] == null || Session["isLogin"].ToString() != "Y")
                Response.Redirect("Login.aspx");
        }

        protected void LogoutBT_Click(object sender, EventArgs e)
        {
            Session["isLogin"] = "N";
            Response.Redirect("Login.aspx");
        }

        protected void MenuBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }
    }
}