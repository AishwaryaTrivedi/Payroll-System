<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_chg_pwd.aspx.cs" Inherits="Admin_admin_chg_pwd" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            text-align: left;
        }
    #a1
    {
        height: 276px;
    }
    .style3
    {
        height: 28px;
        width: 363px;
    }
    .style14
    {
        text-align: left;
        width: 204px;
    }
    .style16
    {
        height: 28px;
        width: 313px;
    }
    .style17
    {
        width: 313px;
    }
    .style18
    {
        height: 29px;
        width: 313px;
    }
    .style20
    {
        height: 28px;
        text-align: left;
        width: 171px;
    }
    .style21
    {
        width: 171px;
    }
    .style22
    {
        height: 29px;
        width: 171px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="a1" runat="server">
<div id="wrapper">
	
			    <div id="content" style="width:98%; height: 263px;">
				  
				            <center>
                                <table style="border:solid 1px gray; height: 250px; width: 94%;">
                                <tr>
                                    <td class="style2" style="text-align:center" rowspan="8">
                                        <img src="../o2.jpg" style="width: 150px; height: 174px; margin-top: 0px" alt="" /></td>
                                    <td class="style2" colspan="2" style="text-align:center">
                                        Admin Change Password</td>
                                </tr>
                                <tr>
                                    <td  colspan="2" class="style3">
                                        <asp:Label ID="lblMessage" runat="server" Text="lblMessage"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="style3">
                                    <td class="style20">
                                        Old Password :
                                        </td>
                                    <td style="text-align: left;" class="style16" >
                                        <asp:TextBox ID="txtadmin_opwd" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="txtadmin_opwd" Display="Dynamic" ErrorMessage="Required" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr class="style3">
                                    <td style="text-align: left" class="style21">
                                        New&nbsp; Password ::</td>
                                    <td style="text-align: left" class="style17">
                                        <asp:TextBox ID="txtadmin_npwd" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="txtadmin_npwd" Display="Dynamic" ErrorMessage="Required" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr class="style3">
                                    <td style="text-align: left" class="style22">
                                        Confirm Password :</td>
                                    <td style="text-align: left" class="style18">
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
                                    <td class="style21">
                                        &nbsp;</td>
                                    <td style="text-align: left" class="style17" >
                                        <asp:Button ID="btnSave" runat="server" onclick="Login_Click" 
                                            style="height: 26px" Text="Save" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style21">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style21">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            </center>
				
			</div>
			
			<div style="clear: both;">&nbsp;</div>
		
</div>
</form>
</asp:Content>

