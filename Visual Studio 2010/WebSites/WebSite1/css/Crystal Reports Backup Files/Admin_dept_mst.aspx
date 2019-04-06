<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_dept_mst.aspx.cs" Inherits="Admin_dept_mst"  %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style4" colspan="2" style="text-align: center">
                List of Departments</td>
        </tr>
        <tr>
            <td class="style5" colspan="2" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" Text="MessageInfo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <b>Add New Department :<asp:TextBox ID="txtdept_no" runat="server" 
                    Visible="False"></asp:TextBox>
                </b></td>
        </tr>
        <tr>
            <td class="style1">
                Enter Department Name :</td>
            <td>
                <asp:TextBox ID="txtdept_name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtdept_name" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                    Text="Save" UseSubmitBehavior="False" Width="60px" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: left">
                <b>Department List :</b></td>
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
                        <asp:BoundField DataField="dept_no" HeaderText="Dept. ID" ReadOnly="True" 
                            SortExpression="dept_no">
                            <ItemStyle VerticalAlign="Top" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dept_name" HeaderText="Dept. Name" 
                            SortExpression="dept_name">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="250px" />
                        </asp:BoundField>
                        <asp:CommandField CausesValidation="False" ShowEditButton="True">
                            <ItemStyle Width="100px" />
                        </asp:CommandField>
                        <asp:CommandField CausesValidation="False" ShowDeleteButton="True">
                            <ItemStyle Width="50px" />
                        </asp:CommandField>
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
                    SelectCommand="SELECT [dept_no], [dept_name] FROM [dept_mst]">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

