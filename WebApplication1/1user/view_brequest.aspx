<%@ Page Title="View Borrow Request | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="view_brequest.aspx.cs" Inherits="WebApplication1._1user.view_brequest" %>
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
                                <th class="th" colspan="2">View Borrow Request</th>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Select Request Status:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_reqstatus" runat="server" AutoPostBack="true" CssClass="select">
                                        <asp:ListItem>Pending</asp:ListItem>
                                        <asp:ListItem>Approved</asp:ListItem>
                                        <asp:ListItem>Rejected</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" Font-Size="Medium" AutoGenerateColumns="False" CellPadding="4" DataSourceID="view_br" ForeColor="#333333">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="A_Id" HeaderText="Asset Id" SortExpression="A_Id" />
                                <asp:BoundField DataField="AssetName" HeaderText="Asset Name" SortExpression="AssetName" />
                                <asp:BoundField DataField="Date_of_Request" HeaderText="Date of Request" SortExpression="Date_of_Request" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="Date_of_pickup" HeaderText="Date of Pickup" SortExpression="Date_of_pickup" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="Date_of_return" HeaderText="Date of Return" SortExpression="Date_of_return" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="Date_of_Approval" HeaderText="Date of Approval" SortExpression="Date_of_Approval" DataFormatString="{0:dd/MM/yyyy}" />
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
                        <asp:SqlDataSource ID="view_br" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT Borrow_Request.A_Id, Asset.AssetName, Borrow_Request.Date_of_Request, Borrow_Request.Date_of_pickup, Borrow_Request.Date_of_return, Borrow_Request.Date_of_Approval FROM Asset INNER JOIN Borrow_Request ON Asset.A_Id = Borrow_Request.A_Id WHERE (Borrow_Request.Req_status = @reqs) AND (Borrow_Request.Requesting_dept_id = @did)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_reqstatus" Name="reqs" PropertyName="SelectedValue" />
                                <asp:SessionParameter Name="did" SessionField="D_Id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
