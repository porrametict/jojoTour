﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PlaceAndHotel : Page
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
            query += " where ( lo.th_name like '%" + SearchKeyWord + "%'";
            query += " or lo.en_name like '%" + SearchKeyWord + "%' )";
        }

        /// type Filter

        string typeFilter = "";

        foreach (ListItem type in CheckBoxListType.Items)
        {
            if (type.Selected)
            {
                if (typeFilter.Length == 0)
                {
                    typeFilter +=  type.Value;

                }
                else
                {
                    typeFilter += "," + type.Value;

                }
            }

        }
        string prefixType= " where ";
        if (query.IndexOf("where") > -1)
        {
            prefixType = " and ";
        }
        if (typeFilter.Length != 0)
        {   
            query += prefixType + " type_location_id in (" + typeFilter + ")";
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
            query += prefixProvince + " province_id in (" + ProvinceFilter + ")";
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


    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "view_btn") {
            System.Diagnostics.Debug.WriteLine("if"); //console.log

            Response.Redirect("LocationView.aspx?id=" + e.CommandArgument);
        }
        Response.Redirect("LocationViewDetail.aspx?id=" + e.CommandArgument);
        System.Diagnostics.Debug.WriteLine("in"); //console.log


    }
}