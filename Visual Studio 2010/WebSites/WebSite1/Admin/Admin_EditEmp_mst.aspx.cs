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

public partial class Admin_EditEmp_mst : System.Web.UI.Page
{
    payroll objPayroll = new payroll();
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["strDBConn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblMessage.Text = "";
            if (Request.QueryString.Get(0) != null)
            {
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            //lblMessage.Text = "select emp_no,emp_name,address1,address2,city,pincode,format(bdate,'mm/dd/yyyy'),age,desgnation,department,type where emp_no=" + txtemp_no.Text.Trim();
            cmd.CommandText = "select emp_no,emp_name,address1,address2,city,pincode,convert(varchar(50),bdate,101)as bd,age,convert(varchar(50),emp_doj,101)as emp_doj,desgnation,department,type,emp_bankdetail,emp_username,emp_password from emp_mst where emp_no=" + Request.QueryString.Get(0).ToString();
            con.Open();
            dr = cmd.ExecuteReader();
                if (dr.HasRows){
                    while (dr.Read()){
                        txtemp_no.Text = dr[0].ToString();
                        txtemp_name.Text = dr[1].ToString();
                        txtaddress1.Text = dr[2].ToString();
                        txtaddress2.Text = dr[3].ToString();
                        txtcity.Text = dr[4].ToString();
                        txtpincode.Text = dr[5].ToString();
                        txtbdate.Text = dr[6].ToString();
                        txtage.Text = dr[7].ToString();
                        lblDoj.Text = dr[8].ToString();
                        ddlDepartment.SelectedValue = dr[10].ToString();
                        ddlDesignation.SelectedValue = dr[9].ToString();
                        txttype.Text = dr[11].ToString();
                        txtemp_bankdetail.Text = dr[12].ToString();
                        txtemp_Username.Text = dr[13].ToString();
                        txtemp_password.Text = dr[14].ToString();
                    }
                }
        }
    }
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
        lblDoj.Text = "";
        txttype.Text = "";
        txtemp_bankdetail.Text = "";
        txtemp_Username.Text = "";
        txtemp_password.Text = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try { int age = Convert.ToInt32(txtage.Text.Trim()); }
        catch
        {
            lblMessage.Text = "Enter Proper Age.";
            txtage.Focus();
            return;
        }
        try { DateTime dtbdate = Convert.ToDateTime(txtbdate.Text.Trim()); }
        catch
        {
            lblMessage.Text = "Enter Proper Birth Date.";
            txtbdate.Focus();
            return;
        }

        string strExistQty = "select count(*) from emp_mst where emp_name = '" + txtemp_name.Text.Trim() + "' and emp_no <> " + Convert.ToInt32(txtemp_no.Text);
        object intExistCnt = objPayroll.GetScalar(strExistQty);
        if (Convert.ToInt32(intExistCnt) > 0)
        {
            lblMessage.Text = "Record Already Exists...!!!";
            return;
        }
        string strInsQry = "update emp_mst set emp_name = '" + txtemp_name.Text.Trim() + "',address1 = '" + txtaddress1.Text.Trim() + "',address2 = '" + txtaddress2.Text.Trim() + "',city = '" + txtcity.Text.Trim() + "',pincode = '" + txtpincode.Text.Trim() + "',bdate = " + txtbdate.Text + ",age = " + Convert.ToInt32(txtage.Text.Trim()).ToString() + ",desgnation = " + ddlDesignation.SelectedValue.ToString() + ",department = " + ddlDepartment.SelectedValue.ToString() + ",type ='" + txttype.Text.Trim() + "',emp_bankdetail='" + txtemp_bankdetail.Text.Trim() + "',emp_username = '" + txtemp_Username.Text.Trim() + "',emp_password = '" + txtemp_password.Text.Trim() + "' where emp_no = " + (Convert.ToInt32(txtemp_no.Text).ToString());
        int strQryRes = objPayroll.insertdata(strInsQry);
        if (strQryRes > 0)
        {
            lblMessage.Text = "Record Saved Successfully.";
            //ClearControls();
        }
        else
        {
            lblMessage.Text = "Record is not saved.";
        }

    }
    //protected void gdvDept_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    string strEmpID = gdvDept.Rows[e.RowIndex].Cells[0].Text;
    //    try
    //    {
    //        /*string strExistQry = "select count(*) from emp_mst where department = " + strdeptID;
    //        object objExist = objPayroll.GetScalar(strExistQry);
    //        if (Convert.ToInt32(objExist) > 0)
    //        {
    //            lblMessage.Text = "Can't Delete This Value becoz it Contains Record...";
    //            SqlDSdept.DeleteCommand = "Delete from dept_mst WHERE dept_no=0";
    //            SqlDSdept.Delete();
    //            gdvDept.DataBind();
    //            return;
    //        }*/
    //        SqlDSdept.DeleteCommand = "Delete from emp_mst WHERE [emp_no] = " + strEmpID;
    //        SqlDSdept.Delete();
    //        lblMessage.Text = "RECORD DELETED SUCCESSFULLY...";
    //        gdvDept.DataBind();
    //    }
    //    catch (Exception ex1)
    //    {
    //        lblMessage.Text = "Access Denied... :: " + ex1.Message;
    //    }
    //}
}