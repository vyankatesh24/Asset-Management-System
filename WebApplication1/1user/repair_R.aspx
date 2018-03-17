<%@ Page Title="Repair Request | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="repair_R.aspx.cs" Inherits="WebApplication1.user.repair_R" %>

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
                            <asp:TextBox ID="txtaname" runat="server" CssClass="alltextbox" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Accsession Number:</td>
                        <td>
                            <asp:TextBox ID="txtaccno" runat="server" CssClass="alltextbox" ></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Button ID="searchasset" runat="server" Text="Search" OnClick="searchasset_Click" CssClass="button" /></td>

                    </tr>
                </table>
                <br />
                <br />
                <br />
                <asp:GridView ID="searchresultgrid" runat="server" Font-Size="Medium" AutoGenerateColumns="False" DataKeyNames="A_Id" CellPadding="4" ForeColor="#333333" OnSelectedIndexChanged="searchresultgrid_SelectedIndexChanged" DataSourceID="sds_repair_R">
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
                        <asp:BoundField DataField="DateOfAllocate" HeaderText="Date of Allocate" SortExpression="DateOfPurchase" DataFormatString="{0:dd/MM/yyyy}" />
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
                <asp:SqlDataSource ID="sds_repair_R" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT AssetName, A_Id, DateOfAllocate, Price, AccessionNo FROM Asset WHERE (AssetName LIKE '%' + @aname + '%') AND (AccessionNo LIKE '%' + @accno + '%') AND (D_Id = @did) AND (status = 'Working')">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="%" Name="aname" SessionField="aname" />
                        <asp:SessionParameter DefaultValue="%" Name="accno" SessionField="accno" />
                        <asp:SessionParameter DefaultValue="" Name="did" SessionField="D_Id" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <table id="table" runat="server" visible="false">
                    <tr>
                        <td>Enter Amount of Repairing(estimated):
                        </td>
                        <td>
                            <asp:TextBox ID="txt_amt_est" runat="server" CssClass ="alltextbox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" Display="Dynamic" ControlToValidate="txt_amt_est"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp</td>
                        <td>&nbsp</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btn_rep_req" runat="server" Text="Add New Request" OnClick="btn_rep_req_Click"  CssClass="button"/></td>
                        <td>
                            <asp:Button ID="btn_reset" runat="server" Text="Reset" OnClick="btn_reset_Click" CssClass="button" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
