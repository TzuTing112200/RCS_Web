<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentListPage.aspx.cs" Inherits="webRollCall.Page4" MaintainScrollPositionOnPostback="True" %>

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
                <h2 style="text-align: center;">學生資料</h2><br />
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="studentID" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確認要刪除嗎？');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="studentID" HeaderText="studentID" InsertVisible="False" ReadOnly="True" SortExpression="studentID" Visible="False" />
                        <asp:TemplateField HeaderText="學號" SortExpression="studentAct">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("studentAct") %>' MaxLength="7"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("studentAct") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名" SortExpression="studentName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("studentName") %>' MaxLength="25"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("studentName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="studentExist" DataFormatString="{0:已註冊;;未註冊}" HeaderText="狀態" ReadOnly="True" SortExpression="studentExist">
                        <HeaderStyle Width="100px" />
                        </asp:BoundField>
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
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:rollCallSystemConnectionString %>" DeleteCommand="DELETE FROM [students] WHERE [studentID] = @studentID" InsertCommand="INSERT INTO [students] ([studentAct], [studentName]) VALUES (@studentAct, @studentName)" SelectCommand="SELECT [studentID], [studentAct], [studentName], [studentExist] FROM [students] WHERE ([studentID] &gt; @studentID) ORDER BY [studentAct]" UpdateCommand="UPDATE [students] SET [studentAct] = @studentAct, [studentName] = @studentName WHERE [studentID] = @studentID">
                    <DeleteParameters>
                        <asp:Parameter Name="studentID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="studentAct" Type="String" />
                        <asp:Parameter Name="studentName" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="studentID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="studentAct" Type="String" />
                        <asp:Parameter Name="studentName" Type="String" />
                        <asp:Parameter Name="studentID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <br /><hr />
                <h4 style="text-align: center;">新增學生</h4>
                <p style="text-align: center;">學號：<asp:TextBox ID="studentAct_TB" runat="server" MaxLength="7"></asp:TextBox></p>
                <p style="text-align: center;">姓名：<asp:TextBox ID="studentName_TB" runat="server" MaxLength="25"></asp:TextBox></p>
                <p style="text-align: center;">
                    <asp:Button ID="Insert_BT" runat="server" Text="新增" OnClick="Insert_BT_Click" />&nbsp;&nbsp;
                    <asp:Button ID="Clear_BT" runat="server" Text="清除" OnClick="Clear_BT_Click" />
                </p>

            </form>
        </div>
    </div>
</body>
</html>
