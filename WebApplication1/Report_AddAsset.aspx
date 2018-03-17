<%@ Page Title="" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="Report_AddAsset.aspx.cs" Inherits="WebApplication1.Report_AddAsset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
        function PrintDivContent(divId) {
            var printContent = document.getElementById(divId);
            var WinPrint = window.open('', '', 'left=0,top=0,toolbar=0,sta­tus=0');
            WinPrint.document.write(printContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_contentpage">
        <div class="content_contentpage">
            <div id="divtoprint">
                <table>
                    <tr>
                        <th colspan="2" class="th">Generate Report</th>
                    </tr>
                    <tr>
                        <td>&nbsp</td>
                        <td>&nbsp</td>
                    </tr>
                    <tr>
                        <td>From Date:</td>
                        <td>
                            <asp:TextBox ID="txt_fromdate" runat="server" TextMode="Date"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>To Date:</td>
                        <td>
                            <asp:TextBox ID="txt_todate" runat="server" TextMode="Date"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>&nbsp</td>
                        <td>&nbsp</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <asp:Button ID="btn_generate" runat="server" Text="Generate" OnClientClick="javascript:PrintDivContent(divtoprint);" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
