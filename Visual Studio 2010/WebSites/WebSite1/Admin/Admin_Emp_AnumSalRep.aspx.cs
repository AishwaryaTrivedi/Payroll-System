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

public partial class Admin_Emp_AnumSalRep : System.Web.UI.Page
{
    payroll objPayroll = new payroll();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblMessage.Text = "";
        }
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        DateTime dtstdate;
        try
        {
            dtstdate = Convert.ToDateTime(txtStDate.Text.Trim());
        }
        catch
        {
            lblMessage.Text = "Enter Proper Start Date.";
            txtStDate.Focus();
            return;
        }

        DateTime dtEnddate;
        try
        {
            dtEnddate = Convert.ToDateTime(txtEndDate.Text.Trim());
        }
        catch
        {
            lblMessage.Text = "Enter Proper End Date.";
            txtEndDate.Focus();
            return;
        }

        sdsAnumSalRep.DataBind();
        GridView1.DataBind();

    }
}