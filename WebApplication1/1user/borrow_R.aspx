<%@ Page Title="Borrow Request | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="borrow_R.aspx.cs" Inherits="WebApplication1.user.borrow_R" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_contentpage">
        <div class="content_contentpage">
            <div>
                <table>
                    <tr>
                        <td>Asset Name</td>
                        <td>
                            <asp:TextBox ID="txtaname" runat="server" CssClass="alltextbox"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Department Name:</td>
                        <td>
                            <asp:DropDownList ID="ddl_dept_name" runat="server" CssClass="select"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="btn_search_Click" CssClass="button" />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Size="Medium" CellPadding="4" DataKeyNames="A_Id" ForeColor="#333333" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="SqlDataSource1">
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
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="D_name" HeaderText="Department name" SortExpression="D_name" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
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

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>"
                    SelectCommand="SELECT Asset.A_Id, Asset.AssetName, Asset.Description, Asset.Price, Department.D_name FROM Asset INNER JOIN Department ON Asset.D_Id = Department.D_Id WHERE (Convert(varchar(20),Asset.D_Id) like @D_Id) AND (Asset.AssetName LIKE '%' + @A_Name + '%') AND Department.U_Id!=@uid AND Asset.status='Working'">
                    <SelectParameters>
                        <asp:SessionParameter Name="D_Id" SessionField="D_Id" DefaultValue="%" />
                        <asp:SessionParameter Name="A_Name" SessionField="A_Name" DefaultValue="%" />
                        <asp:SessionParameter Name="uid" SessionField="uid" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <table id="table_borrow" runat="server" visible="false">
                    <tr>
                        <td>Enter Date(from):</td>
                        <td>
                            <asp:TextBox ID="txt_date" runat="server" TextMode="Date" Placeholder="mm/dd/yyyy" CssClass="alltextbox"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txt_date" Display="Dynamic" ErrorMessage="Date is older " Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Enter Date(to):</td>
                        <td>
                            <asp:TextBox ID="txt_date1" runat="server" TextMode="Date" Placeholder="mm/dd/yyyy" CssClass="alltextbox"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_date" ControlToValidate="txt_date1" Display="Dynamic" ErrorMessage="first date is greater" Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>

                        </td>

                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btn_chk_avail" runat="server" Text="Check Availiability" OnClick="btn_chk_avail_Click" CssClass="button" CausesValidation="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp</td>
                    </tr>
                    <tr>
                        <td>Date (from):</td>
                        <td>
                            <asp:TextBox ID="txt_datefrom" runat="server" TextMode="Date" Placeholder="mm/dd/yyyy" CssClass="alltextbox"> </asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="txt_datefrom" Display="Dynamic" ErrorMessage="Date is older " Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Date (to):
                        </td>
                        <td>
                            <asp:TextBox ID="txt_dateto" runat="server" TextMode="Date" Placeholder="mm/dd/yyyy" CssClass="alltextbox"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="First date is greater" ControlToCompare="txt_datefrom" ControlToValidate="txt_dateto" Display="Dynamic" Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btn_borrow_req" runat="server" Text="Borrow Request" OnClick="btn_borrow_req_Click" CssClass="button" /></td>
                        <td>
                            <asp:Button ID="btn_reset" runat="server" Text="Reset" OnClick="btn_reset_Click" CssClass="button" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

</asp:Content>
