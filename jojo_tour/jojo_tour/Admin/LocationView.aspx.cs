using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_PackageTour : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddLocation.aspx?id=" + Request.QueryString["id"]);
    }

    protected void ButtonDel_Click(object sender, EventArgs e)
    {
        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        using (SqlConnection ConObj = new SqlConnection(ConnectString))
        {
            ConObj.Open();
            String SQL = "DELETE FROM location WHERE id = @id";
            using (SqlCommand CmObj = new SqlCommand())
            {
                CmObj.CommandText = SQL;
                CmObj.Connection = ConObj;
                CmObj.Parameters.AddWithValue("@id", Request.QueryString["id"]);

                if (CmObj.ExecuteNonQuery() > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "swal('Good job!','ลบสำเร็จเเล้ว','success')", true);
                    Response.Redirect("PlaceAndHotel.aspx");
                }
                else
                {

                }
            }
            ConObj.Close();
        }


    }
}