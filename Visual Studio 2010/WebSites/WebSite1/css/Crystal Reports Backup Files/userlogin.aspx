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
    </style>
</head>
<body>
     <form id="form1" runat="server">
<div id="header">
	<div id="logo">
		<h1>MIcrotech IT System</h1>
		<p>Intranet Payroll System</p>
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
				            <center>    <table style="width:300px;border:solid 1px gray">
                                <tr>
                                    <td class="style2" colspan="2" style="text-align:center">
                                        User Login Window</td>
                                </tr>
                                <tr>
                                    <td  colspan="2" class="style3">
                                        <asp:Label ID="lblMessage" runat="server" Text="lblMessage"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;width:100px" >
                                        User Name :</td>
                                    <td style="text-align: left;width:200px" >
                                        <asp:TextBox ID="txtemp_username" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="txtemp_username" Display="Dynamic" ErrorMessage="Required" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                                    &nbsp;:</td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="txtemp_password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="txtemp_password" Display="Dynamic" ErrorMessage="Required" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td style="text-align: left" >
                                        <asp:Button ID="Login" runat="server" onclick="Login_Click" 
                                            style="height: 26px" Text="Login" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
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
