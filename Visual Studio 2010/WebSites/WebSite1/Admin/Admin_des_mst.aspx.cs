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

public partial class Admin_des_mst : System.Web.UI.Page
{
    payroll objPayroll = new payroll();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            lblMessage.Text = "";
    }   
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string strMaxNoQry = "select isnull(max(des_no),0) from des_mst";
        object objMaxNo = objPayroll.GetScalar(strMaxNoQry);

        string strExistQty = "select count(*) from des_mst where des_name = '" + txtdes_name.Text.Trim() + "' and dept_no = " + ddldept_name.SelectedValue.ToString();
        object intExistCnt = objPayroll.GetScalar(strExistQty);
        if (Convert.ToInt32(intExistCnt) > 0)
        {
            lblMessage.Text = "Record Already Exists...!!!";
            return;
        }
        string strInsQry = "insert into des_mst(des_no,des_name,dept_no) values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + ", '" + txtdes_name.Text.Trim() + "'," + ddldept_name.SelectedValue.ToString() + ")";
        int strQryRes = objPayroll.insertdata(strInsQry);
        if (strQryRes > 0)
        {
            lblMessage.Text = "Record Saved Successfully.";
            txtdes_name.Text = "";
            SqlDSdes.DataBind();
            gdvDept.DataBind();
        }
        else
        {
            lblMessage.Text = "Record is not saved.";
        }
    }
    protected void gdvDept_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Session["intDesNo"] = gdvDept.Rows[e.NewEditIndex].Cells[0].Text;
        Session["strDesName"] = gdvDept.Rows[e.NewEditIndex].Cells[1].Text;

    }
    protected void gdvDept_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox txtNewDes = (TextBox)gdvDept.Rows[e.RowIndex].Cells[1].Controls[0];
        //string strSectionName = gdvCart.Rows[e.RowIndex].Cells[2].Text;
        //lblMsg.Text = txtNewValu.Text;

        try
        {
            string strExistQty = "select count(*) from des_mst where des_name = '" + txtNewDes.Text.Trim() + "' and dept_no = " + ddldept_name.SelectedValue.ToString();
            object intExistCnt = objPayroll.GetScalar(strExistQty);
            if (Convert.ToInt32(intExistCnt) > 0)
            {
                lblMessage.Text = "Record Already Exists...!!!";
                SqlDSdes.UpdateCommand = "Update des_mst set des_name = '" + Session["strDesName"] + "' WHERE  des_no = " + Session["intDesNo"];
                return;
            }
            SqlDSdes.UpdateCommand = "Update des_mst set des_name ='" + txtNewDes.Text.Trim() + "' WHERE des_no=" + Session["intDesNo"];
            SqlDSdes.Update();
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
            string strExistQry = "select count(*) from emp_mst where desgnation = " + strdeptID;
            object objExist = objPayroll.GetScalar(strExistQry);
            if (Convert.ToInt32(objExist) > 0)
            {
                lblMessage.Text = "Can't Delete This Value becoz it Contains Record...";
                SqlDSdes.DeleteCommand = "Delete from des_mst WHERE des_no=0";
                SqlDSdes.Delete();
                gdvDept.DataBind();
                return;
            }
            SqlDSdes.DeleteCommand = "Delete from des_mst WHERE des_no=" + strdeptID;
            SqlDSdes.Delete();
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
