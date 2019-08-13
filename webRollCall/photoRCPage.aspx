<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="photoRCPage.aspx.cs" Inherits="webRollCall.Page2" MaintainScrollPositionOnPostback="True" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Roll Call System</title>
</head>
<body style="overflow-x: auto; overflow-y: scroll">
    <div style="height:auto;width:1000px;margin: auto;">
        <div id="content" style="width:100%;float:left;margin-bottom: 20px;">
            <form id="form1" runat="server" align="center">
                <h1 style="text-align: left;">LINE BOT 互動點名系統</h1>
                <p style="text-align: right;">
                    <asp:Button ID="MenuBT" runat="server" Text="功能選單" OnClick="MenuBT_Click" />
                    <asp:Button ID="LogoutBT" runat="server" Text="登出" OnClick="LogoutBT_Click" />
                </p>
                <hr />
                <h2 style="text-align: center;">照片點名</h2><br />
                
                <p style="text-align: center;">請選擇課程日期：
                    <asp:DropDownList ID="DropDownList1" runat="server" Autopostback = "True" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="Column1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rollCallSystemConnectionString %>" SelectCommand="SELECT DISTINCT FORMAT( [classDate], 'yyyy-MM-dd') FROM [classes]"></asp:SqlDataSource>
                </p>
                <p style="text-align: center;"><asp:Button ID="Button1" runat="server" Text="確定" OnClick="Button1_Click" /></p>

                <div id="studentList" runat="server" style="display: none;">
                    <div style="width:950px;text-align: center;">
                        <p style="text-align: right;">
                            <asp:Button ID="RCOpen_BT" runat="server" Text="編輯" OnClick="RCOpen_BT_Click" />
                            <asp:Button ID="RCSave_BT" runat="server" Text="儲存" OnClick="RCSave_BT_Click" Visible="False" OnClientClick="return confirm('確認要儲存嗎？');"/>
                            <asp:Button ID="RCClose_BT" runat="server" Text="取消" OnClick="RCClose_BT_Click" Visible="False" />
                        </p>
                    </div>

                    <asp:DataList ID="DataList1" runat="server" HorizontalAlign="Center" DataSourceID="SqlDataSource2" RepeatColumns="3" BorderColor="White" BorderWidth="0px" CellPadding="0" ForeColor="#333333" RepeatDirection="Horizontal">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#EFF3FB" />
                        <ItemTemplate>
                            <table border="0">
                                <tr>
                                    <td style="width:150px;text-align:center;">
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "https://portalx.yzu.edu.tw/PortalSocialVB/Include/ShowImage.aspx?ShowType=UserPic&UserAccount=s" + Eval("studentAct") + "&UserPictureName=%22%20height=%22120%22%20width=%2293"%> ' Height="85px" />
                                    </td>
                                    <td style="width:150px;text-align:left;">
                                        <p>學號&nbsp：&nbsp<asp:Label ID="studentActLabel" runat="server" Text='<%# Eval("studentAct") %>' /></p>
                                        <p>姓名&nbsp：&nbsp<asp:Label ID="studentNameLabel" runat="server" Text='<%# Eval("studentName") %>' /></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;" colspan="2">
                                        <p>出席狀況&nbsp：&nbsp
                                            <asp:RadioButtonList ID="RCStateRBL" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                <asp:ListItem>缺席</asp:ListItem>
                                                <asp:ListItem>出席</asp:ListItem>
                                                <asp:ListItem>請假</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                            <div runat="server" style="display: none;">
                                <asp:Label ID="Column1Label1" runat="server" Text='<%# Eval("Column1") %>' />
                                <asp:Label ID="ColumnlLabel2" runat="server" Text='<%# Eval("studentID") %>' />
                            </div>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataList>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:rollCallSystemConnectionString %>" SelectCommand="SELECT studentAct,  studentName, (SELECT TOP (1) RCState FROM dbo.rollCall AS B WHERE A.studentID = B.studentID AND classID = (SELECT classID FROM dbo.classes WHERE classDate = @classDate) ORDER BY B.RCID DESC), studentID FROM dbo.students AS A WHERE studentID &gt; 1 ORDER BY studentAct">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="2018-12-24" Name="classDate" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
