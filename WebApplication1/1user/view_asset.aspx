<%@ Page Title="View Asset | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="view_asset.aspx.cs" Inherits="WebApplication1._1user.view_asset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_contentpage">
        <div class="content_contentpage">
            <div class="viewasset">
                <table>
                    <tr>
                        <th class="th">View Asset</th>
                    </tr>
                    <tr>
                        <th class="th">&nbsp</th>
                    </tr>
                </table>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" fon CellPadding="4" DataKeyNames="A_Id" DataSourceID="sds_assetview" ForeColor="#333333" Font-Size="Medium">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="A_Id" HeaderText="Asset Id" InsertVisible="False" ReadOnly="True" SortExpression="A_Id" />
                        <asp:BoundField DataField="AssetName" HeaderText="Asset Name" SortExpression="AssetName" ReadOnly="True" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" ReadOnly="True" />
                        <asp:BoundField DataField="DateOfAllocate" HeaderText="Date of Allocate" SortExpression="DateOfAllocate" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="true" />
                        <asp:BoundField DataField="AccessionNo" HeaderText="Accession No." SortExpression="AccessionNo" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" ReadOnly="True" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ReadOnly="True" />
                        <asp:BoundField DataField="BillNo" HeaderText="Bill No." SortExpression="BillNo" ReadOnly="True" />
                        <asp:BoundField DataField="VendorName" HeaderText="Vendor Name" SortExpression="VendorName" ReadOnly="True" />
                        <asp:BoundField DataField="VendorAddress" HeaderText="Vendor Address" SortExpression="VendorAddress" ReadOnly="True" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
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
                <asp:SqlDataSource ID="sds_assetview" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT [A_Id], [AssetName], [Description], [Weight], [DateOfAllocate], [VendorAddress], [VendorName], [BillNo], [AccessionNo], [Price] FROM [Asset] WHERE (([D_Id] = @D_Id) AND ([AccessionNo] IS NOT NULL))" DeleteCommand="DELETE FROM [Asset] WHERE [A_Id] = @A_Id" UpdateCommand="UPDATE [Asset] SET [AccessionNo] = @AccessionNo WHERE [A_Id] = @A_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="A_Id" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="D_Id" SessionField="Dept_ID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AccessionNo" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
