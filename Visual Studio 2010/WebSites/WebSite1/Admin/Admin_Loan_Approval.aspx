<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_Loan_Approval.aspx.cs" Inherits="Admin_Loan_Approval"  %>

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
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style4" style="text-align: center">
       <marquee><img src="../e.jpg" style="height: 136px; width: 360px; float: left;" /><img 
                    src="p4.jpeg" 
                    style="height: 136px; width: 326px; float: right; margin-left: 0px;" /></marquee></td>
        </tr>
        <tr>
            <td class="style4" style="text-align: center">
                &nbsp;Employee Loan Approval</td>
        </tr>
        <tr>
            <td class="style5" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" Text="MessageInfo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="sdsLoanList" 
                    style="text-align: left" Width="80%" CellPadding="4" ForeColor="#333333" 
                    onitemcommand="DataList1_ItemCommand">
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <AlternatingItemStyle BackColor="White" />
                    <ItemStyle BackColor="#E3EAEB" />
                    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        Employee:
                        <asp:Label ID="emp_nameLabel" runat="server" Text='<%# Eval("emp_name") %>' />
                        &nbsp;<asp:Label ID="lblemp_id" runat="server" 
                            Text='<%# Eval("loan_req_id") %>' Visible="False"></asp:Label>
                        <br />
                        Request Date:
                        <asp:Label ID="loan_req_dateLabel" runat="server" 
                            Text='<%# Eval("LoanReqDate") %>' />
                        <br />
                        Purpose:
                        <asp:Label ID="loan_req_purposeLabel" runat="server" 
                            Text='<%# Eval("loan_req_purpose") %>' />
                        <br />
                        Description:
                        <asp:Label ID="loan_req_descLabel" runat="server" 
                            Text='<%# Eval("loan_req_desc") %>' />
                        <br />
                        Amount:
                        <asp:Label ID="loan_req_amtLabel" runat="server" 
                            Text='<%# Eval("loan_req_amt") %>' />
                        <br />
                        <asp:Button ID="btnAccept" runat="server" Text="Accept" 
                            onclick="btnAccept_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnReject" runat="server" Text="Reject" 
                            onclick="btnReject_Click" />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:SqlDataSource ID="sdsLoanList" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    
                    
                    SelectCommand="SELECT loan_request.loan_req_id,emp_mst.emp_name, convert(varchar(50),loan_request.loan_req_date,103) AS LoanReqDate, loan_request.loan_req_purpose, loan_request.loan_req_desc, loan_request.loan_req_amt FROM emp_mst INNER JOIN loan_request ON emp_mst.emp_no = loan_request.emp_id WHERE loan_request.loan_req_status='Pending'" >
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

