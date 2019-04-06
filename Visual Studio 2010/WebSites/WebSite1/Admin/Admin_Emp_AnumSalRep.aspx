<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_Emp_AnumSalRep.aspx.cs" Inherits="Admin_Emp_AnumSalRep"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
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
        .style7
        {
            text-align: center;
            height: 16px;
        }
        .style8
        {
            text-align: left;
            width: 156px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style4" colspan="2" style="text-align: center">
                <marquee><img src="../e.jpg" style="height: 136px; width: 360px; float: left;" /><img 
                    src="p4.jpeg" style="height: 136px; width: 356px; float: right" /></marquee></td>
        </tr>
        <tr>
            <td class="style4" colspan="2" style="text-align: center">
                &nbsp;Employee Annual Salary Detail</td>
        </tr>
        <tr>
            <td class="style5" colspan="2" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" Text="MessageInfo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Department :</td>
            <td>
                <asp:DropDownList ID="drpDept" runat="server" AutoPostBack="True" 
                    DataSourceID="sdsDepartment" DataTextField="dept_name" DataValueField="dept_no" 
                    Width="129px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Employee :</td>
            <td>
                <asp:DropDownList ID="drpemp_id" runat="server" 
                    DataSourceID="sdsEmployee" DataTextField="emp_name" DataValueField="emp_no" 
                    Width="130px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Time Period - From Date :</td>
            <td>
                <asp:TextBox ID="txtStDate" runat="server"></asp:TextBox>
&nbsp;(mm/dd/yyyy)
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtStDate" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                To Date :</td>
            <td>
                <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
&nbsp;(mm/dd/yyyy)
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtEndDate" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btnView" runat="server" onclick="btnView_Click" Text="View" />
            </td>
        </tr>
        <tr>
            <td class="style7" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                    CellPadding="4" DataSourceID="sdsAnumSalRep" GridLines="Horizontal" 
                    Width="347px">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="SalYear" HeaderText="Year" 
                            SortExpression="SalYear" />
                        <asp:BoundField DataField="SalMonth" HeaderText="Month" 
                            SortExpression="SalMonth" />
                        <asp:BoundField DataField="SalNetSal" HeaderText="Net Salary" 
                            SortExpression="SalNetSal" />
                        <asp:HyperLinkField DataNavigateUrlFields="SalID" 
                            DataNavigateUrlFormatString="../Admin/Admin_Sal_Slip.aspx?SalaryID = {0}" 
                            HeaderText="View" Text="View" />
                    </Columns>
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <asp:SqlDataSource ID="sdsAnumSalRep" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    
                    SelectCommand="SELECT [SalID], [SalMonth], [SalYear], [SalNetSal] FROM [EmpSalMaster] WHERE ([SalEmpID] = @SalEmpID) AND ([SalDate] BETWEEN @FinYrStDt AND @FinYrEndDt)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="drpemp_id" DefaultValue="1" Name="SalEmpID" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtStDate" DefaultValue="04/01/2010" Name="FinYrStDt" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtEndDate" DefaultValue="03/31/2011" Name="FinYrEndDt" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsDepartment" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [dept_no], [dept_name] FROM [dept_mst]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsEmployee" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT emp_no, emp_name + ' ( ' + CONVERT(varchar(30), emp_no) + ' ) ' AS emp_name FROM [emp_mst] WHERE ([department] = @department)">
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

