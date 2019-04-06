<%@ Page Language="C#" MasterPageFile="~/MasterPagePlain.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">&nbsp;&nbsp;
  <form id="frm" runat="server">
    <table style="width: 102%" >
        <tr align="left">
            <td style="height: 40px">
                <h1 style="color: #FF6600">Welcome to Payroll System</h1></td>
        </tr>
        <tr align="right">
            <td>
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Attendance.aspx" 
                    BackColor="#999999" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
                    Font-Bold="True" Font-Size="14pt" Font-Underline="False" Height="28px" 
                    Width="208px" ForeColor="Black" onclick="LinkButton2_Click">Daily 
                Attendance</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server" 
                    PostBackUrl="~/User/userlogin.aspx" BackColor="Silver" BorderColor="Black" 
                    BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="14pt" 
                    Font-Underline="False" Height="28px" Width="127px" 
                    onclick="LinkButton1_Click" ForeColor="Black">User Login</asp:LinkButton>
            </td>
        </tr>
        <tr align="left">
            <td>
                Introduction of system
                Text here...</td>
        </tr>
    </table>
    </form>
</asp:Content>

