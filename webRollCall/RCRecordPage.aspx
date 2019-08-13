<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RCRecordPage.aspx.cs" Inherits="webRollCall.Page1" MaintainScrollPositionOnPostback="True" %>

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
                <h2 style="text-align: center;">點名紀錄</h2><br />
            
                <p style="text-align: center;">請選擇課程日期：
                    <asp:DropDownList ID="DropDownList1" runat="server" Autopostback = "true" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="Column1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rollCallSystemConnectionString %>" SelectCommand="SELECT DISTINCT FORMAT( [classDate], 'yyyy-MM-dd') FROM [classes]"></asp:SqlDataSource>
                </p>
                <p style="text-align: center;"><asp:Button ID="Button1" runat="server" Text="確定" OnClick="Button1_Click" /></p>
                
                <div id="studentList" runat="server" style="display: none;">
                    <div style="width:780px;text-align: center;">
                        <p style="text-align: right;">
                            <asp:Button ID="RCOpen_BT" runat="server" Text="編輯" OnClick="RCOpen_BT_Click" />
                            <asp:Button ID="RCSave_BT" runat="server" Text="儲存" OnClick="RCSave_BT_Click" Visible="False" OnClientClick="return confirm('確認要儲存嗎？');"/>
                            <asp:Button ID="RCClose_BT" runat="server" Text="取消" OnClick="RCClose_BT_Click" Visible="False" />
                        </p>
                    </div>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnRowCreated="GridView1_RowCreated">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="studentAct" HeaderText="學號" SortExpression="studentAct" ReadOnly="True">
                            <HeaderStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="studentName" HeaderText="姓名" SortExpression="studentName" ReadOnly="True">
                            <HeaderStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Column1" HeaderText="出席狀況" SortExpression="Column1" ReadOnly="True">
                            <HeaderStyle Width="100px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="選項" >
                            
                                <ItemTemplate>
                                    <asp:RadioButtonList ID="RCStateRBL" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem>缺席</asp:ListItem>
                                        <asp:ListItem>出席</asp:ListItem>
                                        <asp:ListItem>請假</asp:ListItem>
                                    </asp:RadioButtonList>
                                </ItemTemplate>
                            
                            </asp:TemplateField>
                            <asp:BoundField DataField="studentID" HeaderText="ID" ReadOnly="True" SortExpression="studentID" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:rollCallSystemConnectionString %>" SelectCommand="SELECT studentAct,  studentName, CASE (SELECT TOP (1) RCState FROM dbo.rollCall AS B WHERE A.studentID = B.studentID AND classID = (SELECT classID FROM dbo.classes WHERE classDate = @classDate) ORDER BY B.RCID DESC) WHEN 2 THEN '請假' WHEN 1 THEN '出席' ELSE '缺席' END, studentID FROM dbo.students AS A WHERE studentID &gt; 1 ORDER BY studentAct">
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
