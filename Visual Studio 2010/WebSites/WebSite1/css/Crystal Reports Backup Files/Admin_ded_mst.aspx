<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_ded_mst.aspx.cs" Inherits="Admin_ded_mst"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: right;
        }
        .style3
        {
            text-align: left;
        }
        .style4
        {
            font-size: medium;
            font-weight: bold;
        }
        .style5
        {
            height: 34px;
        }
        .style6
        {
            height: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style4" colspan="2" style="text-align: center">
                List of Deductions</td>
        </tr>
        <tr>
            <td class="style5" colspan="2" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" Text="MessageInfo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <b>Add New Deduction :<asp:TextBox ID="txtdept_no" runat="server" 
                    Visible="False"></asp:TextBox>
                </b></td>
        </tr>
        <tr>
            <td class="style1">
                Enter 
                Deduction
                Name :</td>
            <td>
                <asp:TextBox ID="txtded_name" runat="server" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtded_name" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Rate(in %) :</td>
            <td>
                <asp:TextBox ID="txtded_rate" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtded_rate" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" class="style6">
                <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                    Text="Save" UseSubmitBehavior="False" Width="60px" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: left">
                <b>Deduction List :</b></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:GridView ID="gdvDept" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" 
                    BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDSdept" 
                    GridLines="Horizontal" onrowdeleted="gdvDept_RowDeleted" 
                    onrowdeleting="gdvDept_RowDeleting" onrowediting="gdvDept_RowEditing" 
                    onrowupdated="gdvDept_RowUpdated" onrowupdating="gdvDept_RowUpdating" 
                    Width="500px">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ded_id" HeaderText="ID" ReadOnly="True" 
                            SortExpression="ded_id" />
                        <asp:BoundField DataField="ded_name" HeaderText="Deduction Name" 
                            SortExpression="ded_name">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ded_rate" HeaderText="Rate" 
                            SortExpression="ded_rate">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:CommandField CausesValidation="False" ShowEditButton="True" />
                        <asp:CommandField CausesValidation="False" ShowDeleteButton="True" />
                    </Columns>
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <asp:SqlDataSource ID="SqlDSdept" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [ded_id], [ded_name], [ded_rate] FROM [ded_mst]">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

