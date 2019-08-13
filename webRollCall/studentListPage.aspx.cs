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
    public partial class Page4 : System.Web.UI.Page
    {
        string sqlcn = "server=TINA\\SQLEXPRESS;database=rollCallSystem;UID=SQLAdmin;PWD=1234";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLogin"] == null || Session["isLogin"].ToString() != "Y")
                Response.Redirect("Login.aspx");
        }

        protected void Insert_BT_Click(object sender, EventArgs e)
        {
            if (studentAct_TB.Text.Length == 7)
            {
                SqlDataSource3.InsertParameters["studentAct"].DefaultValue = studentAct_TB.Text;
                SqlDataSource3.InsertParameters["studentName"].DefaultValue = studentName_TB.Text;
                using (SqlConnection cnn1 = new SqlConnection(sqlcn))
                {
                    using (SqlCommand cmd1 = new SqlCommand())
                    {
                        cmd1.Connection = cnn1;
                        cmd1.CommandText = "SELECT studentAct FROM dbo.students WHERE studentAct = @studentAct";
                        cmd1.Parameters.Add("@studentAct", SqlDbType.NVarChar).Value = studentAct_TB.Text;
                        cnn1.Open();

                        SqlDataReader rr = cmd1.ExecuteReader();
                        if (!rr.HasRows)
                            SqlDataSource3.Insert();
                        else
                            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('學號：" + studentAct_TB.Text + " 已存在!');</script>");

                        rr.Close();
                        cmd1.Dispose();
                        cnn1.Close();
                    }
                }
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('學號應為7碼，請重新輸入正確學號!');</script>");

            Clear_BT_Click(sender, e);
        }

        protected void Clear_BT_Click(object sender, EventArgs e)
        {
            studentAct_TB.Text = "";
            studentName_TB.Text = "";
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