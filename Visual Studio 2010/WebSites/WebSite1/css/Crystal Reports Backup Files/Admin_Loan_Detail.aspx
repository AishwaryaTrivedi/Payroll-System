<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_Loan_Detail.aspx.cs" Inherits="Admin_Loan_Detail"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: right;
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
                &nbsp;Employee Loan Detail</td>
        </tr>
        <tr>
            <td class="style5" colspan="2" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" Text="MessageInfo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Department :</td>
            <td>
                <asp:DropDownList ID="drpDept" runat="server" AutoPostBack="True" 
                    DataSourceID="sdsDepartment" DataTextField="dept_name" DataValueField="dept_no" 
                    Width="129px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Employee :</td>
            <td>
                <asp:DropDownList ID="drpemp_id" runat="server" 
                    DataSourceID="sdsEmployee" DataTextField="emp_name" DataValueField="emp_no" 
                    Width="130px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Enter Loan Title :</td>
            <td>
                <asp:TextBox ID="txtloan_title" runat="server" MaxLength="30" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtloan_title" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Loan Description :</td>
            <td>
                <asp:TextBox ID="txtloan_desc" runat="server" Height="50px" 
                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtloan_desc" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Principle
                Amount: </td>
            <td>
                <asp:TextBox ID="txtloan_amt" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtloan_amt" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                EMI :</td>
            <td>
                <asp:TextBox ID="txtloan_emi" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtloan_emi" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Start Date :</td>
            <td>
                <asp:TextBox ID="txtloan_startdate" runat="server"></asp:TextBox>
                &nbsp;(mm/dd/yyyy)
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtloan_startdate" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Duration(In Months) :</td>
            <td>
                <asp:TextBox ID="txtloan_duration" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtloan_duration" Display="Dynamic" ErrorMessage="Required" 
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
            <td class="style1" colspan="2">
                <asp:SqlDataSource ID="sdsDepartment" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [dept_no], [dept_name] FROM [dept_mst]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsEmployee" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT [emp_no], [emp_name] FROM [emp_mst] WHERE ([department] = @department)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="drpDept" DefaultValue="1" Name="department" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

