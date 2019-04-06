<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_chg_pwd.aspx.cs" Inherits="Admin_admin_chg_pwd" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="a1" runat="server">
<div id="wrapper">
	
			    <div id="content" style="width:100%">
				  
				            <center>
                                <table style="border:solid 1px gray" width="70%">
                                <tr>
                                    <td class="style2" colspan="2" style="text-align:center">
                                        Admin Change Password</td>
                                </tr>
                                <tr>
                                    <td  colspan="2" class="style3">
                                        <asp:Label ID="lblMessage" runat="server" Text="lblMessage"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="style3">
                                    <td style="text-align: right">
                                        Old Password :
                                        </td>
                                    <td style="text-align: left;" >
                                        <asp:TextBox ID="txtadmin_opwd" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="txtadmin_opwd" Display="Dynamic" ErrorMessage="Required" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr class="style3">
                                    <td style="text-align: right">
                                        New&nbsp; Password ::</td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="txtadmin_npwd" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="txtadmin_npwd" Display="Dynamic" ErrorMessage="Required" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr class="style3">
                                    <td style="text-align: right">
                                        Confirm Password :</td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="txtadmin_cpwd" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="txtadmin_cpwd" Display="Dynamic" ErrorMessage="Required" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                            ControlToCompare="txtadmin_npwd" ControlToValidate="txtadmin_cpwd" 
                                            ErrorMessage="Password Not Match."></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td style="text-align: left" >
                                        <asp:Button ID="btnSave" runat="server" onclick="Login_Click" 
                                            style="height: 26px" Text="Save" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            </center>
				
			</div>
			
			<div style="clear: both;">&nbsp;</div>
		
</div>
</form>
</asp:Content>

