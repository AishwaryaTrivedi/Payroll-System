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

public partial class Admin_sal_gen : System.Web.UI.Page
{
    payroll objPayroll = new payroll();
    int inMonth;
    int inYear;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblMessage.Text = "";
            

        }
    }

    protected void Page_PreRenderComplete(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
        txtFromDate.Text = "05/01/2011";
        txtToDate.Text = "05/31/2011";
        if ((ddlEmp.Items.Count > 0) && (ddlDept.Items.Count > 0))
        {
            DisplayEmpWages(Convert.ToInt32(ddlEmp.SelectedValue));
        }
    }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        inMonth = Convert.ToInt32(txtFromDate.Text.Substring(0, 2)); // objPayroll.GetMonthNumber(ddlMonth.Text);
        inYear = Convert.ToInt32(txtFromDate.Text.Substring(6, 4)); //Convert.ToInt32(ddlYear.Text);

        string strExistQty = "select count(*) from EmpSalMaster where SalEmpID = " + ddlEmp.SelectedValue.ToString() + " and SalMonth = '" + objPayroll.GetMonthName(inMonth).ToString() + "' and SalYear = " + inYear.ToString();
        object intExistCnt = objPayroll.GetScalar(strExistQty);
        if (Convert.ToInt32(intExistCnt) > 0)
        {
            lblMessage.Text = "Salary already saved for selected Employee.";
            return;
        }

        string strMaxNoQry = "select isnull(max(SalId),0) from EmpSalMaster";
        object objMaxNo = objPayroll.GetScalar(strMaxNoQry);

        string strFields = "SalID,SalYear,SalMonth,SalDate,SalEmpID,SalBasSal,SalTotAll,SalTotDed,SalTotPerk,SalTotTax,SalTotLoan,SalTotOverLeave,SalTotLeave,SalNetSal";
        string strInsQry = "insert into EmpSalMaster(" + strFields + ") values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + ", '" + inYear.ToString() + "', '" + objPayroll.GetMonthName(inMonth).ToString() + "','" + System.DateTime.UtcNow.Date + "', " + ddlEmp.SelectedValue.ToString() + "," + Convert.ToDecimal(txtemp_bas_sal.Text) + "," + Convert.ToDecimal(txtemp_total_all.Text) + "," + Convert.ToDecimal(txtemp_total_ded.Text) + "," + Convert.ToDecimal(txtemp_total_perk.Text) + "," + Convert.ToDecimal(txtemp_total_tax.Text) + "," + Convert.ToDecimal(txtemp_loan.Text) + "," + Convert.ToDecimal(txtemp_overLeave.Text) + "," + Convert.ToDecimal(txtemp_leave.Text) + "," + Convert.ToDecimal(txtemp_net_sal.Text) + ")";
        int strQryRes = objPayroll.insertdata(strInsQry);

        if (Convert.ToDecimal(txtemp_loan.Text) > 0)
        {
            string strFetchPrevPaid = "select loan_paidAmt from loan_mst where emp_id = " + ddlEmp.SelectedValue.ToString();
            decimal decFetchPrevPaid = Convert.ToDecimal(objPayroll.GetScalar(strFetchPrevPaid).ToString());
            decimal decUpdPaid = decFetchPrevPaid + Convert.ToDecimal(txtemp_loan.Text.Trim());
            string strUpdPrevPaid = "update loan_mst set loan_paidAmt = " + decUpdPaid.ToString() + " where emp_id = " + ddlEmp.SelectedValue.ToString();
            objPayroll.updatedata(strUpdPrevPaid);

        }
        if (strQryRes > 0)
        {

        //============================insert data in salary detail for allowance==================================
        foreach (ListItem li in lstAllow.Items)
        {
            string strDescName =  li.Text.Substring(0,(li.Text.IndexOf("-")-1)).Trim();
            string strDescAmt = li.Text.Substring((li.Text.IndexOf(":") + 2),(li.Text.Length - (li.Text.IndexOf(":") + 2))).Trim();
            string strInsDtlQry = "insert into EmpSalDetail(SalID,SalDtype,SalDdesc,SalDAmount) values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + ",'Allowance', '" + strDescName + "' ," + Convert.ToDecimal(strDescAmt) + ")";
            objPayroll.insertdata(strInsDtlQry);
        }

        //============================insert data in salary detail for deduction==================================
        foreach (ListItem li in lstDed.Items)
        {
            string strDescName = li.Text.Substring(0, (li.Text.IndexOf("-") - 1)).Trim();
            string strDescAmt = li.Text.Substring((li.Text.IndexOf(":") + 2), (li.Text.Length - (li.Text.IndexOf(":") + 2))).Trim();
            string strInsDtlQry = "insert into EmpSalDetail(SalID,SalDtype,SalDdesc,SalDAmount) values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + ",'Deduction', '" + strDescName + "' ," + Convert.ToDecimal(strDescAmt) + ")";
            objPayroll.insertdata(strInsDtlQry);
        }

        //============================insert data in salary detail for perk==================================
        foreach (ListItem li in lstPerk.Items)
        {
            string strDescName = li.Text.Substring(0, (li.Text.IndexOf("-") - 1)).Trim();
            string strDescAmt = li.Text.Substring((li.Text.IndexOf(":") + 2), (li.Text.Length - (li.Text.IndexOf(":") + 2))).Trim();
            string strInsDtlQry = "insert into EmpSalDetail(SalID,SalDtype,SalDdesc,SalDAmount) values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + ",'Perk', '" + strDescName + "' ," + Convert.ToDecimal(strDescAmt) + ")";
            objPayroll.insertdata(strInsDtlQry);
        }

        //============================insert data in salary detail for tax==================================
        foreach (ListItem li in lstTax.Items)
        {
            string strDescName = li.Text.Substring(0, (li.Text.IndexOf("-") - 1)).Trim();
            string strDescAmt = li.Text.Substring((li.Text.IndexOf(":") + 2), (li.Text.Length - (li.Text.IndexOf(":") + 2))).Trim();
            string strInsDtlQry = "insert into EmpSalDetail(SalID,SalDtype,SalDdesc,SalDAmount) values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + ",'Tax', '" + strDescName + "' ," + Convert.ToDecimal(strDescAmt) + ")";
            objPayroll.insertdata(strInsDtlQry);
        }

        lblMessage.Text = "Record Saved Successfully.";
        Response.Redirect("Admin_Sal_Slip.aspx?SalaryID=" + (Convert.ToInt32(objMaxNo) + 1).ToString());
        //Session["SalaryID"] = (Convert.ToInt32(objMaxNo) + 1).ToString();
        }
        else
        {
            lblMessage.Text = "Record is not saved.";
        }
    }

    private void ClearControls()
    {
        lblMessage.Text = "";
        txtemp_bas_sal.Text = "0";
        txtemp_total_all.Text = "0";
        txtemp_total_ded.Text = "0";
        txtemp_total_perk.Text = "0";
        txtemp_total_tax.Text = "0";
        txtemp_overLeave.Text = "0";
        txtemp_leave.Text = "0";
        txtemp_loan.Text = "0";
        txtemp_net_sal.Text = "0";
        lstAllow.Items.Clear();
        lstDed.Items.Clear();
        lstPerk.Items.Clear();
        lstTax.Items.Clear();
    }

    private void DisplayEmpWages(int EmpID)
    {
        ClearControls();

        string strQry1 = "select isnull(emp_bas_sal,0) from emp_mst where emp_no=" + EmpID.ToString();
        decimal decBasSal = Convert.ToDecimal(objPayroll.GetScalar(strQry1));
        decimal decTotAllowance = 0;
        decimal decTotDeduction = 0;
        decimal decTotPerk = 0;
        decimal decTotTax = 0;
        decimal decTotLoan = 0;
        decimal decOverLeaveDedu = 0;
        //decimal decTotLeave = 0;

        DateTime dtStartDate;
        try
        {
            dtStartDate = Convert.ToDateTime(txtFromDate.Text);
        }
        catch
        {
            lblMessage.Text = "Enter Proper Start Date.";
            txtFromDate.Focus();
            return;
        }

        DateTime dtEndDate;
        try
        {
            dtEndDate = Convert.ToDateTime(txtToDate.Text);
        }
        catch
        {
            lblMessage.Text = "Enter Proper End Date.";
            txtToDate.Focus();
            return;
        }

        inMonth = Convert.ToInt32(txtFromDate.Text.Substring(0, 2)); // objPayroll.GetMonthNumber(ddlMonth.Text);
        inYear = Convert.ToInt32(txtFromDate.Text.Substring(6, 4)); //Convert.ToInt32(ddlYear.Text);

        TimeSpan Jobspan = (dtEndDate - dtStartDate);
        int inJobDays = Jobspan.Days;
        inJobDays += 1;
        if( inJobDays<29) {
        decimal decBasSalDy = Math.Round(decBasSal / System.DateTime.DaysInMonth(inYear,inMonth) );
        decBasSal = Math.Round(inJobDays * decBasSalDy);
        }
        txtemp_bas_sal.Text = decBasSal.ToString();

        //================================== Allowance Calculation ============================================

        string strQry2 = "select emp_all from emp_mst where emp_no=" + EmpID.ToString();
        string strempall = objPayroll.GetScalar(strQry2).ToString();
        if (!string.IsNullOrEmpty(strempall))
        {
            string[] strall = strempall.Split(',');
            foreach (string strallitem in strall)
            {
                string strGetAllName = "select all_name from all_mst where all_id=" + strallitem;
                string strAllName = objPayroll.GetScalar(strGetAllName).ToString();
                string strGetAllRate = "select all_rate from all_mst where all_id=" + strallitem;
                decimal decAllRate = Convert.ToDecimal(objPayroll.GetScalar(strGetAllRate));
                decimal decAllAmt = Math.Round((decAllRate * decBasSal) / 100, 2);
                decTotAllowance += decAllAmt;
                //string lstItem = strAllName + " (" + decAllRate.ToString() + "%) Rs. " + decAllAmt.ToString();
                string lstItem = strAllName + " - Rs. : " + decAllAmt.ToString();
                lstAllow.Items.Add(lstItem);
            }
            txtemp_total_all.Text = decTotAllowance.ToString();
        }

        //==================================  Deduction Calculation==========================================

        string strQry3 = "select emp_ded from emp_mst where emp_no=" + EmpID.ToString();
        string strempded = objPayroll.GetScalar(strQry3).ToString();
        if (!string.IsNullOrEmpty(strempded))
        {
            string[] strded = strempded.Split(',');
            foreach (string strdeditem in strded)
            {
                string strGetDedName = "select ded_name from ded_mst where ded_id=" + strdeditem;
                string strDedName = objPayroll.GetScalar(strGetDedName).ToString();
                string strGetDedRate = "select ded_rate from ded_mst where ded_id=" + strdeditem;
                decimal decDedRate = Convert.ToDecimal(objPayroll.GetScalar(strGetDedRate));
                decimal decDedAmt = Math.Round((decDedRate * decBasSal) / 100, 2);
                decTotDeduction += decDedAmt;
                //string lstItem = strDedName + " (" + decDedRate.ToString() + "%) Rs. " + decDedAmt.ToString();
                string lstItem = strDedName + " - Rs. : " + decDedAmt.ToString();
                lstDed.Items.Add(lstItem);
            }
            txtemp_total_ded.Text = decTotDeduction.ToString();
        }
        //==================================  Perk Calculation =============================================

        string strQry4 = "select emp_perk from emp_mst where emp_no=" + EmpID.ToString();
        string strempperk = objPayroll.GetScalar(strQry4).ToString();
        if (!string.IsNullOrEmpty(strempperk))
        {
            string[] strall = strempperk.Split(',');
            foreach (string strallitem in strall)
            {
                string strGetAllName = "select perk_name from perk_mst where perk_id=" + strallitem;
                string strAllName = objPayroll.GetScalar(strGetAllName).ToString();
                string strGetAllRate = "select perk_rate from perk_mst where perk_id=" + strallitem;
                decimal decAllRate = Convert.ToDecimal(objPayroll.GetScalar(strGetAllRate));
                decimal decAllAmt = Math.Round((decAllRate * decBasSal) / 100, 2);
                decTotPerk += decAllAmt;
                //string lstItem = strAllName + " (" + decAllRate.ToString() + "%) Rs. " + decAllAmt.ToString();
                string lstItem = strAllName + " - Rs. : " + decAllAmt.ToString();
                lstPerk.Items.Add(lstItem);
            }
            txtemp_total_perk.Text = decTotPerk.ToString();
        }
        //================================== Tax Calculation =======================================

        string strQry5 = "select emp_tax from emp_mst where emp_no=" + EmpID.ToString();
        string stremptax = objPayroll.GetScalar(strQry5).ToString();
        if (!string.IsNullOrEmpty(stremptax))
        {
            string[] strall = stremptax.Split(',');
            foreach (string strallitem in strall)
            {
                string strGetAllName = "select tax_name from tax_mst where tax_id=" + strallitem;
                string strAllName = objPayroll.GetScalar(strGetAllName).ToString();
                string strGetAllRate = "select tax_rate from tax_mst where tax_id=" + strallitem;
                decimal decAllRate = Convert.ToDecimal(objPayroll.GetScalar(strGetAllRate));
                decimal decAllAmt = Math.Round((decAllRate * decBasSal) / 100, 2);
                decTotTax += decAllAmt;
                //string lstItem = strAllName + " (" + decAllRate.ToString() + "%) Rs. " + decAllAmt.ToString();
                string lstItem = strAllName + " - Rs. : " + decAllAmt.ToString();
                lstTax.Items.Add(lstItem);
            }
            txtemp_total_tax.Text = decTotTax.ToString();
        }

        //================================== Loan Calculation =======================================

        string strQry6 = "select isnull(loan_emi,0) from loan_mst where emp_id = " + EmpID.ToString() + " and loan_enddate > '" + System.DateTime.Today.Date + "'";
         //and month(loan_enddate) < " + System.DateTime.Today.Month +" and year(loan_enddate) < " + System.DateTime.Today.Year;
        decTotLoan = Convert.ToDecimal(objPayroll.GetScalar(strQry6));
        txtemp_loan.Text = decTotLoan.ToString();

        //================================== Net Salary Before Leave =======================================
        decimal decNetSalary = Math.Round((decBasSal + decTotAllowance + decTotPerk) - (decTotDeduction + decTotTax + decTotLoan), 2);
        decimal decDySalary = Math.Round(decNetSalary / System.DateTime.DaysInMonth( inYear,inMonth));

        //================================== Absent Leave Calculation =======================================
        
        //int inNoofDays = System.DateTime.DaysInMonth(inYear , inMonth);
        int inNoofDays = inJobDays;
        //int inNoofSundays = objPayroll.GetNumberOfSundays(inYear , inMonth);
        int inNoofSundays = objPayroll.GetNumberOfSundays(dtStartDate, dtEndDate);
        
        //string strCntHolidy = "select count(holiday_name) from holiday_mst where month(holiday_date) = " + inMonth + " and year(holiday_date) = " + inYear;
        string strCntHolidy = "select count(holiday_name) from holiday_mst where holiday_date between '" + dtStartDate + "' and '" + dtEndDate + "'";
        int inNoofHoli = Convert.ToInt32(objPayroll.GetScalar(strCntHolidy));
        
        //string strCntAcptLeave = "select isnull(sum(leave_days),0) from leave_request where emp_id = " + ddlEmp.SelectedValue +" and month(leave_date) = " + inMonth + " and year(leave_date) = " + inYear + " and leave_req_status = 'Accept'";
        string strCntAcptLeave = "select isnull(sum(leave_days),0) from leave_request where emp_id = " + ddlEmp.SelectedValue + " and leave_date between '" + dtStartDate + "' and '" + dtEndDate + "' and leave_req_status = 'Accept'";
        int inNoofAcptLeave = Convert.ToInt32(objPayroll.GetScalar(strCntAcptLeave));

        //==================================Start Yearly Leave Calculation =======================================

        DateTime dtFinYrStDate;
        DateTime dtFinYrEndDate;
        if (inMonth >= 1 && inMonth <=3)
        {
           dtFinYrStDate  = Convert.ToDateTime("04/01/" + (inYear - 1).ToString());
           dtFinYrEndDate  = Convert.ToDateTime("03/31/" + inYear.ToString());
        }
        else
        {
            dtFinYrStDate  = Convert.ToDateTime("04/01/" + inYear.ToString());
            dtFinYrEndDate  = Convert.ToDateTime("03/31/" + (inYear + 1).ToString());
        }

        string strCntAcptLeaveYr = "select isnull(sum(leave_days),0) from leave_request where (emp_id = " + ddlEmp.SelectedValue + ") and (leave_date between '" + dtFinYrStDate + "' and '"+ dtFinYrEndDate +"') and (leave_req_status = 'Accept')";
        int inNoofAcptLeaveYr = Convert.ToInt32(objPayroll.GetScalar(strCntAcptLeaveYr));

        int inNoofWorkDays;
        if (inNoofAcptLeaveYr > 50)
        {
            inNoofWorkDays = inNoofDays - (inNoofSundays + inNoofHoli);
            decOverLeaveDedu = Math.Round(inNoofAcptLeave * decDySalary);
            txtemp_overLeave.Text = decOverLeaveDedu.ToString();
        }
        else
        {
            int inCumLeave = inNoofAcptLeave + inNoofAcptLeaveYr;
            if (inCumLeave > 50)
            {
                int inSubCumLeave = inCumLeave - 50;
                decOverLeaveDedu = Math.Round(inSubCumLeave * decDySalary);
                txtemp_overLeave.Text = decOverLeaveDedu.ToString();
                inNoofWorkDays = inNoofDays - (inNoofSundays + inNoofHoli + inSubCumLeave);
            }
            else
                inNoofWorkDays = inNoofDays - (inNoofSundays + inNoofHoli + inNoofAcptLeave);
        }
        //==================================End Yearly Leave Calculation =======================================

        //string strCntPres = "select count(*) from AttendanceMaster where EmpID = " + ddlEmp.SelectedValue + " and month(AttendDate) = " + inMonth + " and year(AttendDate) = " + inYear;
        string strCntPres = "select count(*) from AttendanceMaster where EmpID = " + ddlEmp.SelectedValue + " and AttendDate between '" + dtStartDate + "' and '" + dtEndDate + "'";
        int inNoofPresDays = Convert.ToInt32(objPayroll.GetScalar(strCntPres));

        int inFullLeave = inNoofWorkDays - inNoofPresDays;
        
        //string strCntHalfDy = "select isnull(sum(LeaveDesc),0) from AttendanceMaster where EmpID = " + ddlEmp.SelectedValue + " and month(AttendDate) = " + inMonth + " and year(AttendDate) = " + inYear;
        string strCntHalfDy = "select isnull(sum(LeaveDesc),0) from AttendanceMaster where EmpID = " + ddlEmp.SelectedValue + " and AttendDate between '" + dtStartDate + "' and '" + dtEndDate + "'";
        decimal decHalfLeave = Convert.ToInt32(objPayroll.GetScalar(strCntHalfDy));

        decimal decTotalLeave = Convert.ToDecimal(inFullLeave) + decHalfLeave;
        
        decimal decLeaveDedu =Math.Round( decTotalLeave * decDySalary);
        txtemp_leave.Text = decLeaveDedu.ToString();

        txtemp_net_sal.Text = Math.Round((decNetSalary - (decLeaveDedu + decOverLeaveDedu))).ToString();
    }

    protected void ddlEmp_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((ddlEmp.Items.Count > 0) && (ddlDept.Items.Count > 0))
        {
            DisplayEmpWages(Convert.ToInt32(ddlEmp.SelectedValue));
        }
    }

    protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((ddlEmp.Items.Count > 0) && (ddlDept.Items.Count > 0))
        {
            DisplayEmpWages(Convert.ToInt32(ddlEmp.SelectedValue));
        }
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        
    }

}