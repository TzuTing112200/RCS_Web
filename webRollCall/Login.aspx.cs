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
    public partial class Login : System.Web.UI.Page
    {
        string sqlcn = "server=TINA\\SQLEXPRESS;database=rollCallSystem;UID=SQLAdmin;PWD=1234";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["isLogin"] != null && Session["isLogin"].ToString() == "Y")
                Response.Redirect("Menu.aspx");
        }

        protected void Login_BT_Click(object sender, EventArgs e)
        {
            bool check = false;

            using (SqlConnection cnn1 = new SqlConnection(sqlcn))
            {
                using (SqlCommand cmd1 = new SqlCommand())
                {
                    cmd1.Connection = cnn1;
                    cmd1.CommandText = "SELECT adminPW FROM dbo.admins WHERE adminAct = @adminAct";
                    cmd1.Parameters.Add("@adminAct", SqlDbType.NVarChar).Value = adminAct_TB.Text;

                    cnn1.Open();
                    SqlDataReader rr = cmd1.ExecuteReader();
                    if (rr.HasRows)
                    {
                        rr.Read();
                        if (adminPW_TB.Text == rr[0].ToString().Trim())
                            check = true;
                    }

                    rr.Close();
                    cmd1.Dispose();
                    cnn1.Close();
                }
            }

            if(check)
            {
                Session["isLogin"] = "Y";
                Session["adminAct"] = adminAct_TB.Text;
                Response.Redirect("Menu.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('帳號或密碼錯誤，請重新輸入！');</script>");
            }
        }
    }
}