<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changePWPage.aspx.cs" Inherits="webRollCall.Page5" %>

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
                <h2 style="text-align: center;">修改密碼</h2><br />
                
                <p style="text-align: center;">帳號：<asp:Label ID="adminAct_LB" runat="server" Text=""></asp:Label></p>
                <p style="text-align: center;">輸入新密碼：<asp:TextBox ID="adminPW_TB" runat="server" TextMode="Password"></asp:TextBox></p>
                <p style="text-align: center;">確認新密碼：<asp:TextBox ID="newAdminPW_TB" runat="server" TextMode="Password"></asp:TextBox></p>
                <p style="text-align: center;"><asp:Button ID="Change_BT" runat="server" Text="修改" OnClick="Change_BT_Click" /></p>

            </form>
        </div>
    </div>
</body>
</html>
