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


    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        loadCalender(e);
    }
}