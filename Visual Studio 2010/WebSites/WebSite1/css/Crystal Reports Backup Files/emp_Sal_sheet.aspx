<%@ Page Language="C#" MasterPageFile="~/User/MasterPage.master" AutoEventWireup="true" CodeFile="emp_Sal_sheet.aspx.cs" Inherits="emp_Sal_sheet" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<table style="width:100%;">
    <tr>
        <td>
            <h2><b>Salary History :</b></h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                CellPadding="4" DataSourceID="sdsSalarySheet" GridLines="Horizontal" 
                Width="514px">
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="SalYear" HeaderText="Year" 
                        SortExpression="SalYear" />
                    <asp:BoundField DataField="SalMonth" HeaderText="Month" 
                        SortExpression="SalMonth" />
                    <asp:BoundField DataField="Column1" HeaderText="Salary Date" 
                        SortExpression="Column1" />
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
        <td>
            <asp:SqlDataSource ID="sdsSalarySheet" runat="server" 
                ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                SelectCommand="SELECT [SalID], [SalYear], [SalMonth],CONVERT(VARCHAR(50), [SalDate],103), [SalNetSal] FROM [EmpSalMaster] WHERE ([SalEmpID] = @SalEmpID) ORDER BY [SalDate] DESC">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="SalEmpID" SessionField="emp_no" 
                        Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <b>Leave Encashment History :</b></td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                CellPadding="4" DataSourceID="sdsLeaveEncash" GridLines="Horizontal" 
                Width="514px">
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="EncasFinYear" HeaderText="Financial Year" 
                        SortExpression="EncasFinYear" />
                    <asp:BoundField DataField="TotLeaveTaken" HeaderText="Total Leave Taken" 
                        SortExpression="TotLeaveTaken" />
                    <asp:BoundField DataField="EncasLeave" HeaderText="Leaves Encashed" 
                        SortExpression="EncasLeave" />
                    <asp:BoundField DataField="EncasAmt" HeaderText="Encased Amount" 
                        SortExpression="EncasAmt" />
                </Columns>
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:SqlDataSource ID="sdsLeaveEncash" runat="server" 
                ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                
                SelectCommand="SELECT [EncasFinYear], [TotLeaveTaken], [EncasLeave], [EncasAmt] FROM [emp_leave_encash] WHERE ([EncasEmpID] = @EncasEmpID)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="EncasEmpID" SessionField="emp_no" 
                        Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>

</asp:Content>

