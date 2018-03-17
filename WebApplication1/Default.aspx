<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page | Asset Management System</title>
    <link href="css/reset.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">
                <br />
            </div>
            <div class="name">
                <br />
                R.E.Society's<br />
                <h1>Gogate Jogalekar College<br />
                    Ratnagiri</h1>
            </div>
            <div class="loginForm">
                <form id="Form1" runat="server" aria-expanded="undefined">
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Username" Font-Bold="True"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="Password" Style="margin-left: 90px;" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox11" runat="server" Height="26px" Width="140px" ToolTip="User Name" PlaceHolder=" User Name" ></asp:TextBox>
                    <asp:TextBox ID="TextBox12" runat="server" Height="26px" Width="140px" ToolTip="Password" PlaceHolder=" Password" TextMode="Password" ></asp:TextBox>
                    <asp:Button ID="Button11" runat="server" Text="Log in" Height="38px" Width="66px" OnClick="Button11_Click" />
                    <br />
                    <asp:Label ID="Label3" runat="server" BackColor="White" ForeColor="Red" Text=" "></asp:Label>
                </form>
            </div>
        </header>
        <section class="main">
            <div class="opacity"></div>
            <div class="pgtxt">
<%--                <h1>Welcome<br />
                    to<br /><span class="a1">
                    <span class="a2">A</span>sset <span class="a2">M</span>anagement <span class="a2">S</span>ystem</span></h1>--%>
            </div>
        </section>
        <footer>
            <div class="text">
                &copy 2016 Gogate Jogalekar College,Ratnagiri | All Rights Reserved.
            </div>
        </footer>
    </div>
</body>
</html>
