using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Text;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Customer_PackageTour : System.Web.UI.Page
{
    int CreatedId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        //System.Diagnostics.Debug.WriteLine("ee+" + HiddenFieldTypeTour.Value.ToString());
        if (!IsPostBack)
        {
            BindListView();
        }
        LoadHotel();
        LoadPlace();
        LoadSelectedHotel();
        LoadSelectedPlace();


    }
    protected void BindListView()
    {
        string query = "select  tl.tour_code id ,tl.location_id location_id,t.th_name t_th_name,t.en_name t_en_name, l.province_id province, l.type_location_id type_location ,ml.image img  from tour_location tl ";
        query += " inner join location l on l.id = tl.location_id";
        query += " inner join tour t on t.tour_code = tl.tour_code ";
        query += " left join image_location ml on ml.location_id = tl.location_id  ";
        query += " where t.type_tour_id = 1 ";

        /// keyword Search
        string SearchKeyWord = TextBox1.Text;
        if (SearchKeyWord != "")
        {
            query += " and ( t.th_name like '%" + SearchKeyWord + "%'";
            query += " or t.en_name like '%" + SearchKeyWord + "%' )";
        }


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


    protected void ButtonSave_Click(object sender, EventArgs e)

    {


    }

    protected void SaveTour()
    {


    }




    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        BindListView();
    }

    protected void ListView1_PagePropertiesChanged(object sender, EventArgs e)
    {
        BindListView();
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        //System.Diagnostics.Debug.WriteLine("select "+Session["PKTourSelected"].ToString());
        if (e.CommandName == "select_pkTour")
        {
            Session["PKTourSelected"] =  e.CommandArgument.ToString();

            LoadPKSElectTour();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ClosePop", "closePKModal();", true);



        }
    }

    private void LoadPKSElectTour()
    {
        string query = "select t.tour_code id , t.th_name t_th_name ,t.price t_price from tour t where t.tour_code = "+Session["PKTourSelected"].ToString();
       

        string StrConn = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(StrConn);
        SqlDataAdapter sda = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();

        //System.Diagnostics.Debug.WriteLine(sda); //console.log

        sda.Fill(dt);
        DataList1.DataSource = dt;
        DataList1.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShoeP", "PKShowShow();", true);


        //Page.ClientScript.RegisterStartupScript(this.GetType(), "paramFN1", "PKShowShow('" +0 + "');", true);


        System.Diagnostics.Debug.WriteLine("END JF");



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



    protected void TextBoxPalce_TextChanged(object sender, EventArgs e)
    {
        LoadPlace();
    }

    protected void TextBoxHotel_TextChanged(object sender, EventArgs e)
    {
        LoadHotel();
    }



    protected void ListViewPlace_PagePropertiesChanged(object sender, EventArgs e)
    {
        LoadPlace();
    }

    protected void ListViewHotel_PagePropertiesChanged(object sender, EventArgs e)
    {
        LoadHotel();
    }

    private void  MainSave()
    {

    }

    private void saveOrderWithPKTour()
    {
        string book_code = Guid.NewGuid().ToString();

    }


    private void saveOrderWithPTour() { }


    
}

    
