using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        if (!IsPostBack)
        {
            if (id != null)
            {
                TextBox.Text = id;
            }

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("TourTracking.aspx?id=" + TextBox.Text);

    }

    protected void ButtonSave_Click(object sender, EventArgs e)
    {
        string SQL = "UPDATE book_tour SET payment_slip = @image where book_code = @id ";

        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        using (SqlConnection ConObj = new SqlConnection(ConnectString))
        {
            ConObj.Open();

            string dir_path = Server.MapPath("~/DataStorage/PaymentImg/");
            if (!Directory.Exists(dir_path))
            {
                Directory.CreateDirectory(dir_path);

            }

            if (FileUpload1.HasFile)
            {
                string Ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
                string Newname = Guid.NewGuid().ToString();
                string cNewname = string.Format("{0}{1}", Newname, Ext);
                string Path = string.Format("~/DataStorage/PaymentImg/{0}", cNewname);
                string cPath = Server.MapPath(Path);

                FileUpload1.SaveAs(cPath);

                saveStatusId(Request.QueryString["id"],"4");

                using (SqlCommand CmObj2 = new SqlCommand())
                {
                    CmObj2.CommandText = SQL;
                    CmObj2.Connection = ConObj;
                    CmObj2.Parameters.AddWithValue("@id", Request.QueryString["id"]);
                    CmObj2.Parameters.AddWithValue("@image", "/DataStorage/PaymentImg/" + cNewname);
                    if (CmObj2.ExecuteNonQuery() > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "swal('Good job!','อัพเดทภาพสำเร็จ','success')", true);
                    }
                    else
                    {

                    }
                }
            }
            ConObj.Close();
        }
    }

    private void saveStatusId(string book_code, string status_id)
    {
        string SqlCode = "INSERT INTO book_status_history(book_code, status_id) VALUES(@book_code, @status_id)";

        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        using (SqlConnection ConObj = new SqlConnection(ConnectString))
        {
            ConObj.Open();
            using (SqlCommand CmObj = new SqlCommand())
            {

                CmObj.CommandText = SqlCode;
                CmObj.Connection = ConObj;
                CmObj.Parameters.AddWithValue("@book_code", book_code);
                CmObj.Parameters.AddWithValue("@status_id", status_id);


                CmObj.ExecuteNonQuery();
            }
            ConObj.Close();



        }
    }


}