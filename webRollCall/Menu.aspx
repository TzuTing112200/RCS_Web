<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="webRollCall.Menu" %>

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
                    <asp:Button ID="LogoutBT" runat="server" Text="登出" OnClick="LogoutBT_Click" />
                </p>
                <hr />
                <h2 style="text-align: center;">功能選單</h2><br />

                <p style="text-align: center;"><asp:Button ID="RCRecordBT" runat="server" Text="點 名 紀 錄" Width="250px" Font-Bold="True" Font-Size="12pt" Height="50px" OnClick="RCRecordBT_Click" /></p>
                <p style="text-align: center;"><asp:Button ID="photoRCBT" runat="server" Text="照 片 點 名" Width="250px" Font-Bold="True" Font-Size="12pt" Height="50px" OnClick="photoRCBT_Click" /></p>
                <p style="text-align: center;"><asp:Button ID="randomPickBT" runat="server" Text="隨 機 抽 籤" Width="250px" Font-Bold="True" Font-Size="12pt" Height="50px" OnClick="randomPickBT_Click" /></p>
                <p style="text-align: center;"><asp:Button ID="studentListBT" runat="server" Text="學 生 資 料" Width="250px" Font-Bold="True" Font-Size="12pt" Height="50px" OnClick="studentListBT_Click" /></p>
                <p style="text-align: center;"><asp:Button ID="termSummaryBT" runat="server" Text="學 期 總 結" Width="250px" Font-Bold="True" Font-Size="12pt" Height="50px" OnClick="termSummaryBT_Click" /></p>
                <p style="text-align: center;"><asp:Button ID="changePWBT" runat="server" Text="修 改 密 碼" Width="250px" Font-Bold="True" Font-Size="12pt" Height="50px" OnClick="changePWBT_Click" /></p>
            </form>
        </div>
    </div>
</body>
</html>
