using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LabelUname.Text = (string)Session["AdminId"];
        Session.RemoveAll();
    }

    protected void ButtonLogin_Click(object sender, EventArgs e)
    { }
}