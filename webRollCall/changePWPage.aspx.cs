using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webRollCall
{
    public partial class Page5 : System.Web.UI.Page
    {
        string sqlcn = "server=TINA\\SQLEXPRESS;database=rollCallSystem;UID=SQLAdmin;PWD=1234";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLogin"] == null || Session["isLogin"].ToString() != "Y")
                Response.Redirect("Login.aspx");
            else
                adminAct_LB.Text = Session["adminAct"].ToString();
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

        protected void Change_BT_Click(object sender, EventArgs e)
        {
            if (adminPW_TB.Text == newAdminPW_TB.Text)
            {
                if (adminPW_TB.Text.Length > 3 && adminPW_TB.Text.Length < 9)
                {
                    using (SqlConnection cnn1 = new SqlConnection(sqlcn))
                    {
                        using (SqlCommand cmd1 = new SqlCommand())
                        {
                            cmd1.Connection = cnn1;
                            cmd1.CommandText = "UPDATE dbo.admins SET adminPW = @adminPW WHERE adminAct = @adminAct";
                            cmd1.Parameters.Add("@adminPW", SqlDbType.NVarChar).Value = adminPW_TB.Text;
                            cmd1.Parameters.Add("@adminAct", SqlDbType.NVarChar).Value = adminAct_LB.Text;
                            cnn1.Open();

                            SqlDataReader rr = cmd1.ExecuteReader();

                            rr.Close();
                            cmd1.Dispose();
                            cnn1.Close();
                        }
                    }
                    ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('密碼修改成功!');</script>");
                }
                else
                    ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('請輸入4-8字的密碼!');</script>");
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('兩次輸入的密碼不一致!請重新輸入!');</script>");
        }
    }
}