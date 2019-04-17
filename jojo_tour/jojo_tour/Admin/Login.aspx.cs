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

    }

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        string StrConn = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        using (SqlConnection ObjConn = new SqlConnection(StrConn))
        {
            ObjConn.Open();
            using (SqlCommand ObjCM = new SqlCommand())
            {
                ObjCM.Connection = ObjConn;
                ObjCM.CommandText = "SELECT * FROM admin where username = @username AND password = @password";
                ObjCM.Parameters.AddWithValue("@username", TextBoxUsername.Text);
                ObjCM.Parameters.AddWithValue("@password", TextBoxPassword.Text);
                SqlDataReader ObjDR = ObjCM.ExecuteReader();
                ObjDR.Read();
                if (ObjDR.HasRows)
                {
                    Session["AdminId"] = ObjDR["username"].ToString();

                }
                ObjDR.Close();
            }
            ObjConn.Close();
        }

        if (Session["AdminId"] != null)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "swal('Login Success!','ล็อกอินสำเร็จ','success')", true);
            Response.Redirect("~/Admin/Home.aspx");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "swal('Login Fail!','ล็อกอินไม่สำเร็จ','error')", true);
        }
    }
}