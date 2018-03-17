 <%@ Page Title="Generate Report | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="Report_repair.aspx.cs" Inherits="WebApplication1.Reports.Report_repair" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_contentpage">
        <div class="content_contentpage">
            <div>
                <table>
                    <tr>
                        <th colspan="2" class="th">
                            Report
                        </th>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;" >
                            Repair
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                     <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Date(from):
                        </td>
                        <td>
                            <asp:TextBox ID="date_from" runat="server" CssClass="alltextbox" TextMode="Date"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Date(to):
                        </td>
                        <td>
                            <asp:TextBox ID="date_to" runat="server" CssClass="alltextbox" TextMode="Date"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;">
                            <asp:Button ID="btn_generate" runat="server" CssClass="button" Text="Generate" OnClick="btn_generate_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
