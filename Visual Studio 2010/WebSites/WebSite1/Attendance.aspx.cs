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

public partial class Attendance : System.Web.UI.Page
{
    payroll objPayroll = new payroll();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    decimal decLeaveDesc;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        //if (!string.IsNullOrEmpty(Session["emp_no"].ToString()))
        //{
        //    ChangeStatus();
        //}
    }

    private void ChangeStatus()
    {
        //string strQry = "select emp_attend from emp_mst where emp_no=" + Session["emp_no"].ToString();
        //string AttendStatus = objPayroll.GetScalar(strQry).ToString();
        //switch (AttendStatus)
        //{
        //    case "Punch In":
        //        lbtnemp_attend.Text = "Punch Out";
        //        break;
        //    case "Punch Out":
        //        lbtnemp_attend.Text = "Punch In";
        //        break;
        //}
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

             string strOpt = (rbPunchIn.Checked) ? rbPunchIn.Text : rbPunchOut.Text;
             
            if (strOpt.Equals("PunchIn"))
            {
                
                string strMaxNoQry = "select isnull(max(AttID),0) from AttendanceMaster";
                object objMaxNo = objPayroll.GetScalar(strMaxNoQry);
                string InTime = System.DateTime.Now.TimeOfDay.ToString().Substring(0, System.DateTime.Now.TimeOfDay.ToString().IndexOf("."));

                int intInTime = Convert.ToInt16(System.DateTime.Now.ToString("HH")) + Convert.ToInt16(System.DateTime.Now.ToString("mm"));

                decLeaveDesc = 1;

                string strInsQry = "insert into AttendanceMaster(AttID,EmpID,AttendDate,InTime,AttStatus,LeaveDesc) values(" + (Convert.ToInt32(objMaxNo) + 1).ToString() + "," + Session["emp_no"].ToString() + ",'" + System.DateTime.Now.Date + "','" + InTime + "','Punch In'," + decLeaveDesc + ")";
                objPayroll.insertdata(strInsQry);
                lblMessage.Text = "User Punch In Successful.";
                txtUsername.Text = "";
            }
            else if (strOpt.Equals("Punch Out"))
             {
                 string OutTime = System.DateTime.Now.TimeOfDay.ToString().Substring(0, System.DateTime.Now.TimeOfDay.ToString().IndexOf("."));

                string strQryLeavStatus = "select LeaveDesc from AttendanceMaster where EmpID=" + Session["emp_no"].ToString() + " and AttendDate ='" + System.DateTime.Now.Date + "'";
                decimal decPrevStatus = Convert.ToDecimal(objPayroll.GetScalar(strQryLeavStatus));
                decLeaveDesc = 1;
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
