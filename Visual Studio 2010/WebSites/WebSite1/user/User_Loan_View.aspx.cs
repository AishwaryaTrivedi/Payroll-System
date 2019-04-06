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

public partial class User_Loan_View : System.Web.UI.Page
{
    payroll objPayroll = new payroll();
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["strDBConn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
        //    if (Session["emp_no"] != null)
        //    {
        //    SqlDataReader dr;
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandType = CommandType.Text;
        //    cmd.Connection = con;
        //    //lblMessage.Text = "select emp_no,emp_name,address1,address2,city,pincode,format(bdate,'mm/dd/yyyy'),age,desgnation,department,type where emp_no=" + txtemp_no.Text.Trim();
        //    string strFields = "emp_no,emp_name,address1,address2,city,pincode,convert(varchar(50),bdate,101)as bd,dept.dept_name,des_name,type";
        //    cmd.CommandText = "select " + strFields + " from emp_mst e,dept_mst dept,des_mst des where (e.desgnation = des.des_no) and (e.department=dept.dept_no) and emp_no=" + Session["emp_no"].ToString();
        //    con.Open();
        //    dr = cmd.ExecuteReader();
        //        if (dr.HasRows){
        //            while (dr.Read()){
        //                txtemp_no.Text = dr[0].ToString();
        //                txtemp_name.Text = dr[1].ToString();
        //                txtaddress1.Text = dr[2].ToString();
        //                txtaddress2.Text = dr[3].ToString();
        //                txtcity.Text = dr[4].ToString();
        //                txtpincode.Text = dr[5].ToString();
        //                txtbdate.Text = dr[6].ToString();
        //                txtemp_dept.Text = dr[7].ToString();
        //                txtemp_des.Text = dr[8].ToString();
        //                //ddlDepartment.SelectedValue = dr[9].ToString();
        //                //ddlDesignation.SelectedValue = dr[8].ToString();
        //                txttype.Text = dr[9].ToString();
        //            }
        //        }
        //}
    }
    }
    //private void ClearControls()
    //{
    //    txtemp_name.Text = "";
    //    txtaddress1.Text = "";
    //    txtaddress2.Text = "";
    //    txtcity.Text = "";
    //    txtpincode.Text = "";
    //    txtbdate.Text = "";
    //    txtemp_dept.Text = "";
    //    txtemp_des.Text = "";
    //    txttype.Text = "";
    //}
}