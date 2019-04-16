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
        string type; 

        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        using (SqlConnection ConObj = new SqlConnection(ConnectString))
        {
            ConObj.Open();
            String SQL = "SELECT type_location_id  FROM location WHERE id = @id";
            using (SqlCommand CmObj = new SqlCommand())
            {
                CmObj.CommandText = SQL;
                CmObj.Connection = ConObj;
                CmObj.Parameters.AddWithValue("@id", Request.QueryString["id"]);
                SqlDataReader ObjDR = CmObj.ExecuteReader();
                ObjDR.Read();
              
                type = ObjDR["type_location_id"].ToString();

                ObjDR.Close();
                
            }
            ConObj.Close();

         

        }

        if (type != "7")
        {
            Session["placeSelected"] = (string)Session["placeSelected"] + " " + Request.QueryString["id"];

        }
        else
        {
            Session["hotelSelected"] = (string)Session["hotelSelected"] + " " + Request.QueryString["id"];

        }




        Response.Redirect("PlanTour.aspx");
    }

   
}