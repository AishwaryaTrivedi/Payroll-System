<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_Emp_JobLeave.aspx.cs" Inherits="Admin_Emp_JobLeave"  %>

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
                Employee Leaving Fund Calculations</td>
        </tr>
        <tr>
            <td class="style5" colspan="2" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" Text="MessageInfo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Select Department :</td>
            <td>
                <asp:DropDownList ID="ddlDept" runat="server" DataSourceID="sdsDept" 
                    DataTextField="dept_name" DataValueField="dept_no" Width="158px" 
                    AutoPostBack="True">
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
                    DataTextField="emp_name" DataValueField="emp_no" Width="158px" 
                    AutoPostBack="True">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="ddlEmp" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Enter Leaving Date :</td>
            <td>
                <asp:TextBox ID="txtleave_date" runat="server" MaxLength="30"></asp:TextBox>
                &nbsp;(mm/dd/yyyy)
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtleave_date" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btnCalculate" runat="server" onclick="btnSubmit_Click" 
                    Text="Calculate" UseSubmitBehavior="False" Width="80px" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                Provident Fund :</td>
            <td>
                <asp:Label ID="lblProvFund" runat="server" Text="lblProvFund"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Graduity :</td>
            <td>
                <asp:Label ID="lblGraduity" runat="server" Text="lblGraduity"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btnResign" runat="server" onclick="btnResign_Click" 
                    Text="Resign Employee" UseSubmitBehavior="False" Width="124px" />
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <asp:SqlDataSource ID="sdsDept" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [dept_no], [dept_name] FROM [dept_mst]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsEmployee" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    SelectCommand="SELECT emp_no, emp_name + ' ( ' + CONVERT(varchar(30), emp_no) + ' ) ' AS emp_name FROM [emp_mst] WHERE ([department] = @department)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlDept" DefaultValue="1" Name="department" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDSdept" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    SelectCommand="SELECT [bank_id], [bank_name], [branch_name] FROM [bank_mst]">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

