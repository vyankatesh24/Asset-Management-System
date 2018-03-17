<%@ Page Title="Change Password | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="change_pass.aspx.cs" Inherits="WebApplication1.change_pass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_contentpage">
        <div class="content_contentpage">
            <div class="changepass">
                <table>
                    <tr>
                        <th colspan="2" style="text-align: center; font-size: 36px">Change Password</th>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp</td>
                    </tr>
                    <tr>
                        <td>Current Password:</td>
                        <td>
                            <asp:TextBox ID="txt_currentPass" runat="server" CssClass="alltextbox"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>New Password:</td>
                        <td>
                            <asp:TextBox ID="txt_newPass" runat="server" CssClass="alltextbox"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Confirm Password:</td>
                        <td><asp:TextBox ID="txt_confirmPass" runat="server" CssClass="alltextbox"></asp:TextBox></td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Recheck Password" ControlToCompare="txt_newPass" ControlToValidate="txt_confirmPass" Display="Dynamic"></asp:CompareValidator></td>
                    </tr>
                    <tr>
                        <td>&nbsp</td>
                        <td>&nbsp</td>
                    </tr>
                    <tr>
                        <td><asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btn_submit_Click" CssClass="button" /></td>
                        <td><asp:Button ID="btn_reset" runat="server" Text="Reset" OnClick="btn_reset_Click" CssClass="button" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
