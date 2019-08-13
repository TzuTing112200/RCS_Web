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
    public partial class Page1 : System.Web.UI.Page
    {
        string sqlcn = "server=TINA\\SQLEXPRESS;database=rollCallSystem;UID=SQLAdmin;PWD=1234";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLogin"] == null || Session["isLogin"].ToString() != "Y")
                Response.Redirect("Login.aspx");
            if (Session["isLoad1"] == null || Session["isLoad1"].ToString() != "Y")
                RCClose_BT_Click(sender, e);
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            RCClose_BT_Click(sender, e);
        }

        protected void RCOpen_BT_Click(object sender, EventArgs e)
        {
            Session["isLoad1"] = "Y";
            RadioButtonList rBL;
            foreach (GridViewRow row in GridView1.Rows)
            {
                rBL = (RadioButtonList)row.FindControl("RCStateRBL");
                rBL.Enabled = true;
            }
            RCOpen_BT.Visible = false;
            RCSave_BT.Visible = true;
            RCClose_BT.Visible = true;
        }

        protected void RCSave_BT_Click(object sender, EventArgs e)
        {
            RadioButtonList rBL;

            foreach (GridViewRow row in GridView1.Rows)
            {
                rBL = (RadioButtonList)row.FindControl("RCStateRBL");
                if (rBL.SelectedItem.Text.ToString() != row.Cells[2].Text.ToString())
                {
                    using (SqlConnection cnn1 = new SqlConnection(sqlcn))
                    {
                        using (SqlCommand cmd1 = new SqlCommand())
                        {
                            cmd1.Connection = cnn1;
                            cmd1.CommandText = "INSERT INTO dbo.rollCall(studentID, classID, RCState, picID) SELECT @studentID, classID, @RCState, 1 FROM dbo.classes WHERE classDate = @classDate";
                            cmd1.Parameters.Add("@studentID", SqlDbType.Int).Value = int.Parse(row.Cells[4].Text.ToString());
                            cmd1.Parameters.Add("@classDate", SqlDbType.NVarChar).Value = DropDownList1.SelectedValue;
                            cmd1.Parameters.Add("@RCState", SqlDbType.Int).Value = rBL.SelectedIndex;
                            cnn1.Open();
                            SqlDataReader rr = cmd1.ExecuteReader();

                            rr.Close();
                            cmd1.Dispose();
                            cnn1.Close();
                        }
                    }
                }
            }

            RCClose_BT_Click(sender, e);
        }

        protected void RCClose_BT_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
            RadioButtonList rBL;
            foreach (GridViewRow row in GridView1.Rows)
            {
                rBL = (RadioButtonList)row.FindControl("RCStateRBL");
                if (row.Cells[2].Text.ToString() == "缺席")
                {
                    rBL.Items[0].Selected = true;
                    row.ForeColor = System.Drawing.Color.Red;
                }
                else if (row.Cells[2].Text.ToString() == "出席")
                {
                    rBL.Items[1].Selected = true;
                row.ForeColor = System.Drawing.Color.Black;
            }
                else
                {
                    rBL.Items[2].Selected = true;
                    row.ForeColor = System.Drawing.Color.Black;
                }
                rBL.Enabled = false;
            }
            RCOpen_BT.Visible = true;
            RCSave_BT.Visible = false;
            RCClose_BT.Visible = false;
            Session["isLoad1"] = "N";
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
            {  
                e.Row.Cells[4].Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            RCClose_BT_Click(sender, e);
            studentList.Style.Value = "display: ;";
            Button1.Visible = false;
        }
    }
}