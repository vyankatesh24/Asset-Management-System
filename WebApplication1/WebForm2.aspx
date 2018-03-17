<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="A_Id" DataSourceID="SqlDataSource1" ForeColor="#333333"  BorderColor="#FF0066" BorderWidth="1px" OnRowUpdating="GridView1_RowUpdating" >
            <AlternatingRowStyle BackColor="White" BorderColor="#FF0066" BorderWidth="1px" />
            <Columns>
                <asp:BoundField DataField="A_Id" HeaderText="Asset Id" InsertVisible="False" ReadOnly="True" SortExpression="A_Id" />
                <asp:TemplateField HeaderText="AssetName" SortExpression="AssetName">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("AssetName") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("AssetName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" ReadOnly="True" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" ReadOnly="True" />
                <asp:BoundField DataField="DateOfPurchase" HeaderText="DateOfPurchase" SortExpression="DateOfPurchase" ReadOnly="True" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ReadOnly="True" />
                <asp:TemplateField HeaderText="D_Id" SortExpression="D_Id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("D_Id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("D_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="B_Id" HeaderText="B_Id" SortExpression="B_Id" ReadOnly="True" />
                <asp:TemplateField ShowHeader="true" HeaderText="Edit" >
                    <EditItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <%--<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />--%>
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT * FROM [Asset]" UpdateCommand="UPDATE Asset SET D_Id = @d_id WHERE (A_Id = @a_id)">
            <UpdateParameters>
                <asp:Parameter Name="d_id" />
                <asp:Parameter Name="a_id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
