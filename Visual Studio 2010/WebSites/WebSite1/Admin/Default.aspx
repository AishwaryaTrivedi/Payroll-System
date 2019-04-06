<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

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
            font-weight: bold;
            font-size: medium;
            width: 216px;
        }
        .style5
        {
            width: 216px;
        }
        .style6
        {
            width: 71px;
        }
        .style7
        {
            width: 181px;
        }
    </style>
</head>
<body>
     <p>
         <br />
     </p>
     <form id="form1" runat="server">
<div id="header">
	<div id="logo">
		<h1>Payroll System</h1>
		>
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
				            <div class="post" style="text-align:center">
				            <center>
                                <table style="width:698px; border:solid 1px gray">
                                <tr>
                                    <td class="style2" colspan="2" style="text-align:center">
                                        Admin Login Window</td>
                                    <td class="style4" style="text-align:center" rowspan="5">
                                        &nbsp;<img src="l3.jpeg" style="margin-left: 0px" /></td>
                                </tr>
                                <tr>
                                    <td  colspan="2" class="style3">
                                        <asp:Label ID="lblMessage" runat="server" Text="lblMessage"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; " class="style6" >
                                        User Name :</td>
                                    <td style="text-align: left;" class="style7" >
                                        <asp:TextBox ID="txtadmin_username" runat="server">admin</asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="txtadmin_username" Display="Dynamic" ErrorMessage="Required" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left" class="style6">
                                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                                    &nbsp;:</td>
                                    <td style="text-align: left" class="style7">
                                        <asp:TextBox ID="txtadmin_password" runat="server" TextMode="Password" 
                                            ontextchanged="txtadmin_password_TextChanged">admin</asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="txtadmin_password" Display="Dynamic" ErrorMessage="Required" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:Label ID="lblmsg" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        &nbsp;</td>
                                    <td style="text-align: left" class="style7" >
                                        <asp:Button ID="Login" runat="server" onclick="Login_Click" 
                                            style="height: 26px" Text="Login" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        &nbsp;</td>
                                    <td class="style7">
                                        &nbsp;</td>
                                    <td class="style5">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            </center>
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
