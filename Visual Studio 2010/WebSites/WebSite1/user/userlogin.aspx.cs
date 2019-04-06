using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.IO;


public partial class User_userlogin : System.Web.UI.Page
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
       
        int flag = 0;
        String temp = null;
        foreach (char enc in txtemp_password.Text)
        {
            temp = temp + Convert.ToChar(enc + 2);
        }
        cmd = new SqlCommand("select emp_username, emp_password from emp_mst where emp_username='" + txtemp_username.Text.Trim() + "' and emp_password='" + txtemp_password.Text.Trim() + "'", obj.con);
       // cmd = new SqlCommand("select admin_username, admin_password from admin_login where admin_username='" + txtemp_username.Text.Trim() + "' and admin_password='" + txtemp_password.Text.Trim() + "'", obj.con);
        
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            flag = 0;
            string strQry = "select emp_no from emp_mst where emp_username = '" + txtemp_username.Text.Trim() + "'";
            Session["emp_no"] = obj.GetScalar(strQry).ToString();
            Response.Redirect("User_Profile_View.aspx?emp_no=" + Session["emp_no"].ToString());
        }
        if (flag == 0)
        {
            if ((string.Compare("Admin", txtemp_username.Text) == 0) && (string.Compare("Admin", txtemp_password.Text) == 0))
            {
                flag = 1;
                Session["Admin"] = txtemp_username.Text;
                Response.Redirect("~/Admin/AdminHome.aspx");

            }
        }
        if (flag == 0)
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Invalid Username or Password.";
        }
    }


    protected void txtemp_password_TextChanged(object sender, EventArgs e)
    {

        //if (txtemp_password.Text.Length < 6 || txtemp_password.Text.Length > 10)
        //{
        //    lblmsg.Visible = true;
        //    lblmsg.Text = "Password length should be lessthan 6 nd graterthan 10";
        //    txtemp_password.Text = "";
        //    txtemp_password.Focus();
        //}
    }
}
