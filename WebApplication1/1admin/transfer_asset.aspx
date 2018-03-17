<%@ Page Title="Transfer Asset | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="transfer_asset.aspx.cs" Inherits="WebApplication1._1admin.transfer_asset" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .button {
            top: 0px;
            left: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_contentpage">
        <div class="content_contentpage">
            <div>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <table>
                    <tr>
                        <th colspan="2" class="th">Transfer Asset</th>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">Search here</td>
                    </tr>
                    <tr>
                        <td>Asset Name:</td>
                        <td>
                            <asp:TextBox ID="txt_aname" runat="server" CssClass="alltextbox"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Department Name:</td>
                        <td>
                            <asp:DropDownList ID="drp_dept_name" runat="server" CssClass="select"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>&nbsp</td>
                        <td>&nbsp</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="btn_search_Click" CssClass="button" />
                        </td>
                    </tr>
                </table>
                <br />

                <asp:GridView ID="gridtransfer" Font-Size="Medium" runat="server" AutoGenerateColumns="False" DataSourceID="ds_transfer_grid" DataKeyNames="A_Id" CellPadding="4" ForeColor="#333333" OnRowEditing="gridtransfer_RowEditing">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Asset ID" InsertVisible="False" SortExpression="A_Id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("A_Id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("A_Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="AssetName" HeaderText="Asset Name" SortExpression="AssetName" ReadOnly="true" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" ReadOnly="true" />
                        <asp:BoundField DataField="D_name" HeaderText="Department Name" SortExpression="D_name" ReadOnly="true" />
                        <asp:BoundField DataField="AccessionNo" HeaderText="Accession Number" SortExpression="AccessionNo" ReadOnly="true" />
                        <asp:TemplateField HeaderText="Select Department">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_deptname" runat="server" DataSourceID="ds_transfer_ddl_deptname" DataTextField="D_name" DataValueField="D_Id"></asp:DropDownList>
                                <asp:SqlDataSource ID="ds_transfer_ddl_deptname" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT [D_Id], [D_name] FROM [Department]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="ddl_deptname1" runat="server" Enabled="false">
                                    <asp:ListItem>Department Name</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="Click Here">
                            <EditItemTemplate>
                                <asp:Button ID="btn_transfer" runat="server" OnClick="btn_transfer_Click" Text="Transfer" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Select Department to Transfer" />
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
                <asp:SqlDataSource ID="ds_transfer_grid" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT Asset.A_Id, Asset.AssetName, Asset.Description, Department.D_name, Asset.AccessionNo FROM Asset INNER JOIN Department ON Asset.D_Id = Department.D_Id WHERE (Convert(varchar(20),Asset.D_Id) like @D_Id) AND (Asset.AssetName LIKE '%' + @A_Name + '%')">
                    <SelectParameters>
                        <asp:SessionParameter Name="D_Id" SessionField="D_Id" DefaultValue="%" />
                        <asp:SessionParameter Name="A_Name" SessionField="A_Name" DefaultValue="%" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>
