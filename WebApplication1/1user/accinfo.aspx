<%@ Page Title="Accession Details | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="accinfo.aspx.cs" Inherits="WebApplication1._1admin.accinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_contentpage">
        <div class="content_contentpage">
            <div class="content_accinfo">
                <table>
                        <tr>
                            <th class="th">
                                Accession Details
                            </th>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" Font-Size="Medium" runat="server" AutoGenerateColumns="False" DataKeyNames="A_Id" DataSourceID="ds_accinfo" CellPadding="4" ForeColor="#333333">
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
                        <asp:BoundField DataField="AssetName" HeaderText="Asset Name" SortExpression="AssetName" ReadOnly="true" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" ReadOnly="true" />
                        <asp:BoundField DataField="DateOfAllocate" HeaderText="Date of Allocate" SortExpression="DateOfAllocate" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="true" />

                        <asp:TemplateField HeaderText="Accession Number" SortExpression="AccessionNo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("AccessionNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="btn_update" runat="server" CausesValidation="True"  Text="Update" OnClick="btn_update_Click" />
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
                
                <asp:SqlDataSource ID="ds_accinfo" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT A_Id, Description, AssetName, DateOfAllocate, AccessionNo FROM Asset WHERE (D_Id = @D_Id) AND [AccessionNo] IS NULL">
                    <SelectParameters>
                        <asp:SessionParameter Name="D_Id" SessionField="did" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
                
            </div>
        </div>
    </div>
</asp:Content>
