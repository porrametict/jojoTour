using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web.Configuration;

public partial class _Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillData();
        }
    }
    //FillData method for filling Repeater Control with Data
    private void fillData()
    {
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        DataTable dt = new DataTable();
        SqlDataAdapter adapt = new SqlDataAdapter("Select * from comment Order by Id Desc", con);
        adapt.Fill(dt);
        con.Close();
        PagedDataSource pds = new PagedDataSource();
        DataView dv = new DataView(dt);
        pds.DataSource = dv;
        pds.AllowPaging = true;
        pds.PageSize = 4;
        pds.CurrentPageIndex = PageNumber;
        if (pds.PageCount > 1)
        {
            rptPaging.Visible = true;
            ArrayList arraylist = new ArrayList();
            for (int i = 0; i < pds.PageCount; i++)
                arraylist.Add((i + 1).ToString());
            rptPaging.DataSource = arraylist;
            rptPaging.DataBind();
        }
        else
        {
            rptPaging.Visible = false;
        }
        Repeater1.DataSource = pds;
        Repeater1.DataBind();
    }
    //btn_Submit Click Event
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        if (btn_Submit.Text == "Post Comment")
        {
            if (checkBookCode() == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Insert is successfull')", true);
                InsertData();
            }

            else if (checkBookCode() == false)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bookcode Invalid')", true);
            }

        }

    }
    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
                return Convert.ToInt32(ViewState["PageNumber"]);
            else
                return 0;
        }
        set
        {
            ViewState["PageNumber"] = value;
        }
    }
    protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        fillData();
    }

    protected void Unnamed1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    private bool checkBookCode()
    {
        bool book_true = false;

        // DB

        string StrConn = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        using (SqlConnection ObjConn = new SqlConnection(StrConn))
        {
            ObjConn.Open();
            using (SqlCommand ObjCM = new SqlCommand())
            {
                ObjCM.Connection = ObjConn;
                ObjCM.CommandText = "SELECT * FROM book_tour where book_code = @book_code";
                ObjCM.Parameters.AddWithValue("@book_code", txtbook_code.Text);
                SqlDataReader ObjDR = ObjCM.ExecuteReader();
                ObjDR.Read();
                if (ObjDR.HasRows)
                {
                    book_true = true;
                }
                ObjDR.Close();
            }
            ObjConn.Close();
        }

        return book_true;
    }

    protected void InsertData()
    {
        string gender = string.Empty;
        if (RadioButton1.Checked)
        {
            gender = "1";
        }
        else if (RadioButton2.Checked)
        {
            gender = "2";
        }
        else if (RadioButton3.Checked)
        {
            gender = "3";
        }
        else if (RadioButton4.Checked)
        {
            gender = "4";
        }
        else if (RadioButton5.Checked)
        {
            gender = "5";
        }

        SqlConnection con = new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into comment(text,rate) values(@text,@rate)", con);
        //cmd.Parameters.AddWithValue("@book_code", txtbook_code.Text);
        cmd.Parameters.AddWithValue("@text", txtComment.Text);
        //cmd.Parameters.AddWithValue("@created_at", txtName.Text);
        cmd.Parameters.AddWithValue("@rate", gender);
        cmd.ExecuteNonQuery();
        con.Close();
        //Displaying Javascript alert Comment Posted Successfully
        ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Comment Posted Successfully.');window.location='default3.aspx';", true);
        fillData();
        //txtbook_code.Text = "";
        //txtBookCode.Text = "";
        txtComment.Text = "";
    }
}