<%@ Page Title="Approve Borrow Request | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="approve_br.aspx.cs" Inherits="WebApplication1._1admin.approve_br" %>
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
                                <th class="th" colspan="2">Borrow Request</th>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Select Request Status:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_reqstatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_reqstatus_SelectedIndexChanged" CssClass="select">
                                        <asp:ListItem>Pending</asp:ListItem>
                                        <asp:ListItem>Approved</asp:ListItem>
                                        <asp:ListItem>Rejected</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" Font-Size="Medium" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="A_Id" DataSourceID="ds_approve_br" ForeColor="#333333" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
                                <asp:BoundField DataField="D_name" HeaderText="Department Name" SortExpression="D_name" />
                                <asp:BoundField DataField="Date_of_Request" HeaderText="Date of Request" SortExpression="Date_of_Request" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:TemplateField HeaderText="Date of Pickup" SortExpression="Date_of_pickup">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Date_of_pickup") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Date_of_pickup", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Date_of_return" HeaderText="Date of Return" SortExpression="Date_of_return" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="Date_of_Approval" HeaderText="Date of Approval" SortExpression="Date_of_Approval" DataFormatString="{0:dd/MM/yyyy}" />
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
                        <asp:SqlDataSource ID="ds_approve_br" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT Asset.AssetName, Borrow_Request.Date_of_Request, Borrow_Request.Date_of_pickup, Borrow_Request.Date_of_return, Borrow_Request.Date_of_Approval, Department.D_name, Borrow_Request.A_Id FROM Asset INNER JOIN Borrow_Request ON Asset.A_Id = Borrow_Request.A_Id full JOIN Department ON Borrow_Request.Requesting_dept_id = Department.D_Id WHERE (Borrow_Request.Req_status = @reqs) AND (Asset.D_Id = @did)" >
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_reqstatus" Name="reqs" PropertyName="SelectedValue" />
                                <asp:SessionParameter Name="did" SessionField="D_Id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <table id="table_btn" runat="server" visible="false">
                            <tr>
                                <td>
                                    <asp:Button ID="btn_app_req" runat="server" Text="Approve Request" OnClick="btn_app_req_Click" CssClass="button" />
                                </td>
                                <td>
                                    <asp:Button ID="btn_rej_req" runat="server" Text="Reject Request" OnClick="btn_rej_req_Click" CssClass="button"  />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
