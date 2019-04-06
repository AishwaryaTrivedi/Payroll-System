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

public partial class User_loan_request : System.Web.UI.Page
{
    payroll objPayroll = new payroll();
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["strDBConn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            lblMessage.Text = "";
        Label1.Text = DateTime.Now.ToString("dd/MMM/yyyy");
    }
 
    private void ClearControls()
    {
        txtloan_req_purpose.Text = "";
        txtloan_req_desc.Text = "";
        txtloan_req_amt.Text = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        decimal decLoanAmt;
        try { decLoanAmt = Convert.ToDecimal(txtloan_req_amt.Text.Trim()); }
        catch
        {
            lblMessage.Text = "Enter Proper Loan Amount.";
            txtloan_req_amt.Focus();
            return;
        }

        string strMaxNoQry = "select isnull(max(loan_req_id),0) from loan_request";
        object objMaxNo = objPayroll.GetScalar(strMaxNoQry);

        string strInsQry = "insert into loan_request(loan_req_id,emp_id,loan_req_date,loan_req_purpose,loan_req_desc,loan_req_amt,loan_req_status) values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + "," + Session["emp_no"].ToString() + ",'" + Label1.Text  + "', '" + txtloan_req_purpose.Text.Trim() + "', '" + txtloan_req_desc.Text.Trim() + "', " + decLoanAmt + ",'Pending')";
        int strQryRes = objPayroll.insertdata(strInsQry);
        if (strQryRes > 0)
        {
            lblMessage.Text = "Record Saved Successfully.";
            ClearControls();
            sdsLoanReq.DataBind();
            GridView1.DataBind();
        }
        else
            lblMessage.Text = "Record is not saved.";
    }
}