<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="salsheet.aspx.cs" Inherits="Admin_salsheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
Select Emp Name<asp:DropDownList ID="DropDownList1" runat="server" 
    DataSourceID="SqlDataSource1" DataTextField="emp_name" DataValueField="emp_no">
</asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:strDBConn %>" 
    SelectCommand="SELECT [emp_no], [emp_name] FROM [emp_mst]">
</asp:SqlDataSource>
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="view" />
</form>
</asp:Content>

