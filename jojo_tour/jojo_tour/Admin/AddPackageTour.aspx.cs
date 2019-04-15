using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_PackageTour : System.Web.UI.Page
{
    int CreatedId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadHotel();
        LoadPlace();
        LoadSelectedHotel();
        LoadSelectedPlace();
        if (!IsPostBack)
        {
            Session.Clear();

            if (Request.QueryString["id"] != null)
            {
                GetData(Request.QueryString["id"].ToString());
            }
        }

    }

    public void LoadPlace()
    {

        string query = "SELECT lo.id as id,lo.th_name lo_th_name,lo.en_name lo_en_name,pic.image img,p.en_name p_en_name,p.th_name p_th_name FROM location lo";
        query += " left join image_location pic on lo.id = pic.location_id and pic.id in (select min(id) from image_location Group by location_id)  ";
        query += " left join province p on lo.province_id = p.id ";

        query += "where type_location_id in (select id from type_location where en_name != 'Hotel' )";

        /// keyword Search
        string SearchKeyWord = TextBoxPalce.Text;
        if (SearchKeyWord != "")
        {
            query += " and( lo.th_name like '%" + SearchKeyWord + "%'";
            query += " or lo.en_name like '%" + SearchKeyWord + "%' )";
        }

        System.Diagnostics.Debug.WriteLine(query); //console.log



        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConnectString);
        SqlDataAdapter sda = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();

        System.Diagnostics.Debug.WriteLine(sda); //console.log

        sda.Fill(dt);

        ListViewPlace.DataSource = dt;

        ListViewPlace.DataBind();


    }

    public void LoadHotel()
    {

        string query = "SELECT lo.id as id,lo.th_name lo_th_name,lo.en_name lo_en_name,pic.image img,p.en_name p_en_name,p.th_name p_th_name FROM location lo";
        query += " left join image_location pic on lo.id = pic.location_id and pic.id in (select min(id) from image_location Group by location_id)  ";
        query += " left join province p on lo.province_id = p.id ";

        query += "where type_location_id = (select id from type_location where en_name = 'Hotel' )";

        /// keyword Search
        string SearchKeyWord = TextBoxHotel.Text;
        if (SearchKeyWord != "")
        {
            query += " and ( lo.th_name like '%" + SearchKeyWord + "%'";
            query += " or lo.en_name like '%" + SearchKeyWord + "%' )";
        }
        System.Diagnostics.Debug.WriteLine(SearchKeyWord + 555); //console.log




        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConnectString);
        SqlDataAdapter sda = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();

        //System.Diagnostics.Debug.WriteLine(sda); //console.log

        sda.Fill(dt);

        ListViewHotel.DataSource = dt;

        ListViewHotel.DataBind();


    }

    public void LoadSelectedPlace()
    {
        string IdsSession = (string)Session["placeSelected"];

        StringBuilder Ids = new StringBuilder(IdsSession);

        for (int index = 1; index < Ids.Length; index++)
        {
            if (Char.IsWhiteSpace(Ids[index]))
            {
                Ids[index] = ',';
                IdsSession = Ids.ToString();
            }
        }
        Console.WriteLine(Ids + " " + IdsSession);

        string query = "SELECT lo.id as id,lo.th_name lo_th_name,lo.en_name lo_en_name,pic.image img,p.en_name p_en_name,p.th_name p_th_name FROM location lo";
        query += " left join image_location pic on lo.id = pic.location_id and pic.id in (select min(id) from image_location Group by location_id)  ";
        query += " left join province p on lo.province_id = p.id ";

        if (Ids.Length > 0)
        {
            query += " where lo.id in (" + Ids + ")";

        }
        else
        {
            query += " where lo.id in (0)";
        }

        System.Diagnostics.Debug.WriteLine(query); //console.log


        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConnectString);
        SqlDataAdapter sda = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();

        //System.Diagnostics.Debug.WriteLine(sda); //console.log

        sda.Fill(dt);
        ListViewPlaceSelected.DataSource = dt;
        ListViewPlaceSelected.DataBind();

    }

    public void LoadSelectedHotel()
    {
        string IdsSession = (string)Session["hotelSelected"];

        StringBuilder Ids = new StringBuilder(IdsSession);

        for (int index = 1; index < Ids.Length; index++)
        {
            if (Char.IsWhiteSpace(Ids[index]))
            {
                Ids[index] = ',';
                IdsSession = Ids.ToString();
            }
        }
        Console.WriteLine(Ids + " " + IdsSession);

        string query = "SELECT lo.id as id,lo.th_name lo_th_name,lo.en_name lo_en_name,pic.image img,p.en_name p_en_name,p.th_name p_th_name FROM location lo";
        query += " left join image_location pic on lo.id = pic.location_id and pic.id in (select min(id) from image_location Group by location_id)  ";
        query += " left join province p on lo.province_id = p.id ";

        if (Ids.Length > 0)
        {
            query += " where lo.id in (" + Ids + ")";

        }
        else
        {
            query += " where lo.id in (0)";
        }

        System.Diagnostics.Debug.WriteLine(query); //console.log


        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConnectString);
        SqlDataAdapter sda = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();

        //System.Diagnostics.Debug.WriteLine(sda); //console.log

        sda.Fill(dt);

        ListViewHotelSelected.DataSource = dt;

        ListViewHotelSelected.DataBind();



    }

    protected void ListViewHotel_ItemCommand(object sender, ListViewCommandEventArgs e)
    {




        if (e.CommandName == "add_hotel")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);

            Session["hotelSelected"] = (string)Session["hotelSelected"] + " " + e.CommandArgument.ToString();

            System.Diagnostics.Debug.WriteLine("add" + (string)Session["hotelSelected"]);
            LoadSelectedHotel();



        }



    }

    protected void ListViewPlace_ItemCommand(object sender, ListViewCommandEventArgs e)
    {




        if (e.CommandName == "add_place")
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showPModal();", true);

            Session["placeSelected"] = (string)Session["placeSelected"] + " " + e.CommandArgument.ToString();

            System.Diagnostics.Debug.WriteLine("add" + (string)Session["placeSelected"]);
            LoadSelectedPlace();



        }



    }

    protected void ListViewHotelSelected_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "remove_hotel")
        {
            string removeVal = e.CommandArgument.ToString();
            string IdsSession = (string)Session["hotelSelected"];

            StringBuilder Ids = new StringBuilder(IdsSession);
            Ids.Replace(" " + removeVal, "");
            IdsSession = Ids.ToString();
            Session["hotelSelected"] = IdsSession;

            //Session["hotelSelected"] = (string)Session["hotelSelected"] + " " + e.CommandArgument.ToString();
            System.Diagnostics.Debug.WriteLine("After " + Ids);

            System.Diagnostics.Debug.WriteLine("remove" + (string)Session["hotelSelected"]);

            LoadSelectedHotel();


        }
    }

    protected void ListViewPlaceSelected_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "remove_place")
        {
            string removeVal = e.CommandArgument.ToString();
            string IdsSession = (string)Session["placeSelected"];

            StringBuilder Ids = new StringBuilder(IdsSession);
            Ids.Replace(" " + removeVal, "");
            IdsSession = Ids.ToString();
            Session["placeSelected"] = IdsSession;

            //Session["hotelSelected"] = (string)Session["hotelSelected"] + " " + e.CommandArgument.ToString();
            System.Diagnostics.Debug.WriteLine("After " + Ids);

            System.Diagnostics.Debug.WriteLine("remove" + (string)Session["placeSelected"]);

            LoadSelectedPlace();

        }
    }

    protected void ButtonSave_Click(object sender, EventArgs e)

    {
        string th_name = TextBoxTHname.Text;
        string en_name = TextBoxENname.Text;

        errorEnName.Visible = false;
        errorThName.Visible = false;


        if (String.IsNullOrEmpty(en_name) || String.IsNullOrEmpty(th_name))
        {


            if (String.IsNullOrEmpty(en_name))
            {
                System.Diagnostics.Debug.WriteLine("EN");
                errorEnName.Visible = true;

            }
            if (String.IsNullOrEmpty(th_name))
            {
                System.Diagnostics.Debug.WriteLine("EN");
                errorThName.Visible = true;
            }

            return;



        }

        System.Diagnostics.Debug.WriteLine("Save");

        if (Request.QueryString["id"] != null)
        {
            SaveEditTour();
        }
        else
        {
            SaveTour();
          
        }

        SaveHotelSelect();
        SavePalceSelect();



        System.Diagnostics.Debug.WriteLine("Saved");

        //Session.Clear();

        LoadSelectedHotel();
        LoadSelectedPlace();

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "swal('Good job!','บันทึกสำเร็จเเล้ว','success')", true);


    }

    protected void SaveTour()
    {


        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        using (SqlConnection ConObj = new SqlConnection(ConnectString))
        {
            ConObj.Open();
            String SQL = "INSERT INTO tour(en_name,th_name,en_detail,th_detail,price,type_tour_id) output INSERTED.tour_code VALUES (@en_name,@th_name,@en_detail,@th_detail,@price,@type_tour_id)";
            using (SqlCommand CmObj = new SqlCommand())
            {
                CmObj.CommandText = SQL;
                CmObj.Connection = ConObj;
                CmObj.Parameters.AddWithValue("@en_name", TextBoxENname.Text);
                CmObj.Parameters.AddWithValue("@th_name", TextBoxTHname.Text);
                CmObj.Parameters.AddWithValue("@en_detail", TextBoxENdetail.Text);
                CmObj.Parameters.AddWithValue("@th_detail", TextBoxTHdetail.Text);
                CmObj.Parameters.AddWithValue("@price", TextBoxPrice.Text);
                CmObj.Parameters.AddWithValue("@type_tour_id", "1");

                CreatedId = (int)CmObj.ExecuteScalar();

                if (CreatedId != 0)
                {

                }
                else
                {

                }


            }
            ConObj.Close();
        }
    }

    protected void SaveEditTour()
    {


        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        using (SqlConnection ConObj = new SqlConnection(ConnectString))
        {
            ConObj.Open();
            String SQL = "UPDATE tour SET en_name=@en_name,th_name=@th_name,en_detail=@en_detail,th_detail=@th_detail,price=@price,type_tour_id=@type_tour_id";
            using (SqlCommand CmObj = new SqlCommand())
            {
                CmObj.CommandText = SQL;
                CmObj.Connection = ConObj;
                CmObj.Parameters.AddWithValue("@en_name", TextBoxENname.Text);
                CmObj.Parameters.AddWithValue("@th_name", TextBoxTHname.Text);
                CmObj.Parameters.AddWithValue("@en_detail", TextBoxENdetail.Text);
                CmObj.Parameters.AddWithValue("@th_detail", TextBoxTHdetail.Text);
                CmObj.Parameters.AddWithValue("@price", TextBoxPrice.Text);
                CmObj.Parameters.AddWithValue("@type_tour_id", "1");

                if (CmObj.ExecuteNonQuery() != 0) {

                };

            }
            ConObj.Close();

            DelOldTourLocation();

        }
    }

    protected void DelOldTourLocation()
    {
        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        using (SqlConnection ConObj = new SqlConnection(ConnectString))
        {
            ConObj.Open();
            String SQL = "DELETE FROM tour_location WHERE tour_code = @id";
            using (SqlCommand CmObj = new SqlCommand())
            {
                CmObj.CommandText = SQL;
                CmObj.Connection = ConObj;
                CmObj.Parameters.AddWithValue("@id", Request.QueryString["id"]);

                if (CmObj.ExecuteNonQuery() != 0)
                {

                };
            }
            ConObj.Close();
        }
    }
    protected void SaveHotelSelect()
    {
        foreach (ListViewDataItem item in ListViewHotelSelected.Items)
        {
            HiddenField HotelPK = (HiddenField)item.FindControl("HiddenFieldHotelId");
            string Hpk = HotelPK.Value;
            TextBox dateOfTour = (TextBox)item.FindControl("TextBoxDate");
            string DOT = dateOfTour.Text;
            System.Diagnostics.Debug.WriteLine("HPK = " + Hpk + " DOT = " + DOT);

            string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
            using (SqlConnection ConObj = new SqlConnection(ConnectString))
            {
                ConObj.Open();
                String SQL = "INSERT INTO tour_location(tour_code,location_id,date_of_tour) VALUES (@tour_code,@location_id,@date_of_tour)";
                using (SqlCommand CmObj = new SqlCommand())
                {
                    CmObj.CommandText = SQL;
                    CmObj.Connection = ConObj;
                    if (Request.QueryString["id"] != null)
                    {
                        CmObj.Parameters.AddWithValue("@tour_code", Request.QueryString["id"].ToString());

                    }
                    else
                    {
                        CmObj.Parameters.AddWithValue("@tour_code", CreatedId);

                    }
                    CmObj.Parameters.AddWithValue("@location_id", Hpk);
                    CmObj.Parameters.AddWithValue("@date_of_tour", DOT);

                    if (CmObj.ExecuteNonQuery() > 0)
                    {
                        //System.Diagnostics.Debug.WriteLine(CreatedId);
                    }

                }
                ConObj.Close();
            }

        }
    }

    protected void SavePalceSelect()
    {
        foreach (ListViewDataItem item in ListViewPlaceSelected.Items)
        {
            HiddenField PlacePK = (HiddenField)item.FindControl("HiddenFieldPlaceId");
            string Ppk = PlacePK.Value;
            TextBox dateOfTour = (TextBox)item.FindControl("TextBoxDate");
            string DOT = dateOfTour.Text;
            System.Diagnostics.Debug.WriteLine("PPK = " + Ppk + " DOT = " + DOT);

            string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
            using (SqlConnection ConObj = new SqlConnection(ConnectString))
            {
                ConObj.Open();
                String SQL = "INSERT INTO tour_location(tour_code,location_id,date_of_tour) VALUES (@tour_code,@location_id,@date_of_tour)";
                using (SqlCommand CmObj = new SqlCommand())
                {
                    CmObj.CommandText = SQL;
                    CmObj.Connection = ConObj;
                    if (Request.QueryString["id"] != null)
                    {
                        CmObj.Parameters.AddWithValue("@tour_code", Request.QueryString["id"].ToString());

                    }
                    else
                    {
                        CmObj.Parameters.AddWithValue("@tour_code", CreatedId);

                    }
                    CmObj.Parameters.AddWithValue("@location_id", Ppk);
                    CmObj.Parameters.AddWithValue("@date_of_tour", DOT);

                    if (CmObj.ExecuteNonQuery() > 0)
                    {
                        //System.Diagnostics.Debug.WriteLine(CreatedId);
                    }

                }
                ConObj.Close();
            }

        }
    }

    protected void TextBoxPalce_TextChanged(object sender, EventArgs e)
    {
        LoadPlace();
    }



    protected void ListViewPlace_ItemDataBound(object sender, ListViewItemEventArgs e)
    {

    }

    protected void ListViewPlace_PagePropertiesChanged(object sender, EventArgs e)
    {
        LoadPlace();
    }

    protected void ListViewHotel_DataBound(object sender, EventArgs e)
    {

    }

    protected void ListViewHotel_PagePropertiesChanged(object sender, EventArgs e)
    {
        LoadHotel();
    }

    protected void TextBoxHotel_TextChanged(object sender, EventArgs e)
    {
        LoadHotel();
    }

    protected void ListViewPlaceSelected_PagePropertiesChanged(object sender, EventArgs e)
    {

    }

    protected void ListViewHotelSelected_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    private void GetData(string id)
    {
        string StrConn = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        using (SqlConnection ObjConn = new SqlConnection(StrConn))
        {
            ObjConn.Open();
            using (SqlCommand ObjCM = new SqlCommand())
            {
                ObjCM.Connection = ObjConn;
                ObjCM.CommandText = "SELECT * FROM tour where tour_code = @id";
                ObjCM.Parameters.AddWithValue("@id", id);
                SqlDataReader ObjDR = ObjCM.ExecuteReader();
                ObjDR.Read();
                TextBoxENname.Text = ObjDR["en_name"].ToString();
                TextBoxTHname.Text = ObjDR["th_name"].ToString();
                TextBoxENdetail.Text = ObjDR["en_detail"].ToString();
                TextBoxTHdetail.Text = ObjDR["th_detail"].ToString();
                TextBoxPrice.Text = ObjDR["price"].ToString();

                ObjDR.Close();
            }
            ObjConn.Close();
        }

        GetLocation(id);
    }

    private void GetLocation(string id)
    {
        string query = "select tour_code , location_id , date_of_tour , type_location_id from tour_location tl inner join location l on l.id = tl.location_id where tour_code = " + id;

        string StrConn = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        SqlDataAdapter sda = new SqlDataAdapter(query, StrConn);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        foreach (DataRow row in dt.Rows)
        {
            string location_id = row["location_id"].ToString();
            string type_location_id = row["type_location_id"].ToString();

            System.Diagnostics.Debug.WriteLine("IN LOOP " + location_id);

            if (type_location_id != "7")
            {
                Session["placeSelected"] = (string)Session["placeSelected"] + " " + location_id;

            }
            else
            {
                Session["hotelSelected"] = (string)Session["hotelSelected"] + " " + location_id;

            }
        }

        System.Diagnostics.Debug.WriteLine("Session - " + Session["placeSelected"]);
        LoadSelectedPlace();
        LoadSelectedHotel();



    }
}


