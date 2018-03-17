<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report_repairAsset.aspx.cs" Inherits="WebApplication1.Reports.report_repairAsset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report Repair Asset</title>
    <link href="../css/reset.css" rel="stylesheet" />
        <link href="../css/style.css" rel="stylesheet" />

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
                    Repair Asset
                </div>
                <div class="contentReport">
                    <br />
                    Period:&nbsp<asp:Label ID="lbl_datefrom" runat="server" Text=""></asp:Label>&nbsp to &nbsp 
                    <asp:Label ID="lbl_dateto" runat="server" Text=""></asp:Label>
                    &nbsp;<br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Rr_Id" DataSourceID="sds_repairReport">
                        <Columns>
                            <asp:BoundField DataField="Rr_Id" HeaderText="Request Id" InsertVisible="False" ReadOnly="True" SortExpression="Rr_Id" />
                            <asp:BoundField DataField="AssetName" HeaderText="Asset Name" SortExpression="AssetName" />
                            <asp:BoundField DataField="D_name" HeaderText="Department name" SortExpression="D_name" />
                            <asp:BoundField DataField="AccessionNo" HeaderText="Accession No." SortExpression="AccessionNo" />
                            <asp:BoundField DataField="Date_of_request" HeaderText="Date of Request" SortExpression="Date_of_request" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Date_of_Approval" HeaderText="Date of Approval" SortExpression="Date_of_Approval" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="amount_est" HeaderText="Amount (Estimated)" SortExpression="amount_est" />
                            <asp:BoundField DataField="amount_actual" HeaderText="Amount (Actual)" SortExpression="amount_actual" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sds_repairReport" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT Repair_Request.Rr_Id, Asset.AssetName, Department.D_name, Asset.AccessionNo, Repair_Request.Date_of_request, Repair_Request.Date_of_Approval, Repair_Request.amount_est, Repair_Request.amount_actual FROM Asset INNER JOIN Repair_Request ON Asset.A_Id = Repair_Request.A_id INNER JOIN Department ON Asset.D_Id = Department.D_Id WHERE (Repair_Request.Date_of_Approval BETWEEN @D1 AND @D2) AND (CONVERT (varchar(20), Asset.D_Id) LIKE @did)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="D1" QueryStringField="d1" />
                            <asp:QueryStringParameter Name="D2" QueryStringField="d2" />
                            <asp:SessionParameter DefaultValue="%" Name="did" SessionField="Department_Id" />
                        </SelectParameters>
                    </asp:SqlDataSource>

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
