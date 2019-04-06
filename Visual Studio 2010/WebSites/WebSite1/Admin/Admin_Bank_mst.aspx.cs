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

public partial class Admin_Bank_mst : System.Web.UI.Page
{
    payroll objPayroll = new payroll();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            lblMessage.Text = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strMaxNoQry = "select isnull(max(bank_id),0) from bank_mst";
        object objMaxNo = objPayroll.GetScalar(strMaxNoQry);

        string strExistQty = "select count(*) from bank_mst where bank_name = '" + txtbank_name.Text.Trim() + "'";
        object intExistCnt = objPayroll.GetScalar(strExistQty);
        if (Convert.ToInt32(intExistCnt) > 0)
        {
            lblMessage.Text = "Record Already Exists...!!!";
            return;
        }
        string strInsQry = "insert into bank_mst(bank_id,bank_name,branch_name) values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + ", '" + txtbank_name.Text.Trim() + "', '" + txtbranch_name.Text.Trim() + "')";
        int strQryRes = objPayroll.insertdata(strInsQry);
        if (strQryRes > 0)
        {
            lblMessage.Text = "Record Saved Successfully.";
            txtbank_name.Text = "";
            txtbranch_name.Text = "";
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
        Session["intBankNo"] = gdvDept.Rows[e.NewEditIndex].Cells[0].Text;
        Session["strBankName"] = gdvDept.Rows[e.NewEditIndex].Cells[1].Text;
        Session["strBrName"] = gdvDept.Rows[e.NewEditIndex].Cells[2].Text;
    }
    protected void gdvDept_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox txtNewBank = (TextBox)gdvDept.Rows[e.RowIndex].Cells[1].Controls[0];
        TextBox txtNewBrName = (TextBox)gdvDept.Rows[e.RowIndex].Cells[2].Controls[0];

        try
        {
            string strExistQty = "select count(*) from bank_mst where bank_name = '" + txtNewBank.Text.Trim() + "' and bank_id <> " + Convert.ToInt32(Session["intBankNo"]).ToString();
            object intExistCnt = objPayroll.GetScalar(strExistQty);
            if (Convert.ToInt32(intExistCnt) > 0)
            {
                lblMessage.Text = "Record Already Exists...!!!";
                SqlDSdept.UpdateCommand = "Update bank_mst set bank_name = '" + Session["strBankName"] + "',branch_name = '" + Session["strBrName"].ToString() + "' WHERE bank_id = " + Session["intBankNo"];
                return;
            }
            SqlDSdept.UpdateCommand = "Update bank_mst set bank_name ='" + txtNewBank.Text.Trim() + "',branch_name = '" + txtNewBrName.Text.Trim() + "' WHERE bank_id=" + Session["intBankNo"];
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
        string strBankID = gdvDept.Rows[e.RowIndex].Cells[0].Text;
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
            SqlDSdept.DeleteCommand = "Delete from bank_mst WHERE bank_id=" + strBankID;
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