using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ForgotPassWord : System.Web.UI.Page
{
    payroll obj = new payroll();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblmsg.Visible = false;
    }
    protected void SubmitBtn_Click(object sender, EventArgs e)
    {
        int flag = 0;
       
        obj.ds = obj.selectall("select * from emp_mst");
        foreach (DataRow temp in obj.ds.Tables[0].Rows)
        {
            string tem=null;
            if (string.Compare(temp["emp_username"].ToString(), txtUserName.Text) == 0)
            {
                if (string.Compare(temp["question"].ToString(), DropDownList1.Text) == 0)
                {
                    if (string.Compare(temp["answer"].ToString(), txtAnswer.Text) == 0)
                    {
                        flag = 1;
                        lblmsg.Visible = true;
                     //   lblmsg.Text = "Your PassWord is" + temp["emp_password"].ToString();

                        foreach (char enc in temp["emp_password"].ToString())
                        {
                            tem = tem + Convert.ToChar(enc - 2);
                        }
                        lblmsg.Text = "Your PassWord is" + tem.ToString();

                    }
                }

            }

        }
        if (flag == 0)
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Invalid Info...";
        }
    }
}
