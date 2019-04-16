using System;
using System.Collections.Generic;
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
    protected void Page_Load(object sender, EventArgs e)
    {

        //System.Diagnostics.Debug.WriteLine("ee+" + HiddenFieldTypeTour.Value.ToString());
        if (!IsPostBack)
        {
            BindListView();
        }

        if (!IsPostBack)
        {
            Session.Clear();

            if (Request.QueryString["id"] != null)
            {
                GetData(Request.QueryString["id"].ToString());
            }
        }

        LoadHotel();
        LoadPlace();
        LoadSelectedHotel();
        LoadSelectedPlace();
        LoadPKSElectTour();

       
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
        if (Request.QueryString["id"] != null)
        {
            SaveUpdateStatus(Request.QueryString["id"]);
        }
        else
        {
            MainSave();

        }
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "swal('Good job!','บันทึกสำเร็จเเล้ว','success')", true);


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
            Session["PKTourSelected"] = e.CommandArgument.ToString();

            LoadPKSElectTour();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ClosePop", "closePKModal();", true);



        }
    }

    private void LoadPKSElectTour()

    {
        string query = "select t.tour_code id , t.th_name t_th_name ,t.price t_price from tour t where t.tour_code = 0.0";

        if (Session["PKTourSelected"] != null)
        {
            query = "select t.tour_code id , t.th_name t_th_name ,t.price t_price from tour t where t.tour_code = " + Session["PKTourSelected"].ToString();
        }


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

        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShoeP", "PKShowHide();", true);


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

        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShoeP", "PKShowHide();", true);




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
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);

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

    private void MainSave()
    {
        string TourType = HiddenFieldTypeTour.Value;
        if (TourType == "1")
        {
            saveOrderWithPKTour();
        }
        else
        {
            saveOrderWithPTour();
        }
    }

    private void SaveUpdateStatus(string Id)
    {
        saveStatusId(Id, DropDownListStatus.SelectedValue);
    }

    private void saveOrderWithPKTour()
    {
        string Date = CalendarPicker.SelectedDate.Day.ToString();
        string Month = CalendarPicker.SelectedDate.Month.ToString();
        string Year = CalendarPicker.SelectedDate.Year.ToString();
        string Time = DropDownListTimePicker.SelectedValue;
        string DateTime = Year + "-" + Month + "-" + Date + "T" + Time;


        string book_code = Guid.NewGuid().ToString();
        string SqlCode = "INSERT INTO book_tour(book_code, c_firstname, c_lastname, c_phone, c_email, travel_datetime, number_of_children, number_of_adults, meeting_place, more_detail, tour_code) VALUES(@book_code, @c_f_name, @c_l_name, @c_phone, @c_email, @travel_datetime, @n_c, @n_a, @meet_place, @more_detail, @tour_code)";

        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        using (SqlConnection ConObj = new SqlConnection(ConnectString))
        {
            ConObj.Open();
            using (SqlCommand CmObj = new SqlCommand())
            {

                CmObj.CommandText = SqlCode;
                CmObj.Connection = ConObj;
                CmObj.Parameters.AddWithValue("@book_code", book_code);
                CmObj.Parameters.AddWithValue("@c_f_name", TextBoxFname.Text);
                CmObj.Parameters.AddWithValue("@c_l_name", TextBoxLname.Text);
                CmObj.Parameters.AddWithValue("@c_phone", TextBoxPhone.Text);
                CmObj.Parameters.AddWithValue("@c_email", TextBoxEmail.Text);
                CmObj.Parameters.AddWithValue("@travel_datetime", Convert.ToDateTime(DateTime));
                CmObj.Parameters.AddWithValue("@n_c", DropDownListChildren.SelectedValue);
                CmObj.Parameters.AddWithValue("@n_a", DropDownListAdult.SelectedValue);
                CmObj.Parameters.AddWithValue("@meet_place", TextBoxMeetplace.Text);
                CmObj.Parameters.AddWithValue("@more_detail", TextBoxMoredetail.Text);
                CmObj.Parameters.AddWithValue("@tour_code", Session["PKTourSelected"].ToString());

                if (CmObj.ExecuteNonQuery() != 0)
                {
                    string status = DropDownListStatus.SelectedValue;
                    saveStatusId(book_code, status);

                };

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


    private void saveOrderWithPTour()
    {
        string ID = SaveNewPlanTour();
        SaveHotelSelect(ID);
        SavePalceSelect(ID);


        string Date = CalendarPicker.SelectedDate.Day.ToString();
        string Month = CalendarPicker.SelectedDate.Month.ToString();
        string Year = CalendarPicker.SelectedDate.Year.ToString();
        string Time = DropDownListTimePicker.SelectedValue;
        string DateTime = Year + "-" + Month + "-" + Date + "T" + Time;


        string book_code = Guid.NewGuid().ToString();
        string SqlCode = "INSERT INTO book_tour(book_code, c_firstname, c_lastname, c_phone, c_email, travel_datetime, number_of_children, number_of_adults, meeting_place, more_detail, tour_code) VALUES(@book_code, @c_f_name, @c_l_name, @c_phone, @c_email, @travel_datetime, @n_c, @n_a, @meet_place, @more_detail, @tour_code)";

        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        using (SqlConnection ConObj = new SqlConnection(ConnectString))
        {
            ConObj.Open();
            using (SqlCommand CmObj = new SqlCommand())
            {

                CmObj.CommandText = SqlCode;
                CmObj.Connection = ConObj;
                CmObj.Parameters.AddWithValue("@book_code", book_code);
                CmObj.Parameters.AddWithValue("@c_f_name", TextBoxFname.Text);
                CmObj.Parameters.AddWithValue("@c_l_name", TextBoxLname.Text);
                CmObj.Parameters.AddWithValue("@c_phone", TextBoxPhone.Text);
                CmObj.Parameters.AddWithValue("@c_email", TextBoxEmail.Text);
                CmObj.Parameters.AddWithValue("@travel_datetime", Convert.ToDateTime(DateTime));
                CmObj.Parameters.AddWithValue("@n_c", DropDownListChildren.SelectedValue);
                CmObj.Parameters.AddWithValue("@n_a", DropDownListAdult.SelectedValue);
                CmObj.Parameters.AddWithValue("@meet_place", TextBoxMeetplace.Text);
                CmObj.Parameters.AddWithValue("@more_detail", TextBoxMoredetail.Text);
                CmObj.Parameters.AddWithValue("@tour_code", ID);

                if (CmObj.ExecuteNonQuery() != 0)
                {
                    string status = DropDownListStatus.SelectedValue;
                    saveStatusId(book_code, status);

                };

            }
            ConObj.Close();



        }
    }

    private string SaveNewPlanTour()
    {
        string Id = "";

        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        using (SqlConnection ConObj = new SqlConnection(ConnectString))
        {
            ConObj.Open();
            String SQL = "INSERT INTO tour(th_name,price,type_tour_id) output INSERTED.tour_code VALUES (@th_name,@price,@type_tour_id)";
            using (SqlCommand CmObj = new SqlCommand())
            {
                CmObj.CommandText = SQL;
                CmObj.Connection = ConObj;
                CmObj.Parameters.AddWithValue("@th_name", "ทัวร์ของ" + TextBoxFname.Text);
                CmObj.Parameters.AddWithValue("@price", TextBoxPrice.Text);
                CmObj.Parameters.AddWithValue("@type_tour_id", "2");

                Id = (string)CmObj.ExecuteScalar().ToString();

                if (Id.Length > 0)
                {

                }
                else
                {

                }

            }
            ConObj.Close();
        }

        return Id;

    }


    protected void SaveHotelSelect(string id)
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
                    CmObj.Parameters.AddWithValue("@tour_code", id);
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

    protected void SavePalceSelect(string id)
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
                    CmObj.Parameters.AddWithValue("@tour_code", id);
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

    public void loadCalender(DayRenderEventArgs e)
    {
        string SqlCode = "SELECT b.travel_datetime, max(tl.date_of_tour) max_date , tl.tour_code FROM book_tour b INNER JOIN tour_location  tl ON b.tour_code = tl.tour_code group by tl.tour_code ,b.travel_datetime";

        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        SqlDataAdapter sda = new SqlDataAdapter(SqlCode, ConnectString);
        DataTable dt = new DataTable();

        sda.Fill(dt);

        List<string> InDate = new List<string>();
        List<string> InDateNext = new List<string>();


        foreach (DataRow row in dt.Rows)

        {
            string[] DateNow = Convert.ToDateTime(row["travel_datetime"]).ToString().Split(' ');
            InDate.Add(DateNow[0]);
            int maxDate = Convert.ToInt32(row["max_date"].ToString());
            if (maxDate>  1)
            {
                DateTime C_date = Convert.ToDateTime(row["travel_datetime"]);
                System.Diagnostics.Debug.WriteLine(C_date);
                for (int i = 2; i <= maxDate; i++)
                {
                    string[] NextDay = C_date.AddDays(i - 1).ToString().Split(' ');
                    InDateNext.Add(NextDay[0]);                    
                }
            }
        }

        string[] CalDate = e.Day.Date.ToString().Split(' ');
        if (InDate.Contains(CalDate[0]) || InDateNext.Contains(CalDate[0]))
        {
            System.Diagnostics.Debug.WriteLine("iF" + " " + e.Day.Date.ToString() + " D ");
            e.Cell.ForeColor = System.Drawing.Color.White;
            e.Cell.BackColor = System.Drawing.Color.Red;
            e.Day.IsSelectable = false;
        }
        else
        {
            System.Diagnostics.Debug.WriteLine("ELSE" + " " + e.Day.Date.ToString() + " D ");
        }

    }

    protected void CalendarPicker_DayRender(object sender, DayRenderEventArgs e)
    {
        loadCalender(e);
        if (Request.QueryString["id"] != null)
        {
            loadDateTime(e);
            
        }
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
                ObjCM.CommandText = "SELECT * FROM book_tour bt inner join book_status_history bs on bt.book_code = bs.book_code where bt.book_code = @id";
                ObjCM.Parameters.AddWithValue("@id", id);
                SqlDataReader ObjDR = ObjCM.ExecuteReader();
                ObjDR.Read();

                TextBoxFname.Text = ObjDR["c_firstname"].ToString();
                TextBoxFname.ReadOnly = true;

                TextBoxLname.Text = ObjDR["c_lastname"].ToString();
                TextBoxLname.ReadOnly = true;

                TextBoxPhone.Text = ObjDR["c_phone"].ToString();
                TextBoxPhone.ReadOnly = true;

                TextBoxEmail.Text = ObjDR["c_email"].ToString();
                TextBoxEmail.ReadOnly = true;

                TextBoxMeetplace.Text = ObjDR["meeting_place"].ToString();
                TextBoxMeetplace.ReadOnly = true;

                TextBoxMoredetail.Text = ObjDR["more_detail"].ToString();
                TextBoxMoredetail.ReadOnly = true;



                LoadTour(ObjDR["tour_code"].ToString());

                DropDownListChildren.SelectedValue = ObjDR["number_of_children"].ToString();
                DropDownListChildren.Enabled = false;

                DropDownListAdult.SelectedValue = ObjDR["number_of_adults"].ToString();
                DropDownListAdult.Enabled = false;


                DropDownListStatus.SelectedValue = ObjDR["status_id"].ToString();



                if (ObjDR["payment_slip"].ToString() != "")
                {
                    ImgPayment.ImageUrl = ObjDR["payment_slip"].ToString();
                }

                ObjDR.Close();
            }
            ObjConn.Close();
        }

    }


    private void loadDateTime(DayRenderEventArgs e)
    {
        string SqlCode = "SELECT b.travel_datetime, max(tl.date_of_tour) max_date , tl.tour_code FROM book_tour b INNER JOIN tour_location  tl ON b.tour_code = tl.tour_code where b.book_code = @id group by tl.tour_code ,b.travel_datetime ";

        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        SqlDataAdapter sda = new SqlDataAdapter(SqlCode, ConnectString);
        sda.SelectCommand.Parameters.AddWithValue("@id", Request.QueryString["id"]);

        DataTable dt = new DataTable();

        sda.Fill(dt);

        List<string> InDate = new List<string>();
        List<string> InDateNext = new List<string>();


        foreach (DataRow row in dt.Rows)

        {
            string[] DateNow = Convert.ToDateTime(row["travel_datetime"]).ToString().Split(' ');
            InDate.Add(DateNow[0]);

            string Time = DateNow[1].Substring(0, 5);

            DropDownListTimePicker.SelectedValue = Time;
            DropDownListTimePicker.Enabled = false;


            System.Diagnostics.Debug.WriteLine(Time,"Time");

            int maxDate = Convert.ToInt32(row["max_date"].ToString());
            if (maxDate > 1)
            {
                DateTime C_date = Convert.ToDateTime(row["travel_datetime"]);
                System.Diagnostics.Debug.WriteLine(C_date);
                for (int i = 2; i <= maxDate; i++)
                {
                    string[] NextDay = C_date.AddDays(i - 1).ToString().Split(' ');
                    InDateNext.Add(NextDay[0]);
                }
            }
        }

        string[] CalDate = e.Day.Date.ToString().Split(' ');
        if (InDate.Contains(CalDate[0]) || InDateNext.Contains(CalDate[0]))
        {
            System.Diagnostics.Debug.WriteLine("iF" + " " + e.Day.Date.ToString() + " D ");
            e.Cell.ForeColor = System.Drawing.Color.White;
            e.Cell.BackColor = System.Drawing.Color.LightGreen;
            e.Day.IsSelectable = false;
        }
        else
        {
            e.Day.IsSelectable = false;

            System.Diagnostics.Debug.WriteLine("ELSE" + " " + e.Day.Date.ToString() + " D ");
        }


    }

    private void LoadTour(string DT)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "HEdit", "HideEdit();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShoePH", "PTShowHide();", true);

        Session["PKTourSelected"] = DT;
        LoadPKSElectTour();

    }

}


