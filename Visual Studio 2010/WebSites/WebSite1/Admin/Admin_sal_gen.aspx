<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_sal_gen.aspx.cs" Inherits="Admin_sal_gen"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
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
            <td  colspan="4" style="text-align: center">
                <marquee><img src="../e.jpg" style="height: 136px; width: 360px; float: left;" /><img 
                    src="p4.jpeg" style="height: 136px; width: 356px; float: right" /></marquee></td>
        </tr>
        <tr>
            <td  colspan="4" style="text-align: center">
                <span style="font-size: 12pt"><strong>
                Employee Salary Generation</strong></span></td>
        </tr>
        <tr>
            <td  colspan="4" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" Text="MessageInfo"></asp:Label>
                &nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td  colspan="4">
                <b>Generate Salary :</b></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                Select Department :</td>
            <td>
                <asp:DropDownList ID="ddlDept" runat="server" DataSourceID="sdsDept" 
                    DataTextField="dept_name" DataValueField="dept_no" Width="158px" 
                    AutoPostBack="True" onselectedindexchanged="ddlDept_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ddlEmp" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td>
                From Date :</td>
            <td>
                <asp:TextBox ID="txtFromDate" runat="server" Width="100px"></asp:TextBox>
&nbsp;(mm/dd/yyyy)
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtFromDate" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                Select Employee :</td>
            <td>
                <asp:DropDownList ID="ddlEmp" runat="server" DataSourceID="sdsEmployee" 
                    DataTextField="emp_name" DataValueField="emp_no" Width="158px" 
                    AutoPostBack="True" onselectedindexchanged="ddlEmp_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="ddlEmp" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td>
                To Date :</td>
            <td>
                <asp:TextBox ID="txtToDate" runat="server" Width="100px"></asp:TextBox>
&nbsp;(mm/dd/yyyy)
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtToDate" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                <b>Basic Salary :</b></td>
            <td>
                <asp:Label ID="txtemp_bas_sal" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="vertical-align: top" >
                Allowances :</td>
            <td>
                <asp:ListBox ID="lstAllow" runat="server" Width="200px" Height="80px" 
                    Rows="10"></asp:ListBox>
            </td>
            <td style="vertical-align: top">
                Deductions :</td>
            <td>
                <asp:ListBox ID="lstDed" runat="server" Width="200px" Height="80px"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right" >
                Total :</td>
            <td>
                <asp:Label ID="txtemp_total_all" runat="server"></asp:Label>
            </td>
            <td style="text-align: right">
                Total :</td>
            <td>
                <asp:Label ID="txtemp_total_ded" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top" >
                Perks :</td>
            <td>
                <asp:ListBox ID="lstPerk" runat="server" Width="200px" Height="80px"></asp:ListBox>
            </td>
            <td style="vertical-align: top">
                Tax :</td>
            <td>
                <asp:ListBox ID="lstTax" runat="server" Width="200px" Height="80px"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right" >
                Total :</td>
            <td>
                <asp:Label ID="txtemp_total_perk" runat="server"></asp:Label>
            </td>
            <td style="text-align: right">
                Total :</td>
            <td>
                <asp:Label ID="txtemp_total_tax" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                Loans :</td>
            <td>
                <asp:Label ID="txtemp_loan" runat="server"></asp:Label>
                                            </td>
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                Leaves :</td>
            <td>
                <asp:Label ID="txtemp_overLeave" runat="server"></asp:Label>
                                            </td>
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;&nbsp;</td>
            <td>
                Absent
                Leaves :</td>
            <td>
                <asp:Label ID="txtemp_leave" runat="server"></asp:Label>
                                            </td>
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                <b>Net Salary :</b></td>
            <td>
                <asp:Label ID="txtemp_net_sal" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center" class="style6">
                <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                    Text="Save" UseSubmitBehavior="False" Width="60px" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: left" class="style6">
                <asp:SqlDataSource ID="sdsDept" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [dept_no], [dept_name] FROM [dept_mst]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsEmployee" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    
                    SelectCommand="SELECT emp_no, emp_name + ' ( ' + CONVERT(varchar(30), emp_no) + ' ) ' AS emp_name FROM [emp_mst] WHERE ([department] = @department) AND (emp_Status = 'Joined')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlDept" DefaultValue="1" Name="department" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="text-align: left" class="style6">
                &nbsp;</td>
            <td style="text-align: left" class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td  colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </form>
</asp:Content>

