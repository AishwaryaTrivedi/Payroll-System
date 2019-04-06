<%@ Page Language="C#" MasterPageFile="~/MasterPagePlain.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Attendance" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <table style="width:300px;">
        <tr>
            <td style="text-align: left" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="2">
                <asp:Label ID="lblMessage" runat="server" style="color: #FF3300" Text="Message"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:RadioButton ID="rbPunchIn" runat="server" GroupName="punch" 
                        Text="Punch In" />
            </td>
            <td>
                <asp:RadioButton ID="rbPunchOut" runat="server" GroupName="punch" 
                        Text="Punch Out" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                    User Name :</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="Required" 
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                    Password :</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Required" 
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="2">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" />
            </td>
        </tr>
    </table>
    </center>
</asp:Content>

