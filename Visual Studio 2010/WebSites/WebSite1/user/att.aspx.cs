using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user_att : System.Web.UI.Page
{
    payroll objPayroll = new payroll();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    decimal decLeaveDesc;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
         String temp = null;
        foreach (char enc in txtPassword.Text)
        {
            temp = temp + Convert.ToChar(enc + 2);
        }
        if (rbPunchIn.Checked || rbPunchOut.Checked)
        {
            con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["strDBConn"].ConnectionString;
            cmd.CommandText = "select emp_username, emp_password from emp_mst where emp_username='" + txtUsername.Text.Trim() + "' and emp_password='" + temp + "'";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            dr = cmd.ExecuteReader();
            //dr = objPayroll.GetDataReader("");
            if (dr.HasRows)
            {
                string strQry = "select emp_no from emp_mst where emp_username = '" + txtUsername.Text.Trim() + "'";
                Session["emp_no"] = objPayroll.GetScalar(strQry).ToString();
            }
            else
            {
                lblMessage.Text = "Invalid Username or Password.";
                return;
            }

            //string strEmpStatus = objPayroll.GetScalar("select emp_attend from emp_mst where emp_no=" + Session["emp_no"].ToString()).ToString();
            string strOpt = (rbPunchIn.Checked) ? rbPunchIn.Text : rbPunchOut.Text;
            //if (strEmpStatus.Equals(strOpt))
            //{
            //    lblMessage.Text = "You have already done " + strOpt + " today.";
            //    return;
            //}
            //else
            //{
            //    string strUpdQry = "update emp_mst set emp_attend = '" + strOpt + "' where emp_no=" + Session["emp_no"].ToString();
            //    objPayroll.updatedata(strUpdQry);
            //}
            if (strOpt.Equals("Punch In"))
            {
                
                int intPiExist = Convert.ToInt32(objPayroll.GetScalar("select count(*) from AttendanceMaster where EmpID=" + Session["emp_no"].ToString() + ""));
                if (intPiExist > 0)
                {
                    lblMessage.Text = "You have already done punch in today.";
                    return;
                }
                string strMaxNoQry = "select isnull(max(AttID),0) from AttendanceMaster";
                object objMaxNo = objPayroll.GetScalar(strMaxNoQry);
                string InTime = System.DateTime.Now.TimeOfDay.ToString().Substring(0, System.DateTime.Now.TimeOfDay.ToString().IndexOf("."));

                int intInTime = Convert.ToInt16(System.DateTime.Now.ToString("HH")) + Convert.ToInt16(System.DateTime.Now.ToString("mm"));

                if (intInTime > 12)
                    decLeaveDesc = 0.5M;
                else
                    decLeaveDesc = 0;

                string strInsQry = "insert into AttendanceMaster(AttID,EmpID,AttendDate,InTime,AttStatus,LeaveDesc) values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + "," + Session["emp_no"].ToString() + ",'" + System.DateTime.Now.Date + "','" + InTime + "','Punch In'," + decLeaveDesc + ")";
                objPayroll.insertdata(strInsQry);
                lblMessage.Text = "User Punch In Successful.";
                txtUsername.Text = "";
            }
            else
            {
                int intPiExist = Convert.ToInt32(objPayroll.GetScalar("select count(*) from AttendanceMaster where EmpID=" + Session["emp_no"].ToString() + " and AttendDate ='" + System.DateTime.Now.Date.ToString("dd/MMM/yyyy") + "'"));
                if (intPiExist <= 0)
                {
                    
                    lblMessage.Text = "You have not done punch in today.";
                    return;
                }
                string OutTime = System.DateTime.Now.TimeOfDay.ToString().Substring(0, System.DateTime.Now.TimeOfDay.ToString().IndexOf("."));

                string strQryLeavStatus = "select LeaveDesc from AttendanceMaster where EmpID=" + Session["emp_no"].ToString() + " and AttendDate ='" + System.DateTime.Now.Date + "'";
                decimal decPrevStatus = Convert.ToDecimal(objPayroll.GetScalar(strQryLeavStatus));
                if (decPrevStatus == 0.5M)
                {
                    decLeaveDesc = 0.5M;
                }
                else
                {
                    int intOutTime = Convert.ToInt16(System.DateTime.Now.ToString("HH"));
                    if (intOutTime < 18)
                        decLeaveDesc = 0.5M;//Convert.ToDecimal(0.5);
                    else
                        decLeaveDesc = 0;
                }
                //string OutTime = System.DateTime.Now.TimeOfDay.ToString().Substring(0, System.DateTime.Now.TimeOfDay.ToString().IndexOf("."));

                string strUpdQry = "update AttendanceMaster set OutTime = '" + OutTime + "', AttStatus = 'Punch Out', LeaveDesc = " + decLeaveDesc + " where EmpID = " + Session["emp_no"].ToString() + " and AttendDate = '" + System.DateTime.Now.Date + "'";
                objPayroll.updatedata(strUpdQry);
                lblMessage.Text = "User Punch Out Successful.";
                txtUsername.Text = "";
            }
        }
        else
        {
            lblMessage.Text = "Select Either Option.";
            return;
        }
        //ChangeStatus();
    }
    }
}