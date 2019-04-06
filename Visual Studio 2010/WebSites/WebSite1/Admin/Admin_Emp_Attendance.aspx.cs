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

public partial class Admin_Emp_Attendance : System.Web.UI.Page
{
    payroll objPayroll = new payroll();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            for (int i = 2010; i < 2050; i++)
            {
                ddlYear.Items.Add(i.ToString());
            }
            lblMessage.Text = "";
        }
    }

    //private void ClearControls()
    //{
    //    txtloan_title.Text = "";
    //    txtloan_desc.Text = "";
    //    txtloan_amt.Text = "";
    //    txtloan_emi.Text = "";
    //    txtloan_startdate.Text = "";
    //    txtloan_duration.Text = "";
    //}

    //protected void btnSubmit_Click(object sender, EventArgs e)
    //{
    //    decimal decLoanAmount;
    //    try { decLoanAmount = Convert.ToDecimal(txtloan_amt.Text.Trim()); }
    //    catch
    //    {
    //        lblMessage.Text = "Enter Proper Loan Principle Amount.";
    //        txtloan_amt.Focus();
    //        return;
    //    }
    //    decimal decLoanEMI;
    //    try { decLoanEMI = Convert.ToDecimal(txtloan_emi.Text.Trim()); }
    //    catch
    //    {
    //        lblMessage.Text = "Enter Proper Loan EMI.";
    //        txtloan_emi.Focus();
    //        return;
    //    }

    //    DateTime dtStdate;
    //    try
    //    {
    //        dtStdate = Convert.ToDateTime(txtloan_startdate.Text.Trim());
    //    }
    //    catch
    //    {
    //        lblMessage.Text = "Enter Proper Start Date.";
    //        txtloan_startdate.Focus();
    //        return;
    //    }
    //    int intLoanDuration;
    //    try { intLoanDuration = Convert.ToInt32(txtloan_duration.Text.Trim()); }
    //    catch
    //    {
    //        lblMessage.Text = "Enter Proper Loan Duration.";
    //        txtloan_duration.Focus();
    //        return;
    //    }

    //    string strMaxNoQry = "select isnull(max(loan_id),0) from loan_mst";
    //    object objMaxNo = objPayroll.GetScalar(strMaxNoQry);

    //    //string strExistQty = "select count(*) from emp_mst where emp_name = '" + txtloan_title.Text.Trim() + "'";
    //    //object intExistCnt = objPayroll.GetScalar(strExistQty);
    //    //if (Convert.ToInt32(intExistCnt) > 0)
    //    //{
    //    //    lblMessage.Text = "Record Already Exists...!!!";
    //    //    return;
    //    //}
    //    DateTime dtEndDate = dtStdate.AddMonths(intLoanDuration);
    //    string strInsQry = "insert into loan_mst(loan_id,emp_id,loan_title,loan_desc,loan_amt,loan_emi,loan_startdate,loan_duration,loan_enddate) values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + "," + drpemp_id.SelectedValue + ", '" + txtloan_title.Text.Trim() + "', '" + txtloan_desc.Text.Trim() + "', " + decLoanAmount + ", " + decLoanEMI + ", '" + dtStdate + "'," + intLoanDuration + ", '" + dtEndDate + "')";
    //    int strQryRes = objPayroll.insertdata(strInsQry);
    //    if (strQryRes > 0)
    //    {
    //        lblMessage.Text = "Record Saved Successfully.";
    //        ClearControls();
    //    }
    //    else
    //        lblMessage.Text = "Record is not saved.";
    //}
}