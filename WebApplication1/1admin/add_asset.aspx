<%@ Page Title="Add Asset | Asset Management System" Language="C#" MasterPageFile="~/asset.Master" AutoEventWireup="true" CodeBehind="add_asset.aspx.cs" Inherits="WebApplication1.add_asset2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Csontent2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container_contentpage">
            <div class="content_contentpage">
                <div class="content_addasset">
                    <table >
                        <tr>
                            <th colspan="2" class="th">Add Asset</th>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp</td>
                        </tr>
                        <tr>
                            <td>Asset Name : </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtassetname" runat="server"  CssClass="alltextbox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtassetname" Display="Dynamic" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Description: </td>
                            <td >
                                <asp:TextBox ID="txt_descr" runat="server" CssClass="textarea" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Quantity: </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtquantity" runat="server" CssClass="alltextbox" TextMode="Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtquantity" Display="Dynamic" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Weight (Kg):&nbsp; </td>
                            <td>
                                <asp:TextBox ID="txtweight" runat="server" CssClass="alltextbox" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Date of Purchase:</td>
                            <td>
                                <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="alltextbox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="Date Incorrect" Operator="LessThanEqual" Type="Date"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td >Warranty Period: </td>
                            <td >
                                <asp:TextBox ID="txtwarranty" runat="server" CssClass="alltextbox" TextMode="Number"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Price &#8377:</td>
                            <td>
                                <asp:TextBox ID="txtprice" runat="server" CssClass="alltextbox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtprice" Display="Dynamic" ErrorMessage="Required Field "></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Bill Number: </td>
                            <td>
                                <asp:TextBox ID="txtbillnumber" runat="server" CssClass="alltextbox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtbillnumber" Display="Dynamic" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Vendor Name:</td>
                            <td>
                                <asp:TextBox ID="txtvendorname" runat="server" CssClass="alltextbox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtvendorname" Display="Dynamic" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Vendor Address:</td>
                            <td>
                                <asp:TextBox ID="txtvendoraddress" runat="server" CssClass="alltextbox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtvendoraddress" Display="Dynamic" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="button" /></td>
                            <td >
                                <asp:Button ID="btnreset" runat="server" Text="Reset" CssClass="button" UseSubmitBehavior="false" CausesValidation="false" /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
</asp:Content>
