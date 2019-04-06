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

public partial class Admin_admin_chg_pwd : System.Web.UI.Page
{
    payroll obj = new payroll();
    SqlCommand cmd;
    //SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            lblMessage.Text = "";
        obj.opencon();
    }
    protected void Login_Click(object sender, EventArgs e)
    {
        string strGetOpwd = "select admin_password from admin_login";
        string strOpwd = obj.GetScalar(strGetOpwd).ToString();
        if (!strOpwd.Equals(txtadmin_opwd.Text.Trim()))
        {
            lblMessage.Text = "";
            txtadmin_opwd.Focus();
            return;
        }
        obj.opencon();
        cmd = new SqlCommand("update admin_login set admin_password = '" + txtadmin_npwd.Text.Trim() + "'", obj.con);
        //+ " where admin_username='" + txtadmin_opwd.Text.Trim() + "' and admin_password='" + txtadmin_npwd.Text + "'"
        if (cmd.ExecuteNonQuery() > 0)
            lblMessage.Text = "Password Changed Successfully.";
        else
            lblMessage.Text = "Password Not Changed.";
    }
}
