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

public partial class Admin_Admin_Sal_Slip : System.Web.UI.Page
{

    payroll obj = new payroll();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["strDBConn"].ConnectionString);
        con.Open();
        obj.daa = new SqlDataAdapter("select * from emp_mst where emp_no=" + Session["empno"].ToString() + "",con);
        obj.daa.Fill(ds, "emp_mst");
        foreach (DataRow temp in ds.Tables[0].Rows)
        {
            lblEmpName.Text = temp["emp_name"].ToString();
            lblEmpID.Text = temp["emp_no"].ToString();
            object r1 = obj.scalar("select dept_name from dept_mst where dept_no=" + temp["department"].ToString() + " ");

            lblEmpDept.Text = r1.ToString();
            object r2 = obj.scalar("select des_name from des_mst where des_no=" + temp["desgnation"].ToString() + " ");

            lblEmpDesignation.Text = r2.ToString(); 
            lblBasSalary.Text = temp["EMP_bas_sal"].ToString();

            lblEmpSalDate.Text = DateTime.Now.ToShortDateString();
            Label1.Text = ((Convert.ToDouble(lblBasSalary.Text) * 15)/100).ToString();

            
            Label2.Text = ((Convert.ToDouble(lblBasSalary.Text) * 10) / 100).ToString();
            lblTotEarning.Text = (Convert.ToDouble(lblBasSalary.Text) + Convert.ToDouble(Label1.Text) + Convert.ToDouble(Label2.Text)).ToString();

            object r3 = obj.scalar("select loan_emi from loan_mst where emp_id=" + Session["empno"].ToString() + " ");
            lblTotLoan.Text = r3.ToString();
            lblEmpNetSal.Text = (Convert.ToDouble(lblTotEarning.Text ) - Convert.ToDouble(lblTotLoan.Text)).ToString();
        }
    }
    //    decimal decTotalEarning = 0;
    //    decimal decTotalDeduction = 0;
    //    if (!string.IsNullOrEmpty( Request.QueryString.Get(0)))
    //    {
    //        string strFields = "m.SalMonth,m.SalYear,convert(varchar(50),m.SalDate,103) as SalaryDate,m.SalBasSal,m.SalTotAll,m.SalTotDed,m.SalTotPerk,m.SalTotTax,m.SalTotLoan,m.SalTotOverLeave,m.SalTotLeave,m.SalNetSal,e.emp_no,e.emp_name,e.type,dept.dept_name,des.des_name";//,convert(varchar(50),e.bdate,106) as BirthDate
    //        string strQry = "select " + strFields + " from EmpSalMaster m,EmpSalDetail d,emp_mst e,dept_mst dept,des_mst des where (m.SalEmpID = e.emp_no) and(e.desgnation=des.des_no) and (e.department =dept.dept_no) and m.SalID =" + Request.QueryString.Get(0).ToString();
    //        DataSet dsDetail = objPayroll.GetDataset(strQry);
    //        if (dsDetail.Tables[0].Rows.Count > 0)
    //        {
    //            lblSalMonYear.Text = dsDetail.Tables[0].Rows[0]["SalMonth"].ToString() + "  " + dsDetail.Tables[0].Rows[0]["SalYear"].ToString();
    //            lblEmpID.Text = dsDetail.Tables[0].Rows[0]["emp_no"].ToString() ;
    //            lblEmpName.Text = dsDetail.Tables[0].Rows[0]["emp_name"].ToString();
    //            lblEmpDept.Text = dsDetail.Tables[0].Rows[0]["dept_name"].ToString();
    //            lblEmpDesignation.Text = dsDetail.Tables[0].Rows[0]["des_name"].ToString();
    //            lblEmpSalDate.Text = dsDetail.Tables[0].Rows[0]["SalaryDate"].ToString();
    //            lblEmpType.Text = dsDetail.Tables[0].Rows[0]["type"].ToString();
    //            lblBasSalary.Text = dsDetail.Tables[0].Rows[0]["SalBasSal"].ToString();
    //            lblTotLoan.Text = dsDetail.Tables[0].Rows[0]["SalTotLoan"].ToString();
    //            lblTotOvrLeave.Text = dsDetail.Tables[0].Rows[0]["SalTotOverLeave"].ToString();
    //            lblTotLeave.Text = dsDetail.Tables[0].Rows[0]["SalTotLeave"].ToString();
    //            lblEmpNetSal.Text = dsDetail.Tables[0].Rows[0]["SalNetSal"].ToString();

    //            decTotalDeduction = Convert.ToDecimal(dsDetail.Tables[0].Rows[0]["SalTotDed"]) + Convert.ToDecimal(dsDetail.Tables[0].Rows[0]["SalTotTax"]) + Convert.ToDecimal(dsDetail.Tables[0].Rows[0]["SalTotLoan"]) + Convert.ToDecimal(dsDetail.Tables[0].Rows[0]["SalTotLeave"]) + Convert.ToDecimal(dsDetail.Tables[0].Rows[0]["SalTotOverLeave"]);
    //            lblTotDed.Text = decTotalDeduction.ToString();

    //            decTotalEarning = Convert.ToDecimal(dsDetail.Tables[0].Rows[0]["SalTotAll"])+Convert.ToDecimal(dsDetail.Tables[0].Rows[0]["SalTotPerk"]);
    //            lblTotEarning.Text = decTotalEarning.ToString();

    //        }
    //        SetSlipDetailTable("Allowance", tblAllowances);
    //        SetSlipDetailTable("Deduction", tblDeduction);
    //        SetSlipDetailTable("Perk", tblPerk);
    //        SetSlipDetailTable("Tax", tblTax);
            
    //    }
    //}

    //private void SetSlipDetailTable(string strSalType, Table tblDesc)
    //{
    //    string strQryDetail = "select d.SalDdesc,d.SalDAmount from EmpSalDetail d where d.SalDtype = '" + strSalType + "' and d.SalID =" + Request.QueryString.Get(0).ToString();
    //    DataSet ds = objPayroll.GetDataset(strQryDetail);
    //    TableRow r;
    //    TableCell c;

    //    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
    //    {
    //        r = new TableRow();
    //        c = new TableCell();
    //        c.Text = ds.Tables[0].Rows[i][0].ToString();
    //        c.Width = 100;
    //        c.BorderWidth = 1;
    //        r.Cells.Add(c);

    //        c = new TableCell();
    //        c.Text = ds.Tables[0].Rows[i][1].ToString();
    //        c.Width = 80;
    //        c.BorderWidth = 1;
    //        r.Cells.Add(c);
    //        tblDesc.Rows.Add(r);

    //    }
    //}
}
