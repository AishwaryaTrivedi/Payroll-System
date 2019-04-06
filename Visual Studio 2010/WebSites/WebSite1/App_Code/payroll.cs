using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.IO;
using System.Windows.Forms;


/// <summary>
/// Summary description for payroll
/// </summary>
public class payroll
{
    public SqlCommand cmd;
    public SqlConnection con;
    public SqlConnectionStringBuilder da;
    public SqlDataAdapter daa;
    public DataSet ds;
    
	public payroll()
	{
        con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["strDBConn"].ConnectionString);
        //con.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=E:\project\E-payroll\App_Data\payroll.mdf;Integrated Security=True;User Instance=True";
       // if (con.State == ConnectionState.Closed)
            con.Open();
	}
    
    public void opencon()
    {
        con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["strDBConn"].ConnectionString;
        //con.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=E:\project\E-payroll\App_Data\payroll.mdf;Integrated Security=True;User Instance=True";
        if (con.State == ConnectionState.Closed)
            con.Open();
    }
    
    public void closecon()
    {
        if (con.State == ConnectionState.Open)
            con.Close();
    }
    
    public int insertdata(string str)
    {
        int retValue = 0;
        opencon();
        cmd = new SqlCommand();
        cmd.CommandText = str;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        retValue = cmd.ExecuteNonQuery();
        //MessageBox.Show("Record Inserted Successfully.");
        closecon();
        return retValue;
    }

    public int updatedata(string str)
    {
        int retValue = 0;
        opencon();
        cmd = new SqlCommand();
        cmd.CommandText = str;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        retValue = cmd.ExecuteNonQuery();
        //MessageBox.Show("Record Updated Successfully.");
        closecon();
        return retValue;
    }

    public int deleteddata(string str)
    {
        int retValue = 0;
        opencon();
        cmd = new SqlCommand();
        cmd.CommandText = str;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        retValue = cmd.ExecuteNonQuery();
        //MessageBox.Show("Record Deleted Successfully.");
        closecon();
        return retValue;
    }

    public object GetScalar(string strQry)
    {
        object retValue = null;
        opencon();
        cmd = new SqlCommand();
        cmd.CommandText = strQry;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        retValue = cmd.ExecuteScalar();
        closecon();
        return retValue;
    }

    public SqlDataReader GetDataReader(string strQry)
    {
        opencon();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = strQry;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        SqlDataReader dr = cmd.ExecuteReader();
        closecon();
        return dr;
    }

    public DataSet GetDataset(string strQry)
    {
        opencon();
        SqlDataAdapter da = new SqlDataAdapter(strQry, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        closecon();
        return ds;
    }

    public int GetNumberOfSundays(DateTime StartDate, DateTime EndDate)
    {

        //DateTime StartDate = Convert.ToDateTime(Month.ToString() + "/01/" + Year.ToString());
        //Int32 iDays = DateTime.DaysInMonth(Year, Month);
        //DateTime EndDate = StartDate.AddDays(iDays - 1);
        Int32 Count = 0;
        Int32 SundayCount = 0;
        while (StartDate.DayOfWeek != DayOfWeek.Sunday)
        {
            StartDate = StartDate.AddDays(1);
        }
        SundayCount = 1;
        StartDate = StartDate.AddDays(7);
        while (StartDate <= EndDate)
        {
            SundayCount += 1; StartDate = StartDate.AddDays(7);
        }
        return SundayCount;
    }

    //public int GetNumberOfSundays(Int32 Year, Int32 Month)
    //{

    //    DateTime StartDate = Convert.ToDateTime(Month.ToString() + "/01/" + Year.ToString());
    //    Int32 iDays = DateTime.DaysInMonth(Year, Month);
    //    DateTime EndDate = StartDate.AddDays(iDays - 1);
    //    Int32 Count = 0;
    //    Int32 SundayCount = 0;
    //    while (StartDate.DayOfWeek != DayOfWeek.Sunday)
    //    {
    //        StartDate = StartDate.AddDays(1);
    //    }
    //    SundayCount = 1;
    //    StartDate = StartDate.AddDays(7);
    //    while (StartDate <= EndDate)
    //    {
    //        SundayCount += 1; StartDate = StartDate.AddDays(7);
    //    }
    //    return SundayCount;
    //}

    public int GetMonthNumber(string MonthName)
    {
        int MonthNo = 0;
        switch (MonthName)
        {
            case "January":
                MonthNo = 1;
                break;
            case "February":
                MonthNo = 2;
                break;
            case "March":
                MonthNo = 3;
                break;
            case "April":
                MonthNo = 4;
                break;
            case "May":
                MonthNo = 5;
                break;
            case "June":
                MonthNo = 6;
                break;
            case "July":
                MonthNo = 7;
                break;
            case "August":
                MonthNo = 8;
                break;
            case "September":
                MonthNo = 9;
                break;
            case "October":
                MonthNo = 10;
                break;
            case "November":
                MonthNo = 11;
                break;
            case "December":
                MonthNo = 12;
                break;
        }
        return MonthNo;
    }

    public string GetMonthName(int MonthNumber)
    {
        string MonthName = "";
        switch (MonthNumber)
        {
            case 1:
                MonthName = "January";
                break;
            case 2:
                MonthName = "February";
                break;
            case 3:
                MonthName = "March";
                break;
            case 4:
                MonthName = "April";
                break;
            case 5:
                MonthName = "May";
                break;
            case 6:
                MonthName = "June";
                break;
            case 7:
                MonthName = "July";
                break;
            case 8:
                MonthName = "August";
                break;
            case 9:
                MonthName = "September";
                break;
            case 10:
                MonthName = "October";
                break;
            case 11:
                MonthName = "November";
                break;
            case 12:
                MonthName = "December";
                break;
        }
        return MonthName;
    }
    public object scalar(string str)
    {
        cmd = new SqlCommand(str, con);
        object result = cmd.ExecuteScalar();
        return result;
    }
    public DataSet selectall(string str)
    {
        daa = new SqlDataAdapter(str, con);
        ds = new DataSet();
        daa.Fill(ds);
        return ds;
    }

}
