using System;
using System.Collections.Generic;
using System.Data;
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
        string query = "SELECT lo.id as id,lo.th_name lo_th_name,lo.en_name lo_en_name,pic.image img,p.en_name p_en_name,p.th_name p_th_name FROM location lo";
        query += " left join image_location pic on lo.id = pic.location_id and pic.id in (select min(id) from image_location Group by location_id)  ";
        query += " left join province p on lo.province_id = p.id ";

        /// keyword Search
        string SearchKeyWord = TextBoxSearch.Text;
        if (SearchKeyWord != "")
        {
            query += " where th_name like '%" + SearchKeyWord + "%'";
            query += " or en_name like '%" + SearchKeyWord + "%'";
        }

        //System.Diagnostics.Debug.WriteLine(query); //console.log



        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConnectString);
        SqlDataAdapter sda = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();

        //System.Diagnostics.Debug.WriteLine(sda); //console.log

        sda.Fill(dt);

        ListView1.DataSource = dt;

        ListView1.DataBind();
    }


#pragma warning disable CS0628 // New protected member declared in sealed class
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    #pragma warning restore CS0628 // New protected member declared in sealed class
    {

    }
}