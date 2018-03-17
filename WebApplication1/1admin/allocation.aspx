<%@ Page Title="Allocation | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="allocation.aspx.cs" Inherits="WebApplication1.allocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_contentpage">
        <div class="content_contentpage">
                <div class="content_allocation">
                    <table>
                        <tr>
                            <th class="th">
                                Allocate Asset to Department
                            </th>
                        </tr>
                        <tr>
                            <td>&nbsp</td>
                        </tr>
                    </table>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="A_Id" DataSourceID="ds_asset" CellPadding="4" ForeColor="#333333" Width="676px"
                         OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Asset ID" InsertVisible="False" SortExpression="A_Id">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("A_Id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("A_Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="AssetName" HeaderText="Asset Name" SortExpression="AssetName" ReadOnly="true" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" ReadOnly="true"/>
                            <asp:BoundField DataField="DateOfPurchase" HeaderText="Date Of Purchase" SortExpression="DateOfPurchase" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="true"/>
                            <asp:BoundField DataField="BillNo" HeaderText="BillNo" SortExpression="Bill No" ReadOnly="true" />
                            <asp:BoundField DataField="VendorName" HeaderText="VendorName" SortExpression="Vendor Name" ReadOnly="true" />
                            <asp:TemplateField HeaderText="Select Department" SortExpression="D_Id">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="false" >
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" Enabled="false">
                                        <asp:ListItem>Department Name</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Button ID="btn_update" runat="server" Text="Allocate" OnClick="btn_update_Click" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Select Department" />
                                </ItemTemplate>
                                <ControlStyle Font-Size="Large" />
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
                    <asp:SqlDataSource ID="ds_asset" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT [A_Id], [Description], [AssetName], [DateOfPurchase], [BillNo], [VendorName], [D_Id] FROM [Asset] WHERE ([D_Id] IS NULL)" ></asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </div>

        </div>
    </div>
</asp:Content>
