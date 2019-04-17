using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindListView();
    }

    protected void BindListView()
    {
        string query = "select  tl.tour_code id ,tl.location_id location_id,t.th_name t_th_name,t.en_name t_en_name, l.province_id province, l.type_location_id type_location ,ml.image img  from tour_location tl ";
        query += " inner join location l on l.id = tl.location_id";
        query += " inner join tour t on t.tour_code = tl.tour_code ";
        query += " left join image_location ml on ml.location_id = tl.location_id  ";
        query += " where tl.tour_code =  " + Request.QueryString["id"];


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

    }


    private void MainSave()
    {

        saveOrderWithPKTour();
        
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
        Session["book_code"] = book_code;
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
                CmObj.Parameters.AddWithValue("@tour_code", Request.QueryString["id"]);

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


    protected void ButtonSave_Click(object sender, EventArgs e)
    {
        MainSave();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "swal('จองสำเร็จเเล้ว!','รหัสทัวร์ของคุณคือ " + Session["book_code"]
       + " ติดตามทัวร์ของคุณได้ที่ Tour Tracking','success')", true);
        Response.Redirect("TourTracking.aspx?id=" + Session["book_code"]);
    }
}