<%@ Page Title="" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="repair_req.aspx.cs" Inherits="WebApplication1._1user.repair_req" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_contentpage">
        <div class="content_contentpage">
            <div>
                 <table>
                    <tr>
                        <th colspan="2" class="th">Repair Asset</th>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">Search here</td>
                    </tr>
                    <tr>
                        <td>Asset Name:
                        </td>
                        <td>
                            <asp:TextBox ID="txtaname" runat="server" CssClass="alltextbox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Accsession Number:</td>
                        <td>
                            <asp:TextBox ID="txtaccno" runat="server" CssClass="alltextbox"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Button ID="searchasset" runat="server" Text="Search" CssClass="button" /></td>

                    </tr>
                </table>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="A_Id" DataSourceID="sds_repair_req" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="A_Id" HeaderText="Asset Id" InsertVisible="False" ReadOnly="True" SortExpression="A_Id" />
                        <asp:BoundField DataField="AssetName" HeaderText="Asset Name" SortExpression="AssetName" />
                        <asp:BoundField DataField="DateOfAllocate" HeaderText="Date of Allocate" SortExpression="DateOfAllocate" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="AccessionNo" HeaderText="Accession Number" SortExpression="AccessionNo" />
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
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
                <asp:SqlDataSource ID="sds_repair_req" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT [A_Id], [AssetName], [DateOfAllocate], [Price], [AccessionNo] FROM [Asset] WHERE (([AssetName] LIKE '%' + @AssetName + '%') AND ([AccessionNo] = @AccessionNo) AND ([D_Id] = @D_Id) AND ([status] = @status))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtaname" DefaultValue="%" Name="AssetName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtaccno" DefaultValue="%" Name="AccessionNo" PropertyName="Text" Type="String" />
                        <asp:SessionParameter Name="D_Id" SessionField="DeptId_repair_req" Type="Int32" />
                        <asp:Parameter DefaultValue="Working" Name="status" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
