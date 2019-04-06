<%@ Page Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="User_Profile_View.aspx.cs" Inherits="User_Profile_View"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <table style="width:100%;">
        <tr>
            <td class="style4" colspan="2" style="text-align: center">
                <marquee><img src="zapper_index2.jpg" style="height: 168px; width: 364px; float: left;" /><img src="emp.jpg" style="float: right; height: 167px; width: 350px" /></marquee></td>
        </tr>
        <tr>
            <td class="style4" colspan="2" style="text-align: center">
                Employee Profile</td>
        </tr>
        <tr>
            <td class="style5" colspan="2" style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1"  width="30%">
                <b style="text-align: right">Employee ID :</b></td>
            <td width="70%">
                <asp:Label ID="txtemp_no" runat="server" Text="txtemp_no"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Enter Employee
                Name :</td>
            <td>
                <asp:Label ID="txtemp_name" runat="server" Text="txtemp_name"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Address Line 1 :</td>
            <td>
                <asp:Label ID="txtaddress1" runat="server" Text="txtaddress1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Address Line 2: </td>
            <td>
                <asp:Label ID="txtaddress2" runat="server" Text="txtaddress2"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                City :</td>
            <td>
                <asp:Label ID="txtcity" runat="server" Text="txtcity"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Pin Code :</td>
            <td>
                <asp:Label ID="txtpincode" runat="server" Text="txtpincode"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Birth Date :</td>
            <td>
                <asp:Label ID="txtbdate" runat="server" Text="txtbdate"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Department :</td>
            <td>
                <asp:Label ID="txtemp_dept" runat="server" Text="txtemp_dept"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Designation :</td>
            <td>
                <asp:Label ID="txtemp_des" runat="server" Text="txtemp_des"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Type :</td>
            <td>
                <asp:Label ID="txttype" runat="server" Text="txttype"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" class="style6">
                &nbsp;</td>
        </tr>
        </table>
   
</asp:Content>

