<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="randomPickPage.aspx.cs" Inherits="webRollCall.Page3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Roll Call System</title>
</head>
<body style="overflow-x: auto; overflow-y: scroll">
    <div style="height:auto;width:1000px;margin: auto;">
        <div id="content" style="width:100%;float:left;margin-bottom: 20px;">
            <form id="form2" runat="server" align="center">
                <h1 style="text-align: left;">LINE BOT 互動點名系統</h1>
                <p style="text-align: right;">
                    <asp:Button ID="MenuBT" runat="server" Text="功能選單" OnClick="MenuBT_Click" />
                    <asp:Button ID="LogoutBT" runat="server" Text="登出" OnClick="LogoutBT_Click" />
                </p>
                <hr />
                <h2 style="text-align: center;">隨機抽籤</h2><br />

                <p style="text-align: center;">請選擇抽籤人數：
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="num" DataValueField="num" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                    &nbsp&nbsp&nbsp<asp:Button ID="Refresh_BT" runat="server" Text="刷新" OnClick="Refresh_BT_Click" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rollCallSystemConnectionString %>" SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY studentID) AS num FROM dbo.students WHERE studentID &gt; 1"></asp:SqlDataSource>
                </p>

                <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" HorizontalAlign="Center" Width="500px">
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
                                <td style="text-align:left;">
                                    <p>學號&nbsp：&nbsp<asp:Label ID="studentActLabel" runat="server" Text='<%# Eval("studentAct") %>' /></p>
                                    <p>姓名&nbsp：&nbsp<asp:Label ID="studentNameLabel" runat="server" Text='<%# Eval("studentName") %>' /></p>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:rollCallSystemConnectionString %>" SelectCommand="SELECT TOP(@num) studentAct, studentName FROM dbo.students WHERE studentID &gt; 1 ORDER BY NEWID()">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="num" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </form>
        </div>
    </div>
</body>
</html>
