<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_Leave_Approval.aspx.cs" Inherits="Admin_Leave_Approval"  %>

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
                &nbsp;Employee Leave Approval</td>
        </tr>
        <tr>
            <td class="style5" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" Text="MessageInfo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="sdsLeaveList" Width="80%" 
                    CellPadding="4" ForeColor="#333333" onitemcommand="DataList1_ItemCommand">
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <AlternatingItemStyle BackColor="White" />
                    <ItemStyle BackColor="#E3EAEB" />
                    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        Employee:
                        <asp:Label ID="emp_nameLabel" runat="server" Text='<%# Eval("emp_name") %>' />
                        &nbsp;
                        <asp:Label ID="lblemp_id" runat="server" Text='<%# Eval("leave_req_id") %>' 
                            Visible="False"></asp:Label>
                        <br />
                        Request Date:
                        <asp:Label ID="LeaveReqDateLabel" runat="server" 
                            Text='<%# Eval("LeaveReqDate") %>' />
                        <br />
                        Leave Date:
                        <asp:Label ID="LeaveDateLabel" runat="server" Text='<%# Eval("LeaveDate") %>' />
                        <br />
                        No. of Days:
                        <asp:Label ID="leave_daysLabel" runat="server" 
                            Text='<%# Eval("leave_days") %>' />
                        <br />
                        Leave Reason:
                        <asp:Label ID="leave_reasonLabel" runat="server" 
                            Text='<%# Eval("leave_reason") %>' />
                        <br />
                        Leave Type:
                        <asp:Label ID="leave_typeLabel" runat="server" 
                            Text='<%# Eval("leave_type") %>' />
                        <br />
                        <asp:Button ID="btnAccept" runat="server" onclick="btnAccept_Click" 
                            Text="Accept" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnReject" runat="server" onclick="btnReject_Click" 
                            Text="Reject" />
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:SqlDataSource ID="sdsLeaveList" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    
                    
                    SelectCommand="SELECT leave_request.leave_req_id,emp_mst.emp_name, convert(varchar(50),leave_request.leave_req_date,103) AS LeaveReqDate, convert(varchar(50),leave_request.leave_date,103) AS LeaveDate, leave_request.leave_days, leave_request.leave_reason, leave_request.leave_type FROM emp_mst INNER JOIN leave_request ON emp_mst.emp_no = leave_request.emp_id WHERE leave_req_status = 'Pending'">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

