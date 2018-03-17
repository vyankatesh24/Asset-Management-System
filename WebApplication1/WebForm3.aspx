<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WebApplication1.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" >
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="A_Id" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                A_Id:
                <asp:Label ID="A_IdLabel1" runat="server" Text='<%# Eval("A_Id") %>' />
                <br />
                AssetName:
                <asp:TextBox ID="AssetNameTextBox" runat="server" Text='<%# Bind("AssetName") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                Weight:
                <asp:TextBox ID="WeightTextBox" runat="server" Text='<%# Bind("Weight") %>' />
                <br />
                DateOfPurchase:
                <asp:TextBox ID="DateOfPurchaseTextBox" runat="server" Text='<%# Bind("DateOfPurchase") %>' />
                <br />
                Price:
                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                <br />
                D_Id:
                <asp:TextBox ID="D_IdTextBox" runat="server" Text='<%# Bind("D_Id") %>' />
                <br />
                B_Id:
                <asp:TextBox ID="B_IdTextBox" runat="server" Text='<%# Bind("B_Id") %>' />
                <br />
                AccessionNo:
                <asp:TextBox ID="AccessionNoTextBox" runat="server" Text='<%# Bind("AccessionNo") %>' />
                <br />
                BillNo:
                <asp:TextBox ID="BillNoTextBox" runat="server" Text='<%# Bind("BillNo") %>' />
                <br />
                VendorName:
                <asp:TextBox ID="VendorNameTextBox" runat="server" Text='<%# Bind("VendorName") %>' />
                <br />
                VendorAddress:
                <asp:TextBox ID="VendorAddressTextBox" runat="server" Text='<%# Bind("VendorAddress") %>' />
                <br />
                status:
                <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                <br />
                warranty:
                <asp:TextBox ID="warrantyTextBox" runat="server" Text='<%# Bind("warranty") %>' />
                <br />
                DateOfAllocate:
                <asp:TextBox ID="DateOfAllocateTextBox" runat="server" Text='<%# Bind("DateOfAllocate") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                AssetName:
                <asp:TextBox ID="AssetNameTextBox" runat="server" Text='<%# Bind("AssetName") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                Weight:
                <asp:TextBox ID="WeightTextBox" runat="server" Text='<%# Bind("Weight") %>' />
                <br />
                DateOfPurchase:
                <asp:TextBox ID="DateOfPurchaseTextBox" runat="server" Text='<%# Bind("DateOfPurchase") %>' />
                <br />
                Price:
                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                <br />
                D_Id:
                <asp:TextBox ID="D_IdTextBox" runat="server" Text='<%# Bind("D_Id") %>' />
                <br />
                B_Id:
                <asp:TextBox ID="B_IdTextBox" runat="server" Text='<%# Bind("B_Id") %>' />
                <br />
                AccessionNo:
                <asp:TextBox ID="AccessionNoTextBox" runat="server" Text='<%# Bind("AccessionNo") %>' />
                <br />
                BillNo:
                <asp:TextBox ID="BillNoTextBox" runat="server" Text='<%# Bind("BillNo") %>' />
                <br />
                VendorName:
                <asp:TextBox ID="VendorNameTextBox" runat="server" Text='<%# Bind("VendorName") %>' />
                <br />
                VendorAddress:
                <asp:TextBox ID="VendorAddressTextBox" runat="server" Text='<%# Bind("VendorAddress") %>' />
                <br />
                status:
                <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                <br />
                warranty:
                <asp:TextBox ID="warrantyTextBox" runat="server" Text='<%# Bind("warranty") %>' />
                <br />
                DateOfAllocate:
                <asp:TextBox ID="DateOfAllocateTextBox" runat="server" Text='<%# Bind("DateOfAllocate") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                A_Id:
                <asp:Label ID="A_IdLabel" runat="server" Text='<%# Eval("A_Id") %>' />
                <br />
                AssetName:
                <asp:Label ID="AssetNameLabel" runat="server" Text='<%# Bind("AssetName") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                Weight:
                <asp:Label ID="WeightLabel" runat="server" Text='<%# Bind("Weight") %>' />
                <br />
                DateOfPurchase:
                <asp:Label ID="DateOfPurchaseLabel" runat="server" Text='<%# Bind("DateOfPurchase") %>' />
                <br />
                Price:
                <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' />
                <br />
                D_Id:
                <asp:Label ID="D_IdLabel" runat="server" Text='<%# Bind("D_Id") %>' />
                <br />
                B_Id:
                <asp:Label ID="B_IdLabel" runat="server" Text='<%# Bind("B_Id") %>' />
                <br />
                AccessionNo:
                <asp:Label ID="AccessionNoLabel" runat="server" Text='<%# Bind("AccessionNo") %>' />
                <br />
                BillNo:
                <asp:Label ID="BillNoLabel" runat="server" Text='<%# Bind("BillNo") %>' />
                <br />
                VendorName:
                <asp:Label ID="VendorNameLabel" runat="server" Text='<%# Bind("VendorName") %>' />
                <br />
                VendorAddress:
                <asp:Label ID="VendorAddressLabel" runat="server" Text='<%# Bind("VendorAddress") %>' />
                <br />
                status:
                <asp:Label ID="statusLabel" runat="server" Text='<%# Bind("status") %>' />
                <br />
                warranty:
                <asp:Label ID="warrantyLabel" runat="server" Text='<%# Bind("warranty") %>' />
                <br />
                DateOfAllocate:
                <asp:Label ID="DateOfAllocateLabel" runat="server" Text='<%# Bind("DateOfAllocate") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" DeleteCommand="DELETE FROM [Asset] WHERE [A_Id] = @A_Id" InsertCommand="INSERT INTO [Asset] ([AssetName], [Description], [Weight], [DateOfPurchase], [Price], [D_Id], [B_Id], [AccessionNo], [BillNo], [VendorName], [VendorAddress], [status], [warranty], [DateOfAllocate]) VALUES (@AssetName, @Description, @Weight, @DateOfPurchase, @Price, @D_Id, @B_Id, @AccessionNo, @BillNo, @VendorName, @VendorAddress, @status, @warranty, @DateOfAllocate)" SelectCommand="SELECT * FROM [Asset]" UpdateCommand="UPDATE [Asset] SET [AssetName] = @AssetName, [Description] = @Description, [Weight] = @Weight, [DateOfPurchase] = @DateOfPurchase, [Price] = @Price, [D_Id] = @D_Id, [B_Id] = @B_Id, [AccessionNo] = @AccessionNo, [BillNo] = @BillNo, [VendorName] = @VendorName, [VendorAddress] = @VendorAddress, [status] = @status, [warranty] = @warranty, [DateOfAllocate] = @DateOfAllocate WHERE [A_Id] = @A_Id">
            <DeleteParameters>
                <asp:Parameter Name="A_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AssetName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Weight" Type="String" />
                <asp:Parameter DbType="Date" Name="DateOfPurchase" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="D_Id" Type="Int32" />
                <asp:Parameter Name="B_Id" Type="Int32" />
                <asp:Parameter Name="AccessionNo" Type="String" />
                <asp:Parameter Name="BillNo" Type="String" />
                <asp:Parameter Name="VendorName" Type="String" />
                <asp:Parameter Name="VendorAddress" Type="String" />
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="warranty" Type="String" />
                <asp:Parameter DbType="Date" Name="DateOfAllocate" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AssetName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Weight" Type="String" />
                <asp:Parameter DbType="Date" Name="DateOfPurchase" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="D_Id" Type="Int32" />
                <asp:Parameter Name="B_Id" Type="Int32" />
                <asp:Parameter Name="AccessionNo" Type="String" />
                <asp:Parameter Name="BillNo" Type="String" />
                <asp:Parameter Name="VendorName" Type="String" />
                <asp:Parameter Name="VendorAddress" Type="String" />
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="warranty" Type="String" />
                <asp:Parameter DbType="Date" Name="DateOfAllocate" />
                <asp:Parameter Name="A_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="A_Id" DataSourceID="SqlDataSource1" GroupItemCount="3" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">A_Id:
                    <asp:Label ID="A_IdLabel" runat="server" Text='<%# Eval("A_Id") %>' />
                    <br />AssetName:
                    <asp:Label ID="AssetNameLabel" runat="server" Text='<%# Eval("AssetName") %>' />
                    <br />Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />Weight:
                    <asp:Label ID="WeightLabel" runat="server" Text='<%# Eval("Weight") %>' />
                    <br />DateOfPurchase:
                    <asp:Label ID="DateOfPurchaseLabel" runat="server" Text='<%# Eval("DateOfPurchase") %>' />
                    <br />Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />D_Id:
                    <asp:Label ID="D_IdLabel" runat="server" Text='<%# Eval("D_Id") %>' />
                    <br />B_Id:
                    <asp:Label ID="B_IdLabel" runat="server" Text='<%# Eval("B_Id") %>' />
                    <br />AccessionNo:
                    <asp:Label ID="AccessionNoLabel" runat="server" Text='<%# Eval("AccessionNo") %>' />
                    <br />BillNo:
                    <asp:Label ID="BillNoLabel" runat="server" Text='<%# Eval("BillNo") %>' />
                    <br />VendorName:
                    <asp:Label ID="VendorNameLabel" runat="server" Text='<%# Eval("VendorName") %>' />
                    <br />VendorAddress:
                    <asp:Label ID="VendorAddressLabel" runat="server" Text='<%# Eval("VendorAddress") %>' />
                    <br />status:
                    <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                    <br />warranty:
                    <asp:Label ID="warrantyLabel" runat="server" Text='<%# Eval("warranty") %>' />
                    <br />DateOfAllocate:
                    <asp:Label ID="DateOfAllocateLabel" runat="server" Text='<%# Eval("DateOfAllocate") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <br /></td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">A_Id:
                    <asp:Label ID="A_IdLabel1" runat="server" Text='<%# Eval("A_Id") %>' />
                    <br />AssetName:
                    <asp:TextBox ID="AssetNameTextBox" runat="server" Text='<%# Bind("AssetName") %>' />
                    <br />Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />Weight:
                    <asp:TextBox ID="WeightTextBox" runat="server" Text='<%# Bind("Weight") %>' />
                    <br />DateOfPurchase:
                    <asp:TextBox ID="DateOfPurchaseTextBox" runat="server" Text='<%# Bind("DateOfPurchase") %>' />
                    <br />Price:
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <br />D_Id:
                    <asp:TextBox ID="D_IdTextBox" runat="server" Text='<%# Bind("D_Id") %>' />
                    <br />B_Id:
                    <asp:TextBox ID="B_IdTextBox" runat="server" Text='<%# Bind("B_Id") %>' />
                    <br />AccessionNo:
                    <asp:TextBox ID="AccessionNoTextBox" runat="server" Text='<%# Bind("AccessionNo") %>' />
                    <br />BillNo:
                    <asp:TextBox ID="BillNoTextBox" runat="server" Text='<%# Bind("BillNo") %>' />
                    <br />VendorName:
                    <asp:TextBox ID="VendorNameTextBox" runat="server" Text='<%# Bind("VendorName") %>' />
                    <br />VendorAddress:
                    <asp:TextBox ID="VendorAddressTextBox" runat="server" Text='<%# Bind("VendorAddress") %>' />
                    <br />status:
                    <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                    <br />warranty:
                    <asp:TextBox ID="warrantyTextBox" runat="server" Text='<%# Bind("warranty") %>' />
                    <br />DateOfAllocate:
                    <asp:TextBox ID="DateOfAllocateTextBox" runat="server" Text='<%# Bind("DateOfAllocate") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">AssetName:
                    <asp:TextBox ID="AssetNameTextBox" runat="server" Text='<%# Bind("AssetName") %>' />
                    <br />Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />Weight:
                    <asp:TextBox ID="WeightTextBox" runat="server" Text='<%# Bind("Weight") %>' />
                    <br />DateOfPurchase:
                    <asp:TextBox ID="DateOfPurchaseTextBox" runat="server" Text='<%# Bind("DateOfPurchase") %>' />
                    <br />Price:
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <br />D_Id:
                    <asp:TextBox ID="D_IdTextBox" runat="server" Text='<%# Bind("D_Id") %>' />
                    <br />B_Id:
                    <asp:TextBox ID="B_IdTextBox" runat="server" Text='<%# Bind("B_Id") %>' />
                    <br />AccessionNo:
                    <asp:TextBox ID="AccessionNoTextBox" runat="server" Text='<%# Bind("AccessionNo") %>' />
                    <br />BillNo:
                    <asp:TextBox ID="BillNoTextBox" runat="server" Text='<%# Bind("BillNo") %>' />
                    <br />VendorName:
                    <asp:TextBox ID="VendorNameTextBox" runat="server" Text='<%# Bind("VendorName") %>' />
                    <br />VendorAddress:
                    <asp:TextBox ID="VendorAddressTextBox" runat="server" Text='<%# Bind("VendorAddress") %>' />
                    <br />status:
                    <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                    <br />warranty:
                    <asp:TextBox ID="warrantyTextBox" runat="server" Text='<%# Bind("warranty") %>' />
                    <br />DateOfAllocate:
                    <asp:TextBox ID="DateOfAllocateTextBox" runat="server" Text='<%# Bind("DateOfAllocate") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">A_Id:
                    <asp:Label ID="A_IdLabel" runat="server" Text='<%# Eval("A_Id") %>' />
                    <br />AssetName:
                    <asp:Label ID="AssetNameLabel" runat="server" Text='<%# Eval("AssetName") %>' />
                    <br />Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />Weight:
                    <asp:Label ID="WeightLabel" runat="server" Text='<%# Eval("Weight") %>' />
                    <br />DateOfPurchase:
                    <asp:Label ID="DateOfPurchaseLabel" runat="server" Text='<%# Eval("DateOfPurchase") %>' />
                    <br />Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />D_Id:
                    <asp:Label ID="D_IdLabel" runat="server" Text='<%# Eval("D_Id") %>' />
                    <br />B_Id:
                    <asp:Label ID="B_IdLabel" runat="server" Text='<%# Eval("B_Id") %>' />
                    <br />AccessionNo:
                    <asp:Label ID="AccessionNoLabel" runat="server" Text='<%# Eval("AccessionNo") %>' />
                    <br />BillNo:
                    <asp:Label ID="BillNoLabel" runat="server" Text='<%# Eval("BillNo") %>' />
                    <br />VendorName:
                    <asp:Label ID="VendorNameLabel" runat="server" Text='<%# Eval("VendorName") %>' />
                    <br />VendorAddress:
                    <asp:Label ID="VendorAddressLabel" runat="server" Text='<%# Eval("VendorAddress") %>' />
                    <br />status:
                    <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                    <br />warranty:
                    <asp:Label ID="warrantyLabel" runat="server" Text='<%# Eval("warranty") %>' />
                    <br />DateOfAllocate:
                    <asp:Label ID="DateOfAllocateLabel" runat="server" Text='<%# Eval("DateOfAllocate") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">A_Id:
                    <asp:Label ID="A_IdLabel" runat="server" Text='<%# Eval("A_Id") %>' />
                    <br />AssetName:
                    <asp:Label ID="AssetNameLabel" runat="server" Text='<%# Eval("AssetName") %>' />
                    <br />Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />Weight:
                    <asp:Label ID="WeightLabel" runat="server" Text='<%# Eval("Weight") %>' />
                    <br />DateOfPurchase:
                    <asp:Label ID="DateOfPurchaseLabel" runat="server" Text='<%# Eval("DateOfPurchase") %>' />
                    <br />Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />D_Id:
                    <asp:Label ID="D_IdLabel" runat="server" Text='<%# Eval("D_Id") %>' />
                    <br />B_Id:
                    <asp:Label ID="B_IdLabel" runat="server" Text='<%# Eval("B_Id") %>' />
                    <br />AccessionNo:
                    <asp:Label ID="AccessionNoLabel" runat="server" Text='<%# Eval("AccessionNo") %>' />
                    <br />BillNo:
                    <asp:Label ID="BillNoLabel" runat="server" Text='<%# Eval("BillNo") %>' />
                    <br />VendorName:
                    <asp:Label ID="VendorNameLabel" runat="server" Text='<%# Eval("VendorName") %>' />
                    <br />VendorAddress:
                    <asp:Label ID="VendorAddressLabel" runat="server" Text='<%# Eval("VendorAddress") %>' />
                    <br />status:
                    <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                    <br />warranty:
                    <asp:Label ID="warrantyLabel" runat="server" Text='<%# Eval("warranty") %>' />
                    <br />DateOfAllocate:
                    <asp:Label ID="DateOfAllocateLabel" runat="server" Text='<%# Eval("DateOfAllocate") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
    </div>
    </form>
</body>
</html>
