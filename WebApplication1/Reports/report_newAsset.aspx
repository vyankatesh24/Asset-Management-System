<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report_newAsset.aspx.cs" Inherits="WebApplication1.Reports.report_newAsset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report New Asset</title>
    <link href="../css/reset.css" rel="stylesheet" />
        <link href="../css/style.css" rel="stylesheet" />

    <script type="text/javascript">
      
    </script>
    <style type="text/css">
        
        table {
            margin: 0 auto;
            color:black;
            font-size:18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="containerReport">
            <div class="mainReport">
                <div class="headerReport">
                    <span>R.E.Society's</span><br />
                    <h1>Gogate Jogalekar College,Ratnagiri </h1>
                    <br />
                    <h1>Report</h1>
                    New Asset
                </div>
                <div class="contentReport">
                    <br />
                    Period: &nbsp<asp:Label ID="lbl_datefrom" runat="server" Text=""></asp:Label>&nbsp;&nbsp; to&nbsp;&nbsp; 
                    <asp:Label ID="lbl_dateto" runat="server" Text=""></asp:Label> &nbsp;<br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="A_Id" DataSourceID="sds_newassetreport">
                        <Columns>
                            <asp:BoundField DataField="A_Id" HeaderText="Asset Id" InsertVisible="False" ReadOnly="True" SortExpression="A_Id" />
                            <asp:BoundField DataField="AssetName" HeaderText="Asset Name" SortExpression="AssetName" />
                            <asp:BoundField DataField="D_name" HeaderText="Department Name" SortExpression="D_name" />
                            <asp:BoundField DataField="DateOfPurchase" HeaderText="Date of Purchase" SortExpression="DateOfPurchase" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="BillNo" HeaderText="Bill No" SortExpression="BillNo" />
                            <asp:BoundField DataField="VendorName" HeaderText="Vendor Name" SortExpression="VendorName" />
                            <asp:BoundField DataField="VendorAddress" HeaderText="Vendor Address" SortExpression="VendorAddress" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sds_newassetreport" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT Asset.A_Id, Asset.AssetName, Department.D_name, Asset.DateOfPurchase, Asset.BillNo, Asset.VendorName, Asset.VendorAddress, Asset.Price FROM Asset Left JOIN Department ON Asset.D_Id = Department.D_Id WHERE (Asset.DateOfPurchase BETWEEN @D1 AND @D2) AND (Convert(varchar(20),Asset.D_Id) like @did)">
                        <SelectParameters>
                            <asp:QueryStringParameter DbType="Date" Name="D1" QueryStringField="d1" />
                            <asp:QueryStringParameter DbType="Date" Name="D2" QueryStringField="d2"/>
                            <asp:SessionParameter DefaultValue="%" Name="did" SessionField="Department_Id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btn_print" runat="server" Text="Print" OnClientClick="javascript:window.print();;" />
                            </td>
                            <td>
                                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="btn_cancel_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
