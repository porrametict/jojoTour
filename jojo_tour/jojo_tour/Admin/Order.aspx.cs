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
        BindListView();
    }

    protected void BindListView()
    {
        string query = "SELECT bt.book_code AS book_code , CONCAT(bt.c_firstname , ' ', bt.c_lastname)  AS b_code, bt.travel_datetime AS t_time  ,tt.th_name AS type_name, book_status.th_name  FROM book_tour AS bt INNER JOIN tour AS t ON bt.tour_code = t.tour_code INNER JOIN type_tour AS tt ON tt.id = t.type_tour_id INNER JOIN book_status_history bsh ON bt.book_code = bsh.book_code INNER JOIN book_status ON bsh.status_id = book_status.id where bsh.created_at in (select max(created_at) from book_status_history group by book_code)";

        /// keyword Search
        string SearchKeyWord = TextBoxSearch.Text;
        if (SearchKeyWord != "")
        {
            query += " and ( bt.c_firstname like '%" + SearchKeyWord + "%'";
            query += " or bt.c_lastname like '%" + SearchKeyWord + "%' ";
            query += " or bt.book_code like '%" + SearchKeyWord + "%' )";
        }

        /// type Filter

        string typeFilter = "";

        foreach (ListItem type in CheckBoxListStatus.Items)
        {
            if (type.Selected)
            {
                if (typeFilter.Length == 0)
                {
                    typeFilter += type.Value;

                }
                else
                {
                    typeFilter += "," + type.Value;

                }
            }

        }
        string prefixType = " where ";
        if (query.IndexOf("where") > -1)
        {
            prefixType = " and ";
        }
        if (typeFilter.Length != 0)
        {
            query += prefixType + " bsh.status_id in (" + typeFilter + ")";
        }


        


        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConnectString);
        SqlDataAdapter sda = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();

        sda.Fill(dt);

        GridViewOrder.DataSource = dt;
        GridViewOrder.DataBind();
    }

    protected void CheckBoxListType_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindListView();
    }


}