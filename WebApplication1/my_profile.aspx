<%@ Page Title="My Profile | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="my_profile.aspx.cs" Inherits="WebApplication1.my_profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container_contentpage">
            <div class="content_contentpage">
                <div>
                    <table style="margin:0 auto;">
                        <tr>
                            <th colspan="2" class="th"> My Profile</th>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp</td>
                        </tr>
                        <tr >
                            <td>First Name:</td>
                            <td><asp:TextBox ID="txt_fname" runat="server" ReadOnly="true" CssClass="alltextbox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Last Name:</td>
                            <td><asp:TextBox ID="txt_lname" runat="server" ReadOnly="true" CssClass="alltextbox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>e-mail:</td>
                            <td><asp:TextBox ID="txt_email" runat="server" ReadOnly="true" CssClass="alltextbox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Contact Number:</td>
                            <td><asp:TextBox ID="txt_cont" runat="server" ReadOnly="true" CssClass="alltextbox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                        </tr>
                        <tr>
                            <td colspan="2"></td>
                            </tr>
                        <tr>
                            <td><asp:Button ID="btn_edit" runat="server" Text="Edit" OnClick="btn_edit_Click" CssClass="button"/> </td>
                            <td><asp:Button ID="btn_submit" runat="server" Text="Update" OnClick="btn_submit_Click" CssClass="button" Enabled="false"/></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
</asp:Content>
