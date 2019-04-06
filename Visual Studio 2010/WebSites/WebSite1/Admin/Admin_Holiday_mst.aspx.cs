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

public partial class Admin_Holiday_mst : System.Web.UI.Page
{
    payroll objPayroll = new payroll();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            lblMessage.Text = "";
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        DateTime dtStdate;
        try{ 
            dtStdate = Convert.ToDateTime(txtholiday_date.Text.Trim());
            if (dtStdate.Year != System.DateTime.UtcNow.Date.Year)
            {
                lblMessage.Text = "Enter Holiday of Current Year.";
                txtholiday_date.Focus();
                return;
            }

        }
        catch{
            lblMessage.Text = "Enter Proper Holiday Date.";
            txtholiday_date.Focus();
            return;
        }

        string strMaxNoQry = "select isnull(max(holiday_id),0) from holiday_mst";
        object objMaxNo = objPayroll.GetScalar(strMaxNoQry);

        string strInsQry = "insert into holiday_mst(holiday_id,holiday_date,holiday_name) values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + ", '" + dtStdate + "', '" + txtholiday_name.Text.Trim() + "')";
        int strQryRes = objPayroll.insertdata(strInsQry);
        if (strQryRes > 0)
        {
            lblMessage.Text = "Record Saved Successfully.";
            txtholiday_date.Text = "";
            txtholiday_name.Text = "";
            sdsHoliday.DataBind();
            gdvDept.DataBind();
        }
        else
        {
            lblMessage.Text = "Record is not saved.";
        }
    }
    
    protected void gdvDept_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string strdeptID = gdvDept.Rows[e.RowIndex].Cells[0].Text;
        try
        {
            sdsHoliday.DeleteCommand = "Delete from holiday_mst WHERE holiday_id=" + strdeptID;
            sdsHoliday.Delete();
            lblMessage.Text = "RECORD DELETED SUCCESSFULLY...";
            gdvDept.DataBind();
        }
        catch (Exception ex1)
        {
            lblMessage.Text = "Access Denied... :: " + ex1.Message;
        }
 
    }

    protected void gdvDept_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        gdvDept.DataBind();
    }
}
