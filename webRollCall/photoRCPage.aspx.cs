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
    public partial class Page2 : System.Web.UI.Page
    {
        string sqlcn = "server=TINA\\SQLEXPRESS;database=rollCallSystem;UID=SQLAdmin;PWD=1234";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLogin"] == null || Session["isLogin"].ToString() != "Y")
                Response.Redirect("Login.aspx");
            if (Session["isLoad2"] == null || Session["isLoad2"].ToString() != "Y")
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
            Session["isLoad2"] = "Y";
            RadioButtonList rBL;
            foreach (DataListItem item in DataList1.Items)
            {
                rBL = (RadioButtonList)item.FindControl("RCStateRBL");
                rBL.Enabled = true;
            }
            RCOpen_BT.Visible = false;
            RCSave_BT.Visible = true;
            RCClose_BT.Visible = true;
            DropDownList1.Enabled = false;
        }

        protected void RCSave_BT_Click(object sender, EventArgs e)
        {
            RadioButtonList rBL;
            Label label, IDLabel;

            foreach (DataListItem item in DataList1.Items)
            {
                rBL = (RadioButtonList)item.FindControl("RCStateRBL");
                label = (Label)item.FindControl("Column1Label1");
                IDLabel = (Label)item.FindControl("ColumnlLabel2");
                if (rBL.SelectedIndex.ToString() != label.Text.ToString())
                {
                    using (SqlConnection cnn1 = new SqlConnection(sqlcn))
                    {
                        using (SqlCommand cmd1 = new SqlCommand())
                        {
                            cmd1.Connection = cnn1;
                            cmd1.CommandText = "INSERT INTO dbo.rollCall(studentID, classID, RCState, picID) SELECT @studentID, classID, @RCState, 1 FROM dbo.classes WHERE classDate = @classDate";
                            cmd1.Parameters.Add("@studentID", SqlDbType.Int).Value = int.Parse(IDLabel.Text.ToString());
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
            DataList1.DataBind();
            RadioButtonList rBL;
            Label label;
            foreach (DataListItem item in DataList1.Items)
            {
                rBL = (RadioButtonList)item.FindControl("RCStateRBL");
                label = (Label)item.FindControl("Column1Label1");
                if (label.Text.ToString() == "2")
                    rBL.Items[2].Selected = true;
                else if (label.Text.ToString() == "1")
                    rBL.Items[1].Selected = true;
                else
                    rBL.Items[0].Selected = true;
                rBL.Enabled = false;
            }
            RCOpen_BT.Visible = true;
            RCSave_BT.Visible = false;
            RCClose_BT.Visible = false;
            DropDownList1.Enabled = true;
            Session["isLoad2"] = "N";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            RCClose_BT_Click(sender, e);
            studentList.Style.Value = "display: ;";
            Button1.Visible = false;
        }
    }
}