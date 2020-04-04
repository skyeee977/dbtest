<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title>东北大学力学虚拟实验室</title> 
    <style type="text/css">
        @import url("css/headpage.css");
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="div1">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/background/banner_00.png" />
        </div>
        <div id="title">

            Welcome To Our System

        </div>
        <div id="username">

            <asp:Label ID="Label1" runat="server" Text="用户名"></asp:Label>

            <asp:TextBox ID="name" runat="server"></asp:TextBox>

        </div>
        <div id="userpwd">

                    <asp:Label ID="Label2" runat="server" Text="密    码"></asp:Label>

                    <asp:TextBox ID="pwd" runat="server" TextMode="Password"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>

        <div id="confirm">

            <asp:Button ID="signin" runat="server" Text="登录" OnClick="signin_Click" />
            <asp:Button ID="signup" runat="server" Text="注册" OnClick="signup_Click" />
        </div>
        <div id="data">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbtestConnectionString %>" SelectCommand="SELECT [id], [name], [pwd] FROM [Userpwd]" DeleteCommand="DELETE FROM [Userpwd] WHERE [id] = @id" InsertCommand="INSERT INTO [Userpwd] ([name], [pwd]) VALUES (@name, @pwd)" UpdateCommand="UPDATE [Userpwd] SET [name] = @name, [pwd] = @pwd WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="pwd" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="pwd" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="pwd" HeaderText="pwd" SortExpression="pwd" />
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
        </div>
    </form>
</body>
</html>
