using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Default : System.Web.UI.Page
{
    payroll obj = new payroll();
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            lblMessage.Text = "";
        obj.opencon();
    }
    protected void Login_Click(object sender, EventArgs e)
    {
        //if((string.Compare(txtadmin_username.Text, "admin")==0) && (string.Compare(txtadmin_password.Text, "admin")==0))
            cmd = new SqlCommand("select admin_username, admin_password from admin_login where admin_username='" + txtadmin_username.Text.Trim() + "' and admin_password='" + txtadmin_password.Text.Trim() + "'", obj.con);
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
            Response.Redirect("AdminHome.aspx");
        else
            lblMessage.Text = "Invalid Username or Password.";
    }
    protected void txtadmin_password_TextChanged(object sender, EventArgs e)
    {
        //if (txtadmin_password.Text.Length < 6 || txtadmin_password.Text.Length > 10)
        //{
        //    lblmsg.Visible = true;
        //    lblmsg.Text = "Password length should be lessthan 6 nd graterthan 10";
        //    txtadmin_password.Text = "";
        //    txtadmin_password.Focus();
        //}
    }
}
