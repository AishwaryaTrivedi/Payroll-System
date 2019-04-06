<%@ Page Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="User_leave_request.aspx.cs" Inherits="User_leave_request"  %>

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
        .style6
        {
            height: 12px;
        }
        .style7
        {
            height: 12px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <form id="aa" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style4" colspan="2" style="text-align: center">
                <marquee><img src="zapper_index2.jpg" style="height: 168px; width: 364px; float: left;" /><img src="emp.jpg" style="float: right; height: 167px; width: 350px" /></marquee></td>
        </tr>
        <tr>
            <td class="style4" colspan="2" style="text-align: center">
                Employee Leave Request Form</td>
        </tr>
        <tr>
            <td class="style5" colspan="2" style="text-align: center">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:Label ID="lblMessage" runat="server" Text="MessageInfo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1"  width="30%">
                <b style="text-align: right">Enter Leave Detail Below :</b></td>
            <td width="70%">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Date of Leave :</td>
            <td>
                <asp:TextBox ID="txtleave_date" runat="server" Width="100px"></asp:TextBox>
                &nbsp;(dd/mm/yyyy)
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtleave_date" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                How many days ?</td>
            <td>
                <asp:TextBox ID="txtleave_days" runat="server" Width="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtleave_days" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Reason of Leave :</td>
            <td>
                <asp:TextBox ID="txtleave_reason" runat="server" 
                    Width="208px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtleave_reason" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Leave Type : </td>
            <td>
                <asp:TextBox ID="txtleave_type" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtleave_type" Display="Dynamic" ErrorMessage="Required" 
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
            <td colspan="2" class="style7">
                <b style="text-align: left">Previous Leave Requests :</b></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" class="style6">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                    CellPadding="4" DataSourceID="sdsLeaveReq" GridLines="Horizontal" 
                    Width="701px">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="LeaveReqDate" HeaderText="Request Date" 
                            ReadOnly="True" SortExpression="LeaveReqDate" />
                        <asp:BoundField DataField="LeaveDate" HeaderText="Leave Date" ReadOnly="True" 
                            SortExpression="LeaveDate" />
                        <asp:BoundField DataField="leave_days" HeaderText="No of Days" 
                            SortExpression="leave_days" />
                        <asp:BoundField DataField="leave_reason" HeaderText="Reason" 
                            SortExpression="leave_reason" />
                        <asp:BoundField DataField="leave_req_status" HeaderText="Status" 
                            SortExpression="leave_req_status" />
                    </Columns>
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" class="style6">
                <asp:SqlDataSource ID="sdsLeaveReq" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT convert(varchar(50),[leave_req_date],103) AS LeaveReqDate, convert(varchar(50),[leave_date],103) AS LeaveDate, [leave_days], [leave_reason], [leave_req_status] FROM [leave_request] WHERE ([emp_id] = @emp_id)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="1" Name="emp_id" SessionField="emp_no" 
                            Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>
   </form>
</asp:Content>

