<%@ Page Language="C#" MasterPageFile="~/User/MasterPage.master" AutoEventWireup="true" CodeFile="User_Loan_View.aspx.cs" Inherits="User_Loan_View"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
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
   
    <table style="width:100%;">
        <tr>
            <td class="style4" style="text-align: center">
                Employee Loan Detail</td>
        </tr>
        <tr>
            <td class="style5" style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                    CellPadding="4" DataSourceID="sdsLoan" GridLines="Horizontal" 
                    Width="701px">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="loan_title" HeaderText="Title" 
                            SortExpression="loan_title" />
                        <asp:BoundField DataField="loan_desc" HeaderText="Description" 
                            SortExpression="loan_desc" />
                        <asp:BoundField DataField="loan_amt" HeaderText="Principle" 
                            SortExpression="loan_amt" />
                        <asp:BoundField DataField="loan_emi" HeaderText="EMI" 
                            SortExpression="loan_emi" />
                        <asp:BoundField DataField="loan_paidAmt" HeaderText="Paid" ReadOnly="True" 
                            SortExpression="loan_paidAmt" />
                        <asp:BoundField DataField="strPendingAmt" HeaderText="Pending" ReadOnly="True" 
                            SortExpression="strPendingAmt" />
                        <asp:BoundField DataField="dtStartDate" HeaderText="Start Date" ReadOnly="True" 
                            SortExpression="dtStartDate" />
                        <asp:BoundField DataField="loan_duration" HeaderText="loan_duration" 
                            SortExpression="loan_duration" Visible="False" />
                        <asp:BoundField DataField="strEndDate" HeaderText="End Date" ReadOnly="True" 
                            SortExpression="strEndDate" />
                    </Columns>
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:SqlDataSource ID="sdsLoan" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    
                    
                    SelectCommand="SELECT [loan_title], [loan_desc], [loan_amt], [loan_emi], [loan_paidAmt],([loan_amt]-[loan_paidAmt]) AS strPendingAmt,convert(varchar(50),[loan_startdate],103) AS dtStartDate, [loan_duration],convert(varchar(50), [loan_enddate],103) AS strEndDate FROM [loan_mst] WHERE ([emp_id] = @emp_id)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="1" Name="emp_id" SessionField="emp_no" 
                            Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
        <tr>
            <td style="text-align: center" class="style6">
                &nbsp;</td>
        </tr>
        </table>
   
</asp:Content>

