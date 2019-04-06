<%@ Page Language="C#" MasterPageFile="~/User/MasterPage.master" AutoEventWireup="true" CodeFile="User_loan_request.aspx.cs" Inherits="User_loan_request"  %>

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
   
    <table style="width:100%;">
        <tr>
            <td class="style4" colspan="2" style="text-align: center">
                Employee Loan Request Form</td>
        </tr>
        <tr>
            <td class="style5" colspan="2" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" Text="MessageInfo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1"  width="30%">
                <b style="text-align: right">Enter Loan Detail Below :</b></td>
            <td width="70%">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Purpose of Loan :</td>
            <td>
                <asp:TextBox ID="txtloan_req_purpose" runat="server" Width="205px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtloan_req_purpose" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Description of Loan :</td>
            <td>
                <asp:TextBox ID="txtloan_req_desc" runat="server" TextMode="MultiLine" 
                    Width="208px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtloan_req_desc" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Principle
                Amount: </td>
            <td>
                <asp:TextBox ID="txtloan_req_amt" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtloan_req_amt" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" class="style6">
                <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                    Text="Submit" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: left" class="style6">
                <b style="text-align: right">Previous Loan Requests :</b></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" class="style6">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                    CellPadding="4" DataSourceID="sdsLoanReq" GridLines="Horizontal" 
                    Width="701px">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="LoanReqDate" HeaderText="Reqest Date" 
                            SortExpression="LoanReqDate" />
                        <asp:BoundField DataField="loan_req_purpose" HeaderText="Loan Purpose" 
                            SortExpression="loan_req_purpose" />
                        <asp:BoundField DataField="loan_req_desc" HeaderText="Description" 
                            SortExpression="loan_req_desc" />
                        <asp:BoundField DataField="loan_req_amt" HeaderText="Amount" 
                            SortExpression="loan_req_amt" />
                        <asp:BoundField DataField="loan_req_status" HeaderText="Status" 
                            SortExpression="loan_req_status" />
                    </Columns>
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" class="style6">
                <asp:SqlDataSource ID="sdsLoanReq" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT convert(varchar(50),[loan_req_date],103) AS LoanReqDate, [loan_req_purpose], [loan_req_desc], [loan_req_amt], [loan_req_status] FROM [loan_request] WHERE ([emp_id] = @emp_id)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="1" Name="emp_id" SessionField="emp_no" 
                            Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>
   
</asp:Content>

