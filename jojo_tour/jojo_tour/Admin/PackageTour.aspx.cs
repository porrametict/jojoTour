using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView();
        }

    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

        if (e.CommandName == "view_btn")
        {

            Response.Redirect("PackageTourView.aspx?id=" + e.CommandArgument);
        }
    }
    protected void BindListView() {
        string query = "select  tl.tour_code id ,tl.location_id location_id,t.th_name t_th_name,t.en_name t_en_name, l.province_id province, l.type_location_id type_location ,ml.image img  from tour_location tl ";
        query += " inner join location l on l.id = tl.location_id";
        query += " inner join tour t on t.tour_code = tl.tour_code ";
        query += " left join image_location ml on ml.location_id = tl.location_id  ";
        query += " where t.type_tour_id = 1 ";

        /// keyword Search
        string SearchKeyWord = TextBoxSearch.Text;
        if (SearchKeyWord != "")
        {
            query += " and ( t.th_name like '%" + SearchKeyWord + "%'";
            query += " or t.en_name like '%" + SearchKeyWord + "%' )";
        }

        /// type Filter

        string typeFilter = "";

        foreach (ListItem type in CheckBoxListType.Items)
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
            query += prefixType + " l.type_location_id in (" + typeFilter + ")";
        }


        //province Filter


        string ProvinceFilter = "";

        foreach (ListItem province in CheckBoxListProvince.Items)
        {
            if (province.Selected)
            {
                if (ProvinceFilter.Length == 0)
                {
                    ProvinceFilter += province.Value;

                }
                else
                {
                    ProvinceFilter += "," + province.Value;

                }
            }

        }
        string prefixProvince = " where ";
        if (query.IndexOf("where") > -1)
        {
            prefixProvince = " and ";
        }
        if (ProvinceFilter.Length != 0)
        {
            query += prefixProvince + " l.province_id in (" + ProvinceFilter + ")";
        }

        System.Diagnostics.Debug.WriteLine("query"+ query);




        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConnectString);
        SqlDataAdapter sda = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();

        sda.Fill(dt);

        System.Diagnostics.Debug.WriteLine("start" + dt.Rows.Count);
        string Ids = "";

        for (int i = dt.Rows.Count - 1; i >= 0; i--)
        {
            DataRow dr = dt.Rows[i];
            string catid = dr["id"].ToString();
            if (Ids.Contains(catid))
            {
                dr.Delete();
            }
            else
            {
                Ids += catid;
            }
        }
        dt.AcceptChanges();
        System.Diagnostics.Debug.WriteLine("end");

        ListView1.DataSource = dt;
        ListView1.DataBind();
    }
   
    protected void ListView1_PagePropertiesChanged(object sender, EventArgs e)
    {
        BindListView();

    }

    protected void TextBoxSearch_TextChanged(object sender, EventArgs e)
    {
        BindListView();

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindListView();

    }

    protected void CheckBoxListType_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindListView();

    }

    protected void CheckBoxListProvince_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindListView();
    }
}