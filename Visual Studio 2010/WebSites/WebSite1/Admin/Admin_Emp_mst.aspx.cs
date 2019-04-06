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

public partial class Admin_Emp_mst : System.Web.UI.Page
{
    payroll objPayroll = new payroll();

    protected void Page_Load(object sender, EventArgs e)
    {
            if (!Page.IsPostBack )
            lblMessage.Text = "";
    }

    private void ClearControls()
    {
        txtemp_name.Text = "";
        txtaddress1.Text = "";
        txtaddress2.Text = "";
        txtcity.Text = "";
        txtpincode.Text = "";
        txtbdate.Text = "";
        txtage.Text = "";
        txtLdate.Text = "";
        txttype.Text = "";
        txtBankDetail.Text = "";
        txtemp_username.Text = "";
        txtemp_password.Text = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String temp = null;
        foreach (char enc in txtemp_password.Text)
        {
            temp = temp + Convert.ToChar(enc + 2);
        }
        try { int age = Convert.ToInt32(txtage.Text.Trim()); }
        catch
        {
            lblMessage.Text = "Enter Proper Age.";
            txtage.Focus();
            return;
        }
        DateTime dtbdate;
        try { dtbdate = Convert.ToDateTime(txtbdate.Text.Trim()); 
        }
        catch
        {
            lblMessage.Text = "Enter Proper Birth Date.";
            txtbdate.Focus();
            return;
        }

        DateTime dtDoj;
        try{ dtDoj = Convert.ToDateTime(txtLdate.Text.Trim()); }
        catch{
            lblMessage.Text = "Enter Proper Date of Joining.";
            txtLdate.Focus();
            return;
        }

        string strMaxNoQry = "select isnull(max(emp_no),0) from emp_mst";
        object objMaxNo = objPayroll.GetScalar(strMaxNoQry);

        string strExistQty = "select count(*) from emp_mst where emp_username = '" + txtemp_username.Text.Trim() + "'";
        object intExistCnt = objPayroll.GetScalar(strExistQty);
        if (Convert.ToInt32(intExistCnt) > 0)
        {
            lblMessage.Text = "Username already assigned to another Employee.";
            return;
        }
        string strFields = "emp_no,emp_name,address1,address2,city,pincode,bdate,age,emp_doj,desgnation,department,type,emp_bankdetail,emp_username,emp_password,question,answer";
        string strInsQry = "insert into emp_mst(" + strFields + ") values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + ", '" + txtemp_name.Text.Trim() + "', '" + txtaddress1.Text.Trim() + "', '" + txtaddress2.Text.Trim() + "', '" + txtcity.Text.Trim() + "', '" + txtpincode.Text.Trim() + "','" + dtbdate.Date + "'," + Convert.ToInt32(txtage.Text.Trim()).ToString() + ",'" + dtDoj.Date + "', " + ddlDesignation.SelectedValue.ToString() + ", " + ddlDepartment.SelectedValue.ToString() + ", '" + txttype.Text.Trim() + "', '" + txtBankDetail.Text.Trim() + "', '" + txtemp_username.Text.Trim() + "', '" + temp.ToString() + "','"+DropDownList1.Text+"','"+ TextBox1.Text +"')";
        int strQryRes = objPayroll.insertdata(strInsQry);
        if (strQryRes > 0)
        {
            lblMessage.Text = "Record Saved Successfully.";
            ClearControls();
            SqlDSdept.DataBind();
            gdvDept.DataBind();
        }
        else
        {
            lblMessage.Text = "Record is not saved.";
        }

    }
    
    protected void gdvDept_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string strEmpID = gdvDept.Rows[e.RowIndex].Cells[0].Text;
        try
        {
            /*string strExistQry = "select count(*) from emp_mst where department = " + strdeptID;
            object objExist = objPayroll.GetScalar(strExistQry);
            if (Convert.ToInt32(objExist) > 0)
            {
                lblMessage.Text = "Can't Delete This Value becoz it Contains Record...";
                SqlDSdept.DeleteCommand = "Delete from dept_mst WHERE dept_no=0";
                SqlDSdept.Delete();
                gdvDept.DataBind();
                return;
            }*/
            SqlDSdept.DeleteCommand = "Delete from emp_mst WHERE [emp_no] = " + strEmpID;
            SqlDSdept.Delete();
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

    protected void gdvDept_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("Admin_EditEmp_mst.aspx?emp_no=" + gdvDept.SelectedValue.ToString());
    }
    protected void txtemp_password_TextChanged(object sender, EventArgs e)
    {

        //if (txtemp_password .Text.Length < 6 || txtemp_password.Text.Length > 10)
        //{
        //    lblmsg.Visible = true;
        //    lblmsg.Text = "Password length should be lessthan 6 nd graterthan 10";
        //    txtemp_password.Text = "";
        //    txtemp_password.Focus();
        //}
    }
}