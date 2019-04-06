<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_des_mst.aspx.cs" Inherits="Admin_des_mst" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: left;
            height: 28px;
            width: 139px;
        }
        .style3
        {
            height: 28px;
        }
        .style4
        {
            width: 139px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td colspan="2" style="font-size: medium; font-weight: 700; text-align: center">
                <marquee><img src="../e.jpg" style="height: 136px; width: 360px; float: left;" /><img 
                    src="p4.jpeg" 
                    style="height: 136px; width: 326px; float: right; margin-left: 0px;" /></marquee></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="font-size: medium; font-weight: 700; text-align: center">
                List of Designation</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" Text="MessageInfo" 
                    style="font-size: small"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: left; font-weight: 700">
                Add New Designation :<asp:TextBox ID="des_no" runat="server" Visible="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Select
                Department :</td>
            <td style="text-align: left" class="style3">
                <asp:DropDownList ID="ddldept_name" runat="server" DataSourceID="SqlDSDept" 
                    DataTextField="dept_name" DataValueField="dept_no" Width="129px" 
                    AutoPostBack="True" style="margin-left: 0px">
                </asp:DropDownList>
            </td>
            <td class="style3">
                </td>
        </tr>
        <tr>
            <td style="text-align: left" class="style4">
                Enter Designation Name :</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtdes_name" runat="server" style="text-align: left"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtdes_name" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Save" 
                    UseSubmitBehavior="False" />
                <asp:SqlDataSource ID="SqlDSDept" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [dept_no], [dept_name] FROM [dept_mst]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <b>DesignationList :</b></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gdvDept" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" 
                    BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDSdes" 
                    GridLines="Horizontal" onrowdeleted="gdvDept_RowDeleted" 
                    onrowdeleting="gdvDept_RowDeleting" onrowediting="gdvDept_RowEditing" 
                    onrowupdated="gdvDept_RowUpdated" onrowupdating="gdvDept_RowUpdating" 
                    Width="500px">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="des_no" HeaderText="Des. ID" ReadOnly="True" 
                            SortExpression="des_no" />
                        <asp:BoundField DataField="des_name" HeaderText="Designation" 
                            SortExpression="des_name">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                        </asp:BoundField>
                        
                        <asp:CommandField CausesValidation="False" ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:SqlDataSource ID="SqlDSdes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    
                    SelectCommand="SELECT [des_no], [des_name] FROM [des_mst] WHERE ([dept_no] = @dept_no) ORDER BY [des_name]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddldept_name" DefaultValue="0" Name="dept_no" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
     </form>
</asp:Content>

