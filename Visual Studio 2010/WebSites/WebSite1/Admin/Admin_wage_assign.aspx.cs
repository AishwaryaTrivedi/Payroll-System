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

public partial class Admin_wage_assign : System.Web.UI.Page
{
    payroll objPayroll = new payroll();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblMessage.Text = "";
            sdsAllow.DataBind();
            cblAllow.DataBind();
            sdsDed.DataBind();
            cblDed.DataBind();
            sdsPerk.DataBind();
            cblPerk.DataBind();
            sdsTax.DataBind();
            cblTax.DataBind();
            sdsDept.DataBind();
            ddlDept.DataBind();
            sdsEmployee.DataBind();
            ddlEmp.DataBind();
            if (ddlEmp.Items.Count>0)
            {
                ddlEmp.SelectedIndex = 0;
                GetEmpWageDetails(Convert.ToInt32(ddlEmp.SelectedValue));
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            decimal tmpValue = Convert.ToDecimal(txtemp_bas_sal.Text.Trim());
        }
        catch
        {
            lblMessage.Text = "Enter proper Basic Salary";
            txtemp_bas_sal.Focus();
            return;
        }
        string strAllow = "";
        string strDed = "";
        string strPerk = "";
        string strTax = "";

        //to get allowance ids in csv
        for (int i = 0; i < cblAllow.Items.Count; i++)
        {
            if (cblAllow.Items[i].Selected)
            {
                strAllow += cblAllow.Items[i].Value + ",";
            }
        }
        if (strAllow.Length != 0)
            strAllow = strAllow.Substring(0, strAllow.Length - 1);
        //else{
        //    lblMessage.Text = "Select Atleast one Allowance";
        //    cblAllow.Focus();
        //    return;
        //}
        //to get perk ids in csv
        for (int i = 0; i < cblPerk.Items.Count; i++)
        {
            if (cblPerk.Items[i].Selected)
            {
                strPerk += cblPerk.Items[i].Value + ",";
            }
        }
        if (strPerk.Length != 0)
            strPerk = strPerk.Substring(0, strPerk.Length - 1);
        //else
        //{
        //    lblMessage.Text = "Select Atleast one Perk";
        //    cblPerk.Focus();
        //    return;
        //}
        //to get deduction ids in csv
        for (int i = 0; i < cblDed.Items.Count; i++)
        {
            if (cblDed.Items[i].Selected)
            {
                strDed += cblDed.Items[i].Value + ",";
            }
        }
        if (strDed.Length != 0)
            strDed = strDed.Substring(0, strDed.Length - 1);
        //else
        //{
        //    lblMessage.Text = "Select Atleast one Deduction";
        //    cblDed.Focus();
        //    return;
        //}
        //to get tax ids in csv
        for (int i = 0; i < cblTax.Items.Count; i++)
        {
            if (cblTax.Items[i].Selected)
            {
                strTax += cblTax.Items[i].Value + ",";
            }
        }
        if (strTax.Length != 0)
            strTax = strTax.Substring(0, strTax.Length - 1);
        //else
        //{
        //    lblMessage.Text = "Select Atleast one Tax";
        //    cblTax.Focus();
        //    return;
        //}
        string strUpdQry = "update emp_mst set emp_bas_sal = "+ Convert.ToDecimal(txtemp_bas_sal.Text.Trim()) +", emp_all='"+ strAllow.ToString() +"' ,emp_ded='" + strDed.ToString() + "' , emp_perk='" + strPerk.ToString() + "' , emp_tax='" + strTax.ToString() + "' where emp_no=" + ddlEmp.SelectedValue.ToString();
        int strQryRes = objPayroll.insertdata(strUpdQry);
        if (strQryRes > 0)
            lblMessage.Text = "Record Saved Successfully.";
        else
            lblMessage.Text = "Record is not saved.";
    }

    private void ClearControls()
    {
        txtemp_bas_sal.Text = "";
        foreach (ListItem li in cblAllow.Items)
        {
            li.Selected = false;
        }
        foreach (ListItem li in cblDed.Items)
        {
            li.Selected = false;
        }
        foreach (ListItem li in cblPerk.Items)
        {
            li.Selected = false;
        }
        foreach (ListItem li in cblTax.Items)
        {
            li.Selected = false;
        }
    }

    private void SetCheckList(CheckBoxList objcbl,string strItem)
    {
        for (int i = 0; i < objcbl.Items.Count; i++)
        {
            if (strItem.Equals(objcbl.Items[i].Value))
                objcbl.Items[i].Selected = true;
        }
    }

    private void GetEmpWageDetails(int EmpID)
    {
        ClearControls();

        string strQry1 = "select emp_bas_sal from emp_mst where emp_no=" + EmpID.ToString();
        string strBasSal = objPayroll.GetScalar(strQry1).ToString();
        if (!string.IsNullOrEmpty(strBasSal))
            txtemp_bas_sal.Text = strBasSal.ToString();
        
        //================================ Allwance =================================
        string strQry2 = "select emp_all from emp_mst where emp_no=" + EmpID.ToString();
        string strempall = objPayroll.GetScalar(strQry2).ToString();
        if (!string.IsNullOrEmpty(strempall))
        {
            string[] strall = strempall.Split(',');
            foreach (string strallitem in strall)
            {
                SetCheckList(cblAllow, strallitem);   
            }
        }
        
        //================================ Deduction =================================
        string strQry3 = "select emp_ded from emp_mst where emp_no=" + EmpID.ToString();
        string strempded = objPayroll.GetScalar(strQry3).ToString();
        if (!string.IsNullOrEmpty(strempded))
        {
            string[] strded = strempded.Split(',');
            foreach (string strdeditem in strded)
            {
                SetCheckList(cblDed, strdeditem);
            }
        }

        //================================ Perk =================================
        string strQry4 = "select emp_perk from emp_mst where emp_no=" + EmpID.ToString();
        string strempperk = objPayroll.GetScalar(strQry4).ToString();
        if (!string.IsNullOrEmpty(strempperk))
        {
            string[] strperk = strempperk.Split(',');
            foreach (string strperkitem in strperk)
            {
                SetCheckList(cblPerk, strperkitem);
            }
        }

        //================================ Tax =================================
        string strQry5 = "select emp_tax from emp_mst where emp_no=" + EmpID.ToString();
        string stremptax = objPayroll.GetScalar(strQry5).ToString();
        if (!string.IsNullOrEmpty(stremptax))
        {
            string[] strtax = stremptax.Split(',');
            foreach (string strtaxitem in strtax)
            {
                SetCheckList(cblTax, strtaxitem);
            }
        }
    }

    protected void ddlEmp_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetEmpWageDetails(Convert.ToInt32( ddlEmp.SelectedValue));
    }

    protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
    {
        sdsEmployee.DataBind();
        ddlEmp.DataBind();
        if (ddlEmp.Items.Count > 0)
        {
            ddlEmp.SelectedIndex = 0;
            GetEmpWageDetails(Convert.ToInt32(ddlEmp.SelectedValue));
        }

    }

}