<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="termSummaryPage.aspx.cs" Inherits="webRollCall.termSummaryPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
                <h2 style="text-align: center;">學期總結</h2><br />
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" HorizontalAlign="Center"></asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

            </form>
        </div>
    </div>
</body>
</html>
