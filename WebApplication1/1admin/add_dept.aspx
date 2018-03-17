<%@ Page Title="Add Department | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="add_dept.aspx.cs" Inherits="WebApplication1.add_dept2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_contentpage">
        <div class="content_contentpage">
            <div class="content_adddept">

                <table>
                    <tr>
                        <th colspan="2" style="text-align: center; font-size: 36px">Add Deprtment</th>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp</td>
                    </tr>
                    <tr>
                        <td>Department Name: </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="alltextbox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Department Faculty: </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="alltextbox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Select User: </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="select" ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>&nbsp</td>
                        <td>&nbsp</td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" CssClass="button" />
                        </td>
                        <td>
                            <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="button"  CausesValidation="false" UseSubmitBehavior="false"/></td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
</asp:Content>
