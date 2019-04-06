using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_salsheet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["EMPNO"] = DropDownList1.SelectedValue;
        Response.Redirect("~/ADMIN/aDMIN_SAL_SLIP.ASPX");
    }
}