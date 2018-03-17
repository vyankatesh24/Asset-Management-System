<%@ Page Title="Scrap Request | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="scrap_R.aspx.cs" Inherits="WebApplication1.user.scrap_R" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_contentpage">
        <div class="content_contentpage">
            <div>
                <table>
                    <tr>
                        <th colspan="2" class="th">Scrap Asset</th>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">Search here</td>
                    </tr>
                    <tr>
                        <td>Asset Name:</td>
                        <td>
                            <asp:TextBox ID="txtaname" runat="server" CssClass="alltextbox"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Accsession Number:</td>
                        <td>
                            <asp:TextBox ID="txtaccno" runat="server" CssClass="alltextbox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <asp:Button ID="searchasset" runat="server" Text="Search" OnClick="searchasset_Click" CssClass="button" /></td>
                        <td></td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <asp:GridView ID="searchresultgrid" runat="server" Font-Size="Medium" AutoGenerateColumns="False" DataKeyNames="A_Id" CellPadding="4" ForeColor="#333333" OnSelectedIndexChanged="searchresultgrid_SelectedIndexChanged" DataSourceID="sds_scrapreq">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Asset Id" InsertVisible="False" SortExpression="A_Id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("A_Id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("A_Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="AssetName" HeaderText="Asset Name" SortExpression="AssetName" />
                        <asp:BoundField DataField="DateOfPurchase" HeaderText="Date of Purchase" SortExpression="DateOfPurchase" DataFormatString="{0:dd/MM/yyyy}" />
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
                <asp:SqlDataSource ID="sds_scrapreq" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>"
                    SelectCommand="SELECT DISTINCT Asset.A_Id, Asset.AssetName, Asset.DateOfPurchase, Asset.Price, Asset.AccessionNo FROM Asset LEFT OUTER JOIN Scrap_Request ON Asset.A_Id = Scrap_Request.A_id WHERE (Asset.AccessionNo LIKE '%' + @AccessionNo + '%') AND (Asset.AssetName LIKE '%' + @AssetName + '%') AND (Asset.D_Id = @D_Id) AND (Scrap_Request.A_Id IS NULL OR Scrap_Request.Req_status = 'Rejected')">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="%" Name="AccessionNo" SessionField="accno" Type="String" />
                        <asp:SessionParameter DefaultValue="%" Name="AssetName" SessionField="aname" Type="String" />
                        <asp:SessionParameter DefaultValue="" Name="D_Id" SessionField="did" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <table>
                    <tr>
                        <td>
                        <asp:Button ID="btn_scr" Visible="false" runat="server" Text="Scrap Request" OnClick="btn_scr_Click" CssClass="button" />
                            </td>
                        <td>
                            <asp:Button ID="btn_reset" runat="server" Text="Reset"   Visible="false" CssClass="button"  />
                        </td>
                    </tr>
                </table>
            </div>
            <div>
            </div>
        </div>
    </div>

</asp:Content>

