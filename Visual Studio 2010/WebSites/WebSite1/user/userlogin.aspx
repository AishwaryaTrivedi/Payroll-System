<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userlogin.aspx.cs" Inherits="User_userlogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Login Window</title>
      <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style2
        {
            font-weight: bold;
            font-size: medium;
        }
        .style3
        {
            height: 29px;
        }
        .style4
        {
            text-align: left;
            width: 493px;
        }
        .style5
        {
            width: 301px;
        }
        .style6
        {
            width: 493px;
        }
        .style7
        {
            font-weight: bold;
            font-size: medium;
            width: 606px;
        }
        .style8
        {
            width: 515px;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
<div id="header">
	<div id="logo">
		<h1>Payroll System</h1>
		
	</div>
	<div id="menu">
		&nbsp;
	</div>
</div>
<div id="wrapper">
	<div id="page">
		<div id="page-bg">
			    <div id="content" style="width:100%">
				    <div id="content-bgtop">
				        <div id="content-bgbtm">
				            <div class="post" style="text-align:center;width:100%">
				            <center>    <table style="border:solid 1px gray; height: 200px;" class="style8">
                                <tr>
                                    <td class="style2" colspan="2" style="text-align:center">
                                        User Login Window</td>
                                    <td class="style7" style="text-align:center" rowspan="7">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <img src="../o1.jpg" /></td>
                                </tr>
                                <tr>
                                    <td  colspan="2" class="style3">
                                        <asp:Label ID="lblMessage" runat="server" Text="lblMessage"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4" >
                                        User Name :&nbsp; </td>
                                    <td style="text-align: left;" class="style5" >
                                        <asp:TextBox ID="txtemp_username" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="txtemp_username" Display="Dynamic" ErrorMessage="Required" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left" class="style6">
                                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                                    &nbsp;:</td>
                                    <td style="text-align: left" class="style5">
                                        <asp:TextBox ID="txtemp_password" runat="server" TextMode="Password" 
                                            ontextchanged="txtemp_password_TextChanged"></asp:TextBox>
                                        <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Text="Label" 
                                            Visible="False"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="txtemp_password" Display="Dynamic" ErrorMessage="Required" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        &nbsp;</td>
                                    <td style="text-align: left" class="style5" >
                                        <asp:Button ID="Login" runat="server" onclick="Login_Click" 
                                            style="height: 26px" Text="Login" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" 
                                            runat="server" Font-Italic="True" NavigateUrl="~/ForgotPassWord.aspx">ForgotPassWord</asp:HyperLink>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        &nbsp;</td>
                                    <td class="style5">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        &nbsp;</td>
                                    <td class="style5">
                                        &nbsp;</td>
                                </tr>
                            </table></center>
				</div>
				</div>
			</div>
			</div>
			<!-- end content -->
			<!-- start sidebars -->
			<!-- end sidebars -->
			<div style="clear: both;">&nbsp;</div>
		</div>
	</div>
	<!-- end page -->
</div>
<div id="footer">
</div>
</form>
</body>
</html>
