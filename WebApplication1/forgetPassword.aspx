<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgetPassword.aspx.cs" Inherits="WebApplication1.forgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password | Asset Management System</title>
    <link href="css/reset.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Username" Font-Bold="True"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text="Password" Style="margin-left: 90px;" Font-Bold="True"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox11" runat="server" Height="26px" Width="140px" ToolTip="User Name" PlaceHolder=" User Name"></asp:TextBox>
                        <asp:TextBox ID="TextBox12" runat="server" Height="26px" Width="140px" ToolTip="Password" PlaceHolder=" Password" TextMode="Password"></asp:TextBox>
                        <asp:Button ID="Button11" runat="server" Text="Log in" Height="38px" Width="66px" />
                        <br />
                        <asp:Label ID="Label3" runat="server" BackColor="White" ForeColor="Red" Text=" "></asp:Label>
                    </div>
                </header>
                <section class="forgetpass">
                    <div class="container_contentpage">
                        <div class="content_contentpage">
                            <div style="padding-left:350px;">
                                <table>
                                    <tr>
                                        <th colspan="2" style="text-align: center; font-size: 36px">Forget Password</th>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp</td>
                                    </tr>
                                    <tr>
                                        <td>User Name:</td>
                                        <td>
                                            <asp:TextBox ID="txt_uname" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>e-mail:</td>
                                        <td>
                                            <asp:TextBox ID="txt_email" runat="server" TextMode="Email"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp</td>
                                        <td>&nbsp</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btn_submit_Click" /></td>
                                        <td>
                                            <asp:Button ID="btn_reset" runat="server" Text="Reset" OnClick="btn_reset_Click" /></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                    </div>

                </section>
                <footer>
                    <div class="text">
                        &copy 2016 Gogate Jogalekar College,Ratnagiri | All Rights Reserved.
                    </div>
                </footer>
            </div>
        </div>
    </form>
</body>
</html>
