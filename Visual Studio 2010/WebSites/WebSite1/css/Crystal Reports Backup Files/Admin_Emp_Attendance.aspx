<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_Emp_Attendance.aspx.cs" Inherits="Admin_Emp_Attendance"  %>

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
        .style7
        {
            text-align: center;
            height: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style4" colspan="2" style="text-align: center">
                &nbsp;Employee Attendance Detail</td>
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
                    Width="130px" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Year :</td>
            <td>
                <asp:DropDownList ID="ddlYear" runat="server" Width="110px" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Month :</td>
            <td>
                <asp:DropDownList ID="ddlMonth" runat="server" Width="110px" 
                    AutoPostBack="True">
                    <asp:ListItem Value="1">January</asp:ListItem>
                    <asp:ListItem Value="2">February</asp:ListItem>
                    <asp:ListItem Value="3">March</asp:ListItem>
                    <asp:ListItem Value="4">April</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">June</asp:ListItem>
                    <asp:ListItem Value="7">July</asp:ListItem>
                    <asp:ListItem Value="8">August</asp:ListItem>
                    <asp:ListItem Value="9">September</asp:ListItem>
                    <asp:ListItem Value="10">October</asp:ListItem>
                    <asp:ListItem Value="11">November</asp:ListItem>
                    <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style7" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                    CellPadding="4" DataSourceID="sdsAttendance" GridLines="Horizontal">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="AttDate" HeaderText="Present Date" 
                            SortExpression="AttDate" />
                        <asp:BoundField DataField="AttStatus" HeaderText="Status" 
                            SortExpression="AttStatus" />
                        <asp:BoundField DataField="LeaveDesc" HeaderText="Leave Desc" 
                            SortExpression="LeaveDesc" />
                    </Columns>
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <asp:SqlDataSource ID="sdsAttendance" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT convert(varchar(50),AttendanceMaster.AttendDate,103) AS AttDate, AttendanceMaster.AttStatus, AttendanceMaster.LeaveDesc FROM AttendanceMaster INNER JOIN emp_mst ON AttendanceMaster.EmpID = emp_mst.emp_no WHERE (([EmpID] = @EmpID) AND (MONTH([AttendDate]) = @Month) AND (YEAR([AttendDate]) = @Year))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="drpemp_id" DefaultValue="1" Name="EmpID" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlMonth" DefaultValue="5" Name="Month" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlYear" DefaultValue="2011" Name="Year" 
                            PropertyName="SelectedValue" />
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

