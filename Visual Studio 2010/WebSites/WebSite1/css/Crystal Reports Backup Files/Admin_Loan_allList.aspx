<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_Loan_allList.aspx.cs" Inherits="Admin_Loan_allList"  %>

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
                </td>
            <td>
                <asp:DropDownList ID="drpDept" runat="server" AutoPostBack="True" 
                    DataSourceID="sdsDepartment" DataTextField="dept_name" DataValueField="dept_no" 
                    Width="129px" Visible="False">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                </td>
            <td>
                <asp:DropDownList ID="drpemp_id" runat="server" 
                    DataSourceID="sdsEmployee" DataTextField="emp_name" DataValueField="emp_no" 
                    Width="130px" Visible="False">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                    CellPadding="4" DataSourceID="sdsLoanList" GridLines="Horizontal" 
                    Width="701px">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="emp_name" HeaderText="Employee" 
                            SortExpression="emp_name" />
                        <asp:BoundField DataField="loan_title" HeaderText="Loan" 
                            SortExpression="loan_title" />
                        <asp:BoundField DataField="loan_desc" HeaderText="Description" 
                            SortExpression="loan_desc" />
                        <asp:BoundField DataField="loan_amt" HeaderText="Principle" 
                            SortExpression="loan_amt" />
                        <asp:BoundField DataField="loan_emi" HeaderText="EMI" 
                            SortExpression="loan_emi" />
                        <asp:BoundField DataField="loan_paidAmt" HeaderText="Paid" 
                            SortExpression="loan_paidAmt" />
                        <asp:BoundField DataField="loan_pendingAmt" HeaderText="Pending" 
                            SortExpression="loan_pendingAmt" />
                        <asp:BoundField DataField="Column1" HeaderText="Start Date" 
                            SortExpression="Column1" />
                        <asp:BoundField DataField="Column2" HeaderText="End Date" 
                            SortExpression="Column2" />
                    </Columns>
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" class="style6">
                <asp:Button ID="btnSubmit" runat="server" Text="Save" UseSubmitBehavior="False" Width="60px" Visible="False" />
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <asp:SqlDataSource ID="sdsDepartment" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [dept_no], [dept_name] FROM [dept_mst]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsLoanList" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    SelectCommand="SELECT emp_mst.emp_name, loan_mst.loan_title, loan_mst.loan_desc, loan_mst.loan_amt, loan_mst.loan_emi, isnull(loan_mst.loan_paidAmt,0) AS loan_paidAmt,isnull((loan_mst.loan_amt-loan_mst.loan_paidAmt),0) AS loan_pendingAmt, convert(varchar(50),loan_mst.loan_startdate,103), convert(varchar(50),loan_mst.loan_enddate,103) FROM loan_mst INNER JOIN emp_mst ON loan_mst.emp_id = emp_mst.emp_no">
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

