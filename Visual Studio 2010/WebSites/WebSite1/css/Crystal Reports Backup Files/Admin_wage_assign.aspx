<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_wage_assign.aspx.cs" Inherits="Admin_wage_assign"  %>

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
                Assignment of Wage Rate to Employee</td>
        </tr>
        <tr>
            <td class="style5" colspan="2" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" Text="MessageInfo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <b>View and Update Wage Rates :</b></td>
        </tr>
        <tr>
            <td class="style1">
                Select Department :</td>
            <td>
                <asp:DropDownList ID="ddlDept" runat="server" DataSourceID="sdsDept" 
                    DataTextField="dept_name" DataValueField="dept_no" AutoPostBack="True" 
                    onselectedindexchanged="ddlDept_SelectedIndexChanged" Width="127px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ddlDept" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Select Employee :</td>
            <td>
                <asp:DropDownList ID="ddlEmp" runat="server" DataSourceID="sdsEmployee" 
                    DataTextField="emp_name" DataValueField="emp_no" AutoPostBack="True" 
                    onselectedindexchanged="ddlEmp_SelectedIndexChanged" Width="127px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="ddlEmp" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Basic Salary :</td>
            <td>
                <asp:TextBox ID="txtemp_bas_sal" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtemp_bas_sal" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Allowances :</td>
            <td>
                <asp:CheckBoxList ID="cblAllow" runat="server" DataSourceID="sdsAllow" 
                    DataTextField="all_name" DataValueField="all_id" RepeatColumns="3" 
                    RepeatDirection="Horizontal">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Deductions :</td>
            <td>
                <asp:CheckBoxList ID="cblDed" runat="server" DataSourceID="sdsDed" 
                    DataTextField="ded_name" DataValueField="ded_id" RepeatColumns="3" 
                    RepeatDirection="Horizontal">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Perks :</td>
            <td>
                <asp:CheckBoxList ID="cblPerk" runat="server" DataSourceID="sdsPerk" 
                    DataTextField="perk_name" DataValueField="perk_id" RepeatColumns="3" 
                    RepeatDirection="Horizontal">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Tax :</td>
            <td>
                <asp:CheckBoxList ID="cblTax" runat="server" DataSourceID="sdsTax" 
                    DataTextField="tax_name" DataValueField="tax_id" RepeatColumns="3" 
                    RepeatDirection="Horizontal">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" class="style6">
                <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                    Text="Update" UseSubmitBehavior="False" Width="60px" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: left" class="style6">
                <asp:SqlDataSource ID="sdsAllow" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [all_id], [all_name], [all_rate] FROM [all_mst]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsDed" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [ded_id], [ded_name], [ded_rate] FROM [ded_mst]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsPerk" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [perk_id], [perk_name], [perk_rate] FROM [perk_mst]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsTax" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [tax_id], [tax_name], [tax_rate] FROM [tax_mst]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsDept" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [dept_no], [dept_name] FROM [dept_mst]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsEmployee" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    SelectCommand="SELECT [emp_no], [emp_name] FROM [emp_mst] WHERE ([department] = @department)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlDept" DefaultValue="1" Name="department" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                &nbsp;</td>
        </tr>
    </table>
    </form>
</asp:Content>

