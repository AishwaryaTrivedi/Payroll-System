<%@ Page Language="C#" MasterPageFile="~/MasterPagePlain.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Attendance" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="asdf" runat="server">
    <center style="width: 527px">
    <table style="width:684px; height: 143px;">
        <tr>
            <td style="text-align: center" colspan="2">
                <asp:Label ID="lblMessage" runat="server" style="color: #FF3300" Text="Message"></asp:Label>
            </td>
            <td style="text-align: center; width: 193px;" rowspan="4">
                <img src="e3.jpeg" style="height: 161px; width: 177px" /></td>
        </tr>
        <tr>
            <td style="text-align: right; width: 70px;">
                <asp:RadioButton ID="rbPunchIn" runat="server" GroupName="punch" 
                        Text="PunchIn" />
            </td>
            <td style="width: 191px">
                <asp:RadioButton ID="rbPunchOut" runat="server" GroupName="punch" 
                        Text="Punch Out" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 70px;">
                    User Name :</td>
            <td style="text-align: left; width: 191px;">
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="Required" 
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 70px;">
                    Password :</td>
            <td style="text-align: left; width: 191px;">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Required" 
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 70px">
                &nbsp;</td>
            <td style="text-align: center" colspan="2">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Logout.aspx">Logout</asp:HyperLink>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 70px">
                &nbsp;</td>
            <td style="text-align: center" colspan="2">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" style="text-align: left" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </center>
    </form>
</asp:Content>

