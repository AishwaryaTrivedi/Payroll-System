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

public partial class Admin_Emp_LeaveEncash : System.Web.UI.Page
{
    payroll objPayroll = new payroll();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int j;
            for (int i = 2010; i < 2050; i++)
            {
                j=i;
                ddlYear.Items.Add(i.ToString() + "-" + (j+1).ToString());
            }
            lblLeavesTaken.Text = "0";
            lblLeaveEncash.Text = "0";
            lblEncashAmt.Text = "0";
            lblMessage.Text = "";
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DateTime dtFinYrStdate;
        DateTime dtFinYrEnddate;
        dtFinYrStdate = Convert.ToDateTime("04/01/" + ddlYear.Text.Substring(0, 4));
        dtFinYrEnddate = Convert.ToDateTime("03/31/" + ddlYear.Text.Substring(5,4));

        string strCntAcptLeaveYr = "select isnull(sum(leave_days),0) from leave_request where (emp_id = " + ddlEmp.SelectedValue + ") and (leave_date between '" + dtFinYrStdate + "' and '"+ dtFinYrEnddate +"') and (leave_req_status = 'Accept')";
        int inNoofAcptLeaveYr = Convert.ToInt32(objPayroll.GetScalar(strCntAcptLeaveYr));
        int inLeaveEncash = 50 - inNoofAcptLeaveYr;
        lblLeavesTaken.Text = inNoofAcptLeaveYr.ToString();
        lblLeaveEncash.Text = inLeaveEncash.ToString();

        string strQryBSal = "select isnull(emp_bas_sal,0) from emp_mst where emp_no=" + ddlEmp.SelectedValue;
        decimal decBasSal = Convert.ToDecimal(objPayroll.GetScalar(strQryBSal));
        decimal decSalPerDy = decBasSal / 30;
        if (inNoofAcptLeaveYr < 50)
            lblEncashAmt.Text = Math.Round(decSalPerDy * inLeaveEncash).ToString();
        else
            lblEncashAmt.Text = "0";

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string strQryExist = "select count(*) from emp_leave_encash where EncasEmpID = " + ddlEmp.SelectedValue + " and EncasFinYear = '" + ddlYear.Text + "'";
        int inExist = Convert.ToInt32( objPayroll.GetScalar(strQryExist));
        if (inExist > 0)
        {
            lblMessage.Text = "Record for selected Employee already saved.";
            return;
        }
        else
        {
            string strMaxNoQry = "select isnull(max(EncasID),0) from emp_leave_encash";
            object objMaxNo = objPayroll.GetScalar(strMaxNoQry);

            string strFields = "EncasID,EncasFinYear,EncasDate,EncasEmpID,TotLeaveTaken,EncasLeave,EncasAmt";
            string strInsQry = "insert into emp_leave_encash(" + strFields + ") values( " + (Convert.ToInt32(objMaxNo) + 1).ToString() + ", '" + ddlYear.Text + "', '" + System.DateTime.Now.Date + "', " + ddlEmp.SelectedValue + ", " + Convert.ToInt32(lblLeavesTaken.Text) + "," + Convert.ToInt32(lblLeaveEncash.Text) + "," + Convert.ToDecimal(lblEncashAmt.Text) + ")";

            if (objPayroll.insertdata(strInsQry) > 0)
                lblMessage.Text = "Record Saved Successfully.";
            else
                lblMessage.Text = "Record Not Saved.";
        }
    }
}