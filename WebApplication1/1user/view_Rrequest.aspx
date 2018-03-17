<%@ Page Title="View Repair Request | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="view_Rrequest.aspx.cs" Inherits="WebApplication1._1user.view_Rrequest" %>

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
                                <th class="th" colspan="2">View Repair Request</th>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Select Request Status:
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
                        <asp:GridView ID="GridView1" runat="server" Font-Size="Medium" AutoGenerateColumns="False" CellPadding="4" DataSourceID="sds_R_request" ForeColor="#333333" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Rr_Id" InsertVisible="False" SortExpression="Rr_Id" Visible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Rr_Id") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Rr_Id") %>'></asp:Label>
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
                                <asp:BoundField DataField="AssetName" HeaderText="Asset Name" SortExpression="AssetName"  />
                                <asp:BoundField DataField="DateOfAllocate" HeaderText="Date of Allocate" SortExpression="DateOfAllocate" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="Date_of_request" HeaderText="Date of Request" SortExpression="Date_of_request" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="Date_of_Approval" HeaderText="Date of Approval" SortExpression="Date_of_Approval" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="amount_est" HeaderText="Amount (Estimated)" SortExpression="amount_est" />
                                <asp:BoundField DataField="amount_actual" HeaderText="Amount (Actual)" SortExpression="amount_actual" />
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
                        <table id="table" runat="server" visible="false">
                            <tr>
                                <td>Enter Amount of Repairing(Actual):
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_amt_act" runat="server" CssClass="alltextbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" Display="Dynamic" ControlToValidate="txt_amt_act"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp</td>
                                <td>&nbsp</td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btn_submit_Click" CssClass="button" /></td>
                                <td>
                                    <asp:Button ID="btn_reset" runat="server" Text="Reset" OnClick="btn_reset_Click" CssClass="button" />
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="sds_R_request" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT Asset.A_Id, Asset.AssetName, Asset.DateOfAllocate, Repair_Request.Date_of_request, Repair_Request.Date_of_Approval, Repair_Request.amount_est, Repair_Request.amount_actual, Repair_Request.Rr_Id FROM Asset LEFT OUTER JOIN Repair_Request ON Asset.A_Id = Repair_Request.A_id WHERE (Asset.D_Id = @D_Id) AND (Repair_Request.Req_status = @reqs)">
                            <SelectParameters>
                                <asp:SessionParameter Name="D_Id" SessionField="D_Id" />
                                <asp:ControlParameter ControlID="ddl_reqstatus" Name="reqs" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
