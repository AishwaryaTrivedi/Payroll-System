<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Sal_Slip.aspx.cs" Inherits="Admin_Admin_Sal_Slip" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Salary Slip</title>
    <style type="text/css">
        .style1
        {
            width: 700px;
            float: left;
            border: 1px solid #000000;
        }
        .style2
        {
            height: 20px;
            text-align: right;
        }
        .style3
        {
            width: 200px;
            height: 20px;
        }
        .style4
        {
            width: 150px;
            height: 20px;
            text-align: right;
            }
        .style5
        {
            width: 150px;
            height: 20px;
            text-align: right;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">

    <table align="left" cellspacing="1" class="style1">
        <tr>
            <td colspan="4" style="text-align: center">
                <b>MIcrotech IT System</b></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                Salary For                 <asp:Label ID="lblSalMonYear" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:150px; text-align: right;">
                Employee Name :</td>
            <td style="width:200px">
                <asp:Label ID="lblEmpName" runat="server" Text="lblEmpName"></asp:Label>
            &nbsp;(ID :
                <asp:Label ID="lblEmpID" runat="server" Text="lblEmpID"></asp:Label>
                )</td>
            <td style="width:150px; text-align: right;">
                Salary Date :</td>
            <td style="width:200px">
                <asp:Label ID="lblEmpSalDate" runat="server" Text="lblEmpSalDate"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:150px; text-align: right;">
                Department :</td>
            <td style="width:200px">
                <asp:Label ID="lblEmpDept" runat="server" Text="lblEmpDept"></asp:Label>
            </td>
            <td style="width:150px; text-align: right;">
                Designation :</td>
            <td style="width:200px">
                <asp:Label ID="lblEmpDesignation" runat="server" Text="lblEmpDesignation"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:150px; text-align: right;">
                &nbsp;</td>
            <td style="width:200px">
                <asp:Label ID="lblEmpBdate" runat="server" Text="lblEmpBdate" Visible="False"></asp:Label>
            </td>
            <td style="width:150px; text-align: right;">
                &nbsp;</td>
            <td style="width:200px">
                <asp:Label ID="lblEmpType" runat="server" Text="lblEmpType" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;" colspan="4">
                <hr /></td>
        </tr>
        <tr>
            <td style="width:150px; text-align: right;">
                &nbsp;</td>
            <td style="width:200px">
                &nbsp;</td>
            <td style="width:150px; text-align: right;">
                &nbsp;</td>
            <td style="width:200px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width:150px; text-align: right;">
                Basic Salary :</td>
            <td style="width:200px">
                <asp:Label ID="lblBasSalary" runat="server" Text="Label"></asp:Label>
            </td>
            <td style="width:150px; text-align: right;">
                &nbsp;</td>
            <td style="width:200px">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <b>Earnings :</td>
            <td class="style3">
                </td>
            <td class="style5">
                Deductions :</td>
            <td class="style3">
                </td>
        </tr>
        <tr>
            <td style="text-align: right; vertical-align: top;">
                Allowances :</td>
            <td>
                <asp:Table ID="tblAllowances" runat="server" CellPadding="0" CellSpacing="0">
                </asp:Table>
            </td>
            <td style="text-align: right; vertical-align: top;">
                Deductions :</td>
            <td class="style3">
                <asp:Table ID="tblDeduction" runat="server" CellPadding="0" CellSpacing="0">
                </asp:Table>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" style="text-align: right; vertical-align: top;">
                Perks :</td>
            <td class="style3">
                <asp:Table ID="tblPerk" runat="server" CellPadding="0" CellSpacing="0">
                </asp:Table>
            </td>
            <td class="style4" style="text-align: right; vertical-align: top;">
                Tax :</td>
            <td class="style3">
                <asp:Table ID="tblTax" runat="server" CellPadding="0" CellSpacing="0">
                </asp:Table>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                Loan :</td>
            <td class="style3">
                <asp:Label ID="lblTotLoan" runat="server" Text="lblTotLoan"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                Leaves :</td>
            <td class="style3">
                <asp:Label ID="lblTotOvrLeave" runat="server" Text="lblTotOvrLeave"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                Absent
                Leaves :</td>
            <td class="style3">
                <asp:Label ID="lblTotLeave" runat="server" Text="lblTotLeave"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Total Earnings :</td>
            <td class="style3">
                <asp:Label ID="lblTotEarning" runat="server" Text="lblTotEarning"></asp:Label>
            </td>
            <td class="style4">
                Total Deductions :</td>
            <td class="style3">
                <asp:Label ID="lblTotDed" runat="server" Text="lblTotDed"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                <hr /></td>
        </tr>
        <tr>
            <td class="style2">
                Net Salary :</td>
            <td class="style3">
                <asp:Label ID="lblEmpNetSal" runat="server" Text="lblEmpNetSal"></asp:Label>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
        </tr>
    </table>

    </form>

</body>
</html>
