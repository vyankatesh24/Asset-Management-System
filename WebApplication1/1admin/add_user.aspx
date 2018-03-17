<%@ Page Title="Add User | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="add_user.aspx.cs" Inherits="WebApplication1.add_user2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_contentpage">
        <div class="content_contentpage">
            <div class="content_adduser">
                <table style="margin: 0 auto;">
                    <tr>
                        <th colspan="2" class="th">Add User</th>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp</td>
                    </tr>
                    <tr>
                        <td>First Name: </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="alltextbox"></asp:TextBox></td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" EnableTheming="True" ErrorMessage="This is required field" Font-Size="Medium" ForeColor="Red" BorderStyle="Dotted" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td >Last Name: </td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="alltextbox"></asp:TextBox></td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" EnableTheming="True" ErrorMessage="This is required field" Font-Size="Medium" ForeColor="Red" BorderStyle="Dotted" Display="Dynamic"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>e-mail: </td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server"  CssClass="alltextbox" TextMode="Email"></asp:TextBox></td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" EnableTheming="True" ErrorMessage="This is required field" Font-Size="Medium" ForeColor="Red" BorderStyle="Dotted" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>

                    </tr>
                    <tr>
                        <td>Contact No.: </td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="alltextbox"></asp:TextBox></td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" EnableTheming="True" ErrorMessage="This is required field" Font-Size="Medium" ForeColor="Red" BorderStyle="Dotted" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Font-Size="Medium" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="No. Not Correct" ForeColor="Red" ValidationExpression="[9,8,7]\d{9}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Username.: </td>
                        <td>
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="alltextbox"></asp:TextBox></td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" EnableTheming="True" ErrorMessage="This is required field" Font-Size="Medium" ForeColor="Red" BorderStyle="Dotted" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>

                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td>
                            <asp:TextBox ID="TextBox6" runat="server"  CssClass="alltextbox"></asp:TextBox></td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" EnableTheming="True" ErrorMessage="This is required field" Font-Size="Medium" ForeColor="Red" BorderStyle="Dotted" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>

                    </tr>
                    <tr>
                        <td>Type: </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" ValidateRequestMode="Disabled" ViewStateMode="Enabled" Width="200px" CssClass="select">
                                <asp:ListItem>Admin</asp:ListItem>
                                <asp:ListItem>Department User</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="button" OnClick="Button1_Click" />
                        </td>
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Cancel" UseSubmitBehavior="False" CssClass="button" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
