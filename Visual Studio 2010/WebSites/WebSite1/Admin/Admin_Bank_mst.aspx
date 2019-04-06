<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_Bank_mst.aspx.cs" Inherits="Admin_Bank_mst"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
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
        .style7
        {
            text-align: left;
            width: 111px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style4" colspan="2" style="text-align: center">
                 <img src="../e.jpg" style="height: 136px; width: 360px; float: left;" alt=""/>
                 <img src="p4.jpeg"style="height: 136px; width: 326px; float: right; margin-left: 0px;" alt=""
                 /></td>
        </tr>
        <tr>
            <td class="style4" colspan="2" style="text-align: center">
                List of Bank</td>
        </tr>
        <tr>
            <td class="style5" colspan="2" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" Text="MessageInfo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <b>Add New Bank :<asp:TextBox ID="txtdept_no" runat="server" 
                    Visible="False"></asp:TextBox>
                </b></td>
        </tr>
        <tr>
            <td class="style7">
                Enter Bank
                Name :</td>
            <td>
                <asp:TextBox ID="txtbank_name" runat="server" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtbank_name" Display="Dynamic" ErrorMessage="*Please Enter your bank name" 
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Enter Branch Name :</td>
            <td>
                <asp:TextBox ID="txtbranch_name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtbranch_name" Display="Dynamic" ErrorMessage="*Enter branch name" 
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
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
                <b>Bank List :</b></td>
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
                        <asp:BoundField DataField="bank_id" HeaderText="ID" SortExpression="bank_id" />
                        <asp:BoundField DataField="bank_name" HeaderText="Bank Name" 
                            SortExpression="bank_name" />
                        <asp:BoundField DataField="branch_name" HeaderText="Branch Name" 
                            SortExpression="branch_name" />
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
                    
                    SelectCommand="SELECT [bank_id], [bank_name], [branch_name] FROM [bank_mst]">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

