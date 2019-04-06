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

public partial class Admin_dept_mst : System.Web.UI.Page
{
    payroll objPayroll = new payroll();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            lblMessage.Text = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strMaxNoQry = "select isnull(max(dept_no),0) from dept_mst";
        object objMaxNo = objPayroll.GetScalar(strMaxNoQry);
        
        string strExistQty = "select count(*) from dept_mst where dept_name = '" + txtdept_name.Text.Trim() + "'";
        object intExistCnt = objPayroll.GetScalar(strExistQty);
        if (Convert.ToInt32(intExistCnt) > 0)
        {
            lblMessage.Text = "Record Already Exists...!!!";
            //SqlDSdept.UpdateCommand = "Update dept_mst set dept_name = '" + Session["strDeptName"] + "' WHERE  dept_no = " + Session["intDeptNo"];
            return;
        }
        //strMaxNoQry = "select iif(max(dept_no) != null,max(dept_no)+1,1) from dept_mst";
        string strInsQry = "insert into dept_mst(dept_no,dept_name) values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + ", '" + txtdept_name.Text.Trim() + "')";
        int strQryRes = objPayroll.insertdata(strInsQry);
        if (strQryRes > 0)
        {
            lblMessage.Text = "Record Saved Successfully.";
            txtdept_name.Text = "";
            SqlDSdept.DataBind();
            gdvDept.DataBind();
        }
        else
        {
            lblMessage.Text = "Record is not saved.";
        }

    }
    protected void gdvDept_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Session["intDeptNo"] = gdvDept.Rows[e.NewEditIndex].Cells[0].Text;
        Session["strDeptName"] = gdvDept.Rows[e.NewEditIndex].Cells[1].Text;
    }
    protected void gdvDept_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox txtNewDept = (TextBox)gdvDept.Rows[e.RowIndex].Cells[1].Controls[0];
        //string strSectionName = gdvCart.Rows[e.RowIndex].Cells[2].Text;
        //lblMsg.Text = txtNewValu.Text;

        try
        {
            string strExistQty = "select count(*) from dept_mst where dept_name = '" + txtNewDept.Text.Trim() + "'";
            object intExistCnt = objPayroll.GetScalar(strExistQty);
            if (Convert.ToInt32(intExistCnt) > 0)
            {
                lblMessage.Text = "Record Already Exists...!!!";
                SqlDSdept.UpdateCommand = "Update dept_mst set dept_name = '" + Session["strDeptName"] + "' WHERE  dept_no = " + Session["intDeptNo"];
                return;
            }
            SqlDSdept.UpdateCommand = "Update dept_mst set dept_name ='" + txtNewDept.Text.Trim() + "'  WHERE  dept_no=" + Session["intDeptNo"];
            SqlDSdept.Update();
            lblMessage.Text = "RECORD UPDATED SUCCESSFULLY...!!!";
        }
        catch (Exception ex1)
        {
            lblMessage.Text = "Access Denied... :: " + ex1.Message;
        }
    }
    protected void gdvDept_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        gdvDept.DataBind();
    }
    protected void gdvDept_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string strdeptID = gdvDept.Rows[e.RowIndex].Cells[0].Text;
        try
        {
            string strExistQry = "select count(*) from emp_mst where department = " + strdeptID;
            object objExist = objPayroll.GetScalar(strExistQry);
            if (Convert.ToInt32(objExist) > 0)
            {
                lblMessage.Text = "Can't Delete This Value becoz it Contains Record...";
                SqlDSdept.DeleteCommand = "Delete from dept_mst WHERE dept_no=0";
                SqlDSdept.Delete();
                gdvDept.DataBind();
                return;
            }
            SqlDSdept.DeleteCommand = "Delete from dept_mst WHERE dept_no=" + strdeptID;
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
}