<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="webRollCall.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Roll Call System</title>
</head>
<body>
    <div style="height:auto;width:1000px;margin: auto;">
        <div id="content" style="width:100%;float:left;margin-bottom: 20px;">
            <form id="form1" runat="server" align="center">
                <h1>LINE BOT 互動點名系統</h1><br />

                <h2 style="text-align: center;">登入</h2>

                <p style="text-align: center;">帳號：<asp:TextBox ID="adminAct_TB" runat="server" MaxLength="7"></asp:TextBox></p>
                <p style="text-align: center;">密碼：<asp:TextBox ID="adminPW_TB" runat="server" TextMode="Password"></asp:TextBox></p>
                <p style="text-align: center;"><asp:Button ID="Login_BT" runat="server" Text="登入" OnClick="Login_BT_Click" /></p>
            </form>
        </div>
    </div>
</body>
</html>
