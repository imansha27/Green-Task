using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project2
{
    public partial class index2 : System.Web.UI.Page
    {
        private int _reportId;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                if (!int.TryParse(Request.QueryString["id"], out _reportId))
                {
                    Response.Redirect("Reportpanel.aspx");
                }
                else
                {
                    using (var con = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
                    {
                        con.Open();

                        using (var cmd = new SqlCommand("SELECT * FROM ReportTbl WHERE ID = @id", con))
                        {
                            cmd.Parameters.AddWithValue("@id", _reportId);
                            using (var reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    txtLocation.Text = reader["Location"].ToString();
                                    txtHighlights.Text = reader["Highlights"].ToString();
                                    txtDescription.Text = reader["Description"].ToString();
                                    






                                }
                                else
                                {
                                    Response.Redirect("Reportpanel.aspx");
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["id"], out _reportId))
            {
                double latitude = double.Parse(Request.Form["latitude"]);
                double longitude = double.Parse(Request.Form["longitude"]);


                // check if a file was uploaded
                if (fuPicture.HasFile)
                {
                    // save the uploaded file to a directory on the server
                    string filename = Path.GetFileName(fuPicture.FileName);
                    fuPicture.SaveAs(Server.MapPath("~/Uploads/") + filename);

                    using (var con = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
                    {
                        con.Open();
                        using (var cmd = new SqlCommand("UPDATE ReportTbl SET latitu=@latitu, long=@long, Location = @location,pic=@picture,Description= @description,Highlights=@highlights WHERE ID = @id", con))
                        {
                            cmd.Parameters.AddWithValue("@latitu", latitude);
                            cmd.Parameters.AddWithValue("@long", longitude);
                            cmd.Parameters.AddWithValue("@location", txtLocation.Text);
                            cmd.Parameters.AddWithValue("@picture", "~/Uploads/" + filename);
                            cmd.Parameters.AddWithValue("@description", txtDescription.Text);
                            cmd.Parameters.AddWithValue("@highlights", txtHighlights.Text);
                            cmd.Parameters.AddWithValue("@id", _reportId);
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                else // no file was uploaded
                {
                    using (var con = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
                    {
                        con.Open();

                        using (var cmd = new SqlCommand("UPDATE ReportTbl SET latitu=@latitu, long=@long,Location = @location,Description = @description,Highlights=@highlights WHERE ID =@id", con))
                        {
                            cmd.Parameters.AddWithValue("@latitu", latitude);
                            cmd.Parameters.AddWithValue("@long", longitude);
                            cmd.Parameters.AddWithValue("@location", txtLocation.Text);
                            cmd.Parameters.AddWithValue("@description", txtDescription.Text);
                            cmd.Parameters.AddWithValue("@highlights", txtHighlights.Text);
                            cmd.Parameters.AddWithValue("@id", _reportId);
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                Response.Redirect("Reportpanel.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reportpanel.aspx");
        }

    }
}