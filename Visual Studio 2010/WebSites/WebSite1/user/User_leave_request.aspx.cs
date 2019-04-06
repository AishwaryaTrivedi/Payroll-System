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

public partial class User_leave_request : System.Web.UI.Page
{
    payroll objPayroll = new payroll();
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["strDBConn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            lblMessage.Text = "";
    }
 
    private void ClearControls()
    {
        txtleave_date.Text = "";
        txtleave_days.Text = "";
        txtleave_reason.Text = "";
        txtleave_type.Text = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int inNoofDays;
        try { inNoofDays = Convert.ToInt32(txtleave_days.Text.Trim()); }
        catch{
            lblMessage.Text = "Enter Proper Number of days.";
            txtleave_days.Focus();
            return;
        }

        DateTime dtLvdate;
        try{
            dtLvdate = Convert.ToDateTime(txtleave_date.Text.Trim());
            if (dtLvdate < System.DateTime.UtcNow.Date)
            {
                lblMessage.Text = "Enter Proper Leave Date.";
                txtleave_date.Focus();
                return;
            }
        }
        catch{
            lblMessage.Text = "Enter Proper Leave Date.";
            txtleave_date.Focus();
            return;
        }

        string strMaxNoQry = "select isnull(max(leave_req_id),0) from leave_request";
        object objMaxNo = objPayroll.GetScalar(strMaxNoQry);

        string strFields = "leave_req_id,emp_id,leave_req_date,leave_date,leave_days,leave_reason,leave_type,leave_req_status";
        string strInsQry = "insert into leave_request(" + strFields + ") values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + "," + Session["emp_no"].ToString() + ",'" + System.DateTime.Today.Date + "','" + dtLvdate + "', " + txtleave_days.Text.Trim() + ", '" + txtleave_reason.Text.Trim() + "', '" + txtleave_type.Text.Trim() + "','Pending')";
        int strQryRes = objPayroll.insertdata(strInsQry);
        if (strQryRes > 0)
        {
            lblMessage.Text = "Record Saved Successfully.";
            ClearControls();
            sdsLeaveReq.DataBind();
            GridView1.DataBind();
        }
        else
            lblMessage.Text = "Record is not saved.";
    }
}