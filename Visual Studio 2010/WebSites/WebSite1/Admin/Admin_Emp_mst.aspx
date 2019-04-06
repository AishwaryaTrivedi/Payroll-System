<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_Emp_mst.aspx.cs" Inherits="Admin_Emp_mst"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
        .style3
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
            text-align: left;
            width: 140px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style4" colspan="2" style="text-align: center">
               <marquee><img src="../e.jpg" style="height: 136px; width: 360px; float: left;" /><img 
                    src="p4.jpeg" 
                    style="height: 136px; width: 326px; float: right; margin-left: 0px;" /></marquee></td>
        </tr>
        <tr>
            <td class="style4" colspan="2" style="text-align: center">
                &nbsp;Employee Registration</td>
        </tr>
        <tr>
            <td class="style5" colspan="2" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" Text="MessageInfo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <b>Add New Employee :<asp:TextBox ID="txtemp_no" runat="server" 
                    Visible="False"></asp:TextBox>
                </b></td>
        </tr>
        <tr>
            <td class="style7">
                Enter Employee
                Name :</td>
            <td>
                <asp:TextBox ID="txtemp_name" runat="server" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtemp_name" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Address Line 1 :</td>
            <td>
                <asp:TextBox ID="txtaddress1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtaddress1" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Address Line 2: </td>
            <td>
                <asp:TextBox ID="txtaddress2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtaddress2" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                City :</td>
            <td>
                <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtcity" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Pin Code :</td>
            <td>
                <asp:TextBox ID="txtpincode" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtpincode" Display="Dynamic" 
                    ErrorMessage="Enter Proper Pin" ValidationExpression="\d{6}" 
                    ForeColor="Red"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtpincode" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Birth Date :</td>
            <td>
                <asp:TextBox ID="txtbdate" runat="server"></asp:TextBox>
                &nbsp;(mm/dd/yyyy) 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtbdate" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;Date of Joining :</td>
            <td>
                <asp:TextBox ID="txtLdate" runat="server"></asp:TextBox>
                &nbsp;(mm/dd/yyyy)
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtbdate" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Department :</td>
            <td>
                <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True" 
                    DataSourceID="sdsDepartment" DataTextField="dept_name" DataValueField="dept_no" 
                    Width="132px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Designation :</td>
            <td>
                <asp:DropDownList ID="ddlDesignation" runat="server" 
                    DataSourceID="sdsDesignation" DataTextField="des_name" DataValueField="des_no" 
                    Width="130px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Type :</td>
            <td>
                <asp:TextBox ID="txttype" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtage" runat="server" Visible="False">20</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Bank Detail :</td>
            <td>
                <asp:TextBox ID="txtBankDetail" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="txtBankDetail" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                User Name :</td>
            <td>
                <asp:TextBox ID="txtemp_username" runat="server" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtemp_username" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Password :</td>
            <td>
                <asp:TextBox ID="txtemp_password" runat="server" MaxLength="30" 
                    TextMode="Password" AutoPostBack="True" 
                    ontextchanged="txtemp_password_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtemp_password" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Text="Label" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Sec. Question</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="question" 
                    DataValueField="question">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [question] FROM [question]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Sec. Answer</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" class="style6">
                <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                    Text="Save" UseSubmitBehavior="False" Width="60px" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: left" class="style6">
                <b>Employee List :</b></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" class="style6">
                <asp:GridView ID="gdvDept" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" 
                    BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDSdept" 
                    GridLines="Horizontal" onrowdeleted="gdvDept_RowDeleted" 
                    onrowdeleting="gdvDept_RowDeleting" 
                    Width="500px" onselectedindexchanged="gdvDept_SelectedIndexChanged">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="emp_no" 
                            DataNavigateUrlFormatString="Admin_EditEmp_mst.aspx?emp_no={0}" 
                            DataTextField="emp_no" HeaderText="ID" />
                        <asp:BoundField DataField="emp_name" HeaderText="Employee" 
                            SortExpression="emp_name" />
                        <asp:BoundField DataField="dept_name" HeaderText="Department" 
                            SortExpression="dept_name" />
                        <asp:BoundField DataField="des_name" HeaderText="Designation" 
                            SortExpression="des_name" />
                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                    </Columns>
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsDesignation" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [des_no], [des_name] FROM [des_mst] WHERE ([dept_no] = @dept_no)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_no" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsDepartment" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    SelectCommand="SELECT [dept_no], [dept_name] FROM [dept_mst]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <asp:SqlDataSource ID="SqlDSdept" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
                    
                    
                    
                    SelectCommand="SELECT emp_mst.emp_no, emp_mst.emp_name, dept_mst.dept_name, des_mst.des_name FROM emp_mst INNER JOIN des_mst ON emp_mst.desgnation = des_mst.des_no INNER JOIN dept_mst ON emp_mst.department = dept_mst.dept_no">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

