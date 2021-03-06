﻿<%@ Page Title="Approve Repair Request | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="approve_rr.aspx.cs" Inherits="WebApplication1._1admin.approve_rr" %>

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
                                <th class="th" colspan="2">Repair Request</th>
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
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="sds_viewRR" ForeColor="#333333" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
                                <asp:BoundField DataField="AssetName" HeaderText="Asset Name" SortExpression="AssetName" />
                                <asp:BoundField DataField="D_name" HeaderText="Department Name" SortExpression="D_name" />
                                <asp:BoundField DataField="DateOfAllocate" HeaderText="Date of Allocate" SortExpression="DateOfAllocate" />
                                <asp:BoundField DataField="Date_of_request" HeaderText="Date of request" SortExpression="Date_of_request" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="amount_est" HeaderText="Repairing Amount (Estimated)" SortExpression="amount_est" />
                                <asp:BoundField DataField="Date_of_Approval" HeaderText="Date of Approval" SortExpression="Date_of_Approval" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="amount_actual" HeaderText="Repairing Amount (Actual)" SortExpression="amount_actual" />
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
                        <asp:SqlDataSource ID="sds_viewRR" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" SelectCommand="SELECT Repair_Request.Rr_Id, Asset.A_Id, Asset.AssetName, Asset.DateOfAllocate, Repair_Request.Date_of_request, Repair_Request.amount_est, Repair_Request.Date_of_Approval, Repair_Request.amount_actual, Department.D_name FROM Asset INNER JOIN Repair_Request ON Asset.A_Id = Repair_Request.A_id INNER JOIN Department ON Asset.D_Id = Department.D_Id WHERE (Repair_Request.Req_status = @reqs)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_reqstatus" Name="reqs" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="btn_app_req" runat="server" Text="Approve Request" OnClick="btn_app_req_Click" Visible="false" CssClass="button" />&nbsp
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
