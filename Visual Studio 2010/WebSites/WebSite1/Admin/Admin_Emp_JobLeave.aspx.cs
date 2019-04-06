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

public partial class Admin_Emp_JobLeave : System.Web.UI.Page
{
    payroll objPayroll = new payroll();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblProvFund.Text = "0";
            lblGraduity.Text = "0";
            lblMessage.Text = "";
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DateTime dtStdate;
        try{
            dtStdate = Convert.ToDateTime(txtleave_date.Text.Trim());
        }
        catch{
            lblMessage.Text = "Enter Proper Leaving Date.";
            txtleave_date.Focus();
            return;
        }

        string strQryLDate = "select emp_doj from emp_mst where emp_no = " + ddlEmp.SelectedValue;
        DateTime dtLeavDate = Convert.ToDateTime( objPayroll.GetScalar(strQryLDate)) ;

        TimeSpan Jobspan = (dtStdate - dtLeavDate);
        decimal decJobYear = (Jobspan.Days/365);

        string strQryPF = "SELECT ISNULL(SUM(EmpSalDetail.SalDAmount), 0) AS EmpPf FROM EmpSalMaster INNER JOIN EmpSalDetail ON EmpSalMaster.SalID = EmpSalDetail.SalID WHERE (EmpSalMaster.SalEmpID = " + ddlEmp.SelectedValue + ") AND (EmpSalDetail.SalDdesc = 'PF')";
        decimal decPF =Convert.ToDecimal( objPayroll.GetScalar(strQryPF));
        lblProvFund.Text = (decPF * 2).ToString();

        string strLstSal = "select isnull(max(SalBasSal),0) from EmpSalMaster where SalEmpID=" + ddlEmp.SelectedValue;
        decimal decLstsal = Convert.ToDecimal(objPayroll.GetScalar( strLstSal));
        decimal decDySal = Math.Round( decLstsal / 30 ,2);
        decimal decGrad = Math.Round((decJobYear * 20) * decDySal,2) ;

        lblGraduity.Text = decGrad.ToString();
        //string strInsQry = "insert into bank_mst(bank_id,bank_name,branch_name) values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + ", '" + txtleave_date.Text.Trim() + "', '" + txtbranch_name.Text.Trim() + "')";
        //int strQryRes = objPayroll.insertdata(strInsQry);
        //if (strQryRes > 0)
        //{
        //    lblMessage.Text = "Record Saved Successfully.";
        //    txtleave_date.Text = "";
        //    txtbranch_name.Text = "";
        //    SqlDSdept.DataBind();
        //    gdvDept.DataBind();
        //}
        //else
        //{
        //    lblMessage.Text = "Record is not saved.";
        //}

    }

    protected void btnResign_Click(object sender, EventArgs e)
    {
        string strUpdQry = "update emp_mst set emp_Status = 'Left', emp_dol = '" + txtleave_date.Text.ToString() + "' where emp_no=" + ddlEmp.SelectedValue;
        if (objPayroll.updatedata(strUpdQry) > 0)
        {
            lblMessage.Text = "Record Updated Successfully.";
        }
        else
        {
        }
    }
}