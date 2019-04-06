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

public partial class Admin_ded_mst : System.Web.UI.Page
{
    payroll objPayroll = new payroll();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            lblMessage.Text = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try { decimal tmpValue = Convert.ToDecimal(txtded_rate.Text.Trim()); }
        catch
        {
            lblMessage.Text = "Enter Proper Rate.";
            txtded_rate.Focus();
            return;
        }

        string strMaxNoQry = "select isnull(max(ded_id),0) from ded_mst";
        object objMaxNo = objPayroll.GetScalar(strMaxNoQry);

        string strExistQty = "select count(*) from ded_mst where ded_name = '" + txtded_name.Text.Trim() + "'";
        object intExistCnt = objPayroll.GetScalar(strExistQty);
        if (Convert.ToInt32(intExistCnt) > 0)
        {
            lblMessage.Text = "Record Already Exists...!!!";
            return;
        }
        string strInsQry = "insert into ded_mst(ded_id,ded_name,ded_rate) values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + ", '" + txtded_name.Text.Trim() + "', " + Convert.ToDecimal(txtded_rate.Text.Trim()) + ")";
        int strQryRes = objPayroll.insertdata(strInsQry);
        if (strQryRes > 0)
        {
            lblMessage.Text = "Record Saved Successfully.";
            txtded_name.Text = "";
            txtded_rate.Text = "";
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
        Session["intDedNo"] = gdvDept.Rows[e.NewEditIndex].Cells[0].Text;
        Session["strDedName"] = gdvDept.Rows[e.NewEditIndex].Cells[1].Text;
        Session["strDedRate"] = gdvDept.Rows[e.NewEditIndex].Cells[2].Text;
    }
    protected void gdvDept_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox txtNewDed = (TextBox)gdvDept.Rows[e.RowIndex].Cells[1].Controls[0];
        TextBox txtNewRate = (TextBox)gdvDept.Rows[e.RowIndex].Cells[2].Controls[0];
        //string strSectionName = gdvCart.Rows[e.RowIndex].Cells[2].Text;
        //lblMsg.Text = txtNewValu.Text;

        try
        {
            string strExistQty = "select count(*) from ded_mst where ded_name = '" + txtNewDed.Text.Trim() + "' and ded_id <> " + Convert.ToInt32(Session["intDedNo"]).ToString();
            object intExistCnt = objPayroll.GetScalar(strExistQty);
            if (Convert.ToInt32(intExistCnt) > 0)
            {
                lblMessage.Text = "Record Already Exists...!!!";
                SqlDSdept.UpdateCommand = "Update ded_mst set ded_name = '" + Session["strDedName"] + "',ded_rate = " + Convert.ToDecimal(Session["strDedRate"]) + " WHERE ded_id = " + Session["intDedNo"];
                return;
            }
            SqlDSdept.UpdateCommand = "Update ded_mst set ded_name ='" + txtNewDed.Text.Trim() + "',ded_rate = " + Convert.ToDecimal(txtNewRate.Text.Trim()) + " WHERE ded_id=" + Session["intDedNo"];
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
        string strallowID = gdvDept.Rows[e.RowIndex].Cells[0].Text;
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
            SqlDSdept.DeleteCommand = "Delete from ded_mst WHERE ded_id=" + strallowID;
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