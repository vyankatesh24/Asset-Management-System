<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report_borrowAsset.aspx.cs" Inherits="WebApplication1.Reports.Report_borrowAsset" %>

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
                    Borrow Asset
                </div>
                <div class="contentReport">
                    <br />
                    Period: &nbsp<asp:Label ID="lbl_datefrom" runat="server" Text=""></asp:Label>&nbsp;&nbsp; to&nbsp;&nbsp; 
                    <asp:Label ID="lbl_dateto" runat="server" Text=""></asp:Label> &nbsp;<br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="sds_borrowReport" AutoGenerateColumns="False" DataKeyNames="Br_Id">
                        <Columns>
                            <asp:BoundField DataField="Br_Id" HeaderText="Br_Id" InsertVisible="False" ReadOnly="True" SortExpression="Br_Id" />
                            <asp:BoundField DataField="AssetName" HeaderText="AssetName" SortExpression="AssetName" />
                            <asp:BoundField DataField="D_name" HeaderText="D_name" SortExpression="D_name" />
                            <asp:BoundField DataField="AccessionNo" HeaderText="AccessionNo" SortExpression="AccessionNo" />
                            <asp:BoundField DataField="Date_of_pickup" HeaderText="Date_of_pickup" SortExpression="Date_of_pickup" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Date_of_return" HeaderText="Date_of_return" SortExpression="Date_of_return" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
                        </Columns>
                    </asp:GridView>



                    <asp:SqlDataSource ID="sds_borrowReport" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT Borrow_Request.Br_Id, Asset.AssetName, Department.D_name, Asset.AccessionNo, Borrow_Request.Date_of_pickup, Borrow_Request.Date_of_return, Department_1.D_name AS Expr1 FROM Asset INNER JOIN Borrow_Request ON Asset.A_Id = Borrow_Request.A_Id INNER JOIN Department ON Asset.D_Id = Department.D_Id INNER JOIN Department AS Department_1 ON Borrow_Request.Requesting_dept_id = Department_1.D_Id WHERE (CONVERT (varchar(20), Asset.D_Id) LIKE @did) AND (Borrow_Request.Date_of_Approval BETWEEN @D1 AND @D2)">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="%" Name="did" SessionField="Department_Id" />
                            <asp:QueryStringParameter Name="D1" QueryStringField="d1" />
                            <asp:QueryStringParameter Name="D2" QueryStringField="d2" />
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
