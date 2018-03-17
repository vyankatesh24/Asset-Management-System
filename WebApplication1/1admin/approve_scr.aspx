<%@ Page Title="Approve Scrap Request | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="approve_scr.aspx.cs" Inherits="WebApplication1._1admin.approve_scr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_contentpage">
        <div class="content_contentpage">
            <div>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <th class="th" colspan="2">Scrap Request</th>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Select Request Status:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_reqstatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_reqstatus_SelectedIndexChanged" CssClass="select" >
                                        <asp:ListItem>Pending</asp:ListItem>
                                        <asp:ListItem>Approved</asp:ListItem>
                                        <asp:ListItem>Rejected</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="view_scr" ForeColor="#333333" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Sr_Id" InsertVisible="False" SortExpression="Sr_Id" Visible="false">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Sr_Id") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Sr_Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Asset Id" InsertVisible="False" SortExpression="A_Id">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("A_Id") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("A_Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="AssetName" HeaderText="Asset Name" SortExpression="AssetName"/>
                                <asp:BoundField DataField="D_name" HeaderText="Department Name" SortExpression="D_name" />
                                <asp:BoundField DataField="Date_of_request" HeaderText="Date of Request" SortExpression="Date_of_request" />
                                <asp:BoundField DataField="Date_of_Approval" HeaderText="Date of Approval" SortExpression="Date_of_Approval" />
                                <asp:BoundField DataField="Amount_Released" HeaderText="Amount Released" SortExpression="Amount_Released" />
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
                        <br />
                        <asp:SqlDataSource ID="view_scr" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>"
                            SelectCommand="SELECT Asset.A_Id, Asset.AssetName, Department.D_name, Scrap_Request.Date_of_request, Scrap_Request.Sr_Id, Scrap_Request.Date_of_Approval, Scrap_Request.Amount_Released FROM Asset INNER JOIN Department ON Asset.D_Id = Department.D_Id INNER JOIN Scrap_Request ON Asset.A_Id = Scrap_Request.A_id WHERE (Scrap_Request.Req_status = @req)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_reqstatus" Name="req" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="btn_app_req" runat="server" Text="Approve Request" OnClick="btn_app_req_Click" Visible="false" CssClass="button"/>&nbsp
                                </td>
                                <td>
                                    <asp:Button ID="btn_rej_req" runat="server" Text="Reject Request" OnClick="btn_rej_req_Click" Visible="false" CssClass="button" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
