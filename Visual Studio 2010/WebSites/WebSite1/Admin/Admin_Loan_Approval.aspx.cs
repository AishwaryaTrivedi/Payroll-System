﻿using System;
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

public partial class Admin_Loan_Approval : System.Web.UI.Page
{
    payroll objPayroll = new payroll();
    String strdlstchk;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            lblMessage.Text = "";
    }
   
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        strdlstchk = "Accept";
        
    }
    protected void btnReject_Click(object sender, EventArgs e)
    {
        strdlstchk = "Reject";
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        long lngEmpNo = Convert.ToInt64(((Label)e.Item.FindControl("lblemp_id")).Text);
        switch (strdlstchk)
        {
            case "Accept":
                try
                {
                    string strQry = "Update loan_request set loan_req_status='Accept' where [loan_req_id]=" + lngEmpNo.ToString();
                    if (objPayroll.updatedata(strQry) > 0)
                    {
                        sdsLoanList.DataBind();
                        DataList1.DataBind();
                        Response.Redirect("Admin_Loan_Detail.aspx");
                    }
                }
                catch
                {
                }
                break;
            case "Reject":
                try {
                string strQry = "Update loan_request set loan_req_status='Reject' where [loan_req_id]=" + lngEmpNo.ToString();
                if (objPayroll.updatedata(strQry) > 0)
                {
                    sdsLoanList.DataBind();
                    DataList1.DataBind();
                }
                } catch { }
                break;
        }
    }
}