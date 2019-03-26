using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
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

    protected void ButtonSave_Click(object sender, EventArgs e)

    {
        int CreatedId = 0;
        string ConnectString = WebConfigurationManager.ConnectionStrings["jojoDBConnectionString"].ConnectionString;
        using (SqlConnection ConObj = new SqlConnection(ConnectString))
        {
            ConObj.Open();
            String SQL = "INSERT INTO location(en_name,th_name,en_detail,th_detail,province_id,type_location_id) output INSERTED.ID VALUES (@en_name,@th_name,@en_detail,@th_detail,@province_id,@type_location_id)";
            using (SqlCommand CmObj = new SqlCommand())
            {
                CmObj.CommandText = SQL;
                CmObj.Connection = ConObj;
                CmObj.Parameters.AddWithValue("@en_name", TextBoxENname.Text);
                CmObj.Parameters.AddWithValue("@th_name", TextBoxTHname.Text);
                CmObj.Parameters.AddWithValue("@en_detail", TextBoxENdetail.Text);
                CmObj.Parameters.AddWithValue("@th_detail", TextBoxTHdetail.Text);
                CmObj.Parameters.AddWithValue("@province_id", DropDownListProvice.SelectedValue);
                CmObj.Parameters.AddWithValue("@type_location_id", DropDownListType.SelectedValue);

                CreatedId = (int)CmObj.ExecuteScalar();

                if (CreatedId != 0)
                {
                    
                }
                else
                {
                }

                if (ConObj.State == System.Data.ConnectionState.Open)
                    ConObj.Close();


                //if (CmObj.ExecuteNonQuery() > 0)
                //{
                //    //System.Diagnostics.Debug.WriteLine(CreatedId);

                //}
                //else
                //{

                //}
            }
            ConObj.Close();
            if (CreatedId != 0) {
                ConObj.Open();
                string dir_path = Server.MapPath("~/DataStorage/LocationImg/" + CreatedId);
                if (!Directory.Exists(dir_path))
                {
                    Directory.CreateDirectory(dir_path);

                }

                for (int i = 0; i < Request.Files.Count; i++)
                {

                    HttpPostedFile file = Request.Files[i];
                    if (file.ContentLength > 0)
                    {
                        string fname = Path.GetFileName(file.FileName);
                        file.SaveAs(Server.MapPath(Path.Combine("~/DataStorage/LocationImg/" + CreatedId + "/", fname)));


                        String SQL2 = "INSERT INTO image_location(location_id,image) VALUES (@location_id,@image)";
                        using (SqlCommand CmObj2 = new SqlCommand())
                        {
                            CmObj2.CommandText = SQL2;
                            CmObj2.Connection = ConObj;
                            CmObj2.Parameters.AddWithValue("@location_id", CreatedId);
                            CmObj2.Parameters.AddWithValue("@image", "/DataStorage/LocationImg/" + CreatedId + "/" + fname);
                            if (CmObj2.ExecuteNonQuery() > 0)
                            {
                                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('บันทึกสำเร็จ')", true);
                            }
                            else
                            {

                            }
                        }

                    }

                }
                ConObj.Close();
            }
            

        }

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "swal('Good job!','บันทึกสำเร็จเเล้ว','success')", true);

    }

}