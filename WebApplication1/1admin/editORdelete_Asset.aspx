<%@ Page Title="" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="editORdelete_Asset.aspx.cs" Inherits="WebApplication1._1admin.editORdelete_Asset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_contentpage">
        <div class="content_contentpage">
            <div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="A_Id" DataSourceID="sds_asset" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="A_Id" HeaderText="A_Id" InsertVisible="False" ReadOnly="True" SortExpression="A_Id" />
                        <asp:BoundField DataField="AssetName" HeaderText="AssetName" SortExpression="AssetName" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                        <asp:TemplateField HeaderText="DateOfPurchase" SortExpression="DateOfPurchase">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"  Text='<%# Eval("DateOfPurchase") %>' TextMode="Date"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("DateOfPurchase") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="BillNo" HeaderText="BillNo" SortExpression="BillNo" />
                        <asp:BoundField DataField="VendorName" HeaderText="VendorName" SortExpression="VendorName" />
                        <asp:BoundField DataField="VendorAddress" HeaderText="VendorAddress" SortExpression="VendorAddress" />
                        <asp:BoundField DataField="warranty" HeaderText="warranty" SortExpression="warranty" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="sds_asset" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" DeleteCommand="DELETE FROM [Asset] WHERE [A_Id] = @A_Id" InsertCommand="INSERT INTO [Asset] ([AssetName], [Description], [Weight], [DateOfPurchase], [Price], [BillNo], [VendorName], [VendorAddress], [warranty]) VALUES (@AssetName, @Description, @Weight, @DateOfPurchase, @Price, @BillNo, @VendorName, @VendorAddress, @warranty)" SelectCommand="SELECT [A_Id], [AssetName], [Description], [Weight], [DateOfPurchase], [Price], [BillNo], [VendorName], [VendorAddress], [warranty] FROM [Asset]" UpdateCommand="UPDATE [Asset] SET [AssetName] = @AssetName, [Description] = @Description, [Weight] = @Weight, [DateOfPurchase] = @DateOfPurchase, [Price] = @Price, [BillNo] = @BillNo, [VendorName] = @VendorName, [VendorAddress] = @VendorAddress, [warranty] = @warranty WHERE [A_Id] = @A_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="A_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AssetName" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Weight" Type="String" />
                        <asp:Parameter DbType="Date" Name="DateOfPurchase" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="BillNo" Type="String" />
                        <asp:Parameter Name="VendorName" Type="String" />
                        <asp:Parameter Name="VendorAddress" Type="String" />
                        <asp:Parameter Name="warranty" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AssetName" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Weight" Type="String" />
                        <asp:Parameter DbType="Date" Name="DateOfPurchase" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="BillNo" Type="String" />
                        <asp:Parameter Name="VendorName" Type="String" />
                        <asp:Parameter Name="VendorAddress" Type="String" />
                        <asp:Parameter Name="warranty" Type="String" />
                        <asp:Parameter Name="A_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>

    </div>
</asp:Content>
