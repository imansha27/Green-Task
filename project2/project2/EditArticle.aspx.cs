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
    public partial class EditArticle : System.Web.UI.Page
    {
        private int _articleId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!int.TryParse(Request.QueryString["id"], out _articleId))
                {
                    Response.Redirect("Adminpanel2.aspx");
                }
                else
                {
                    using (var con = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
                    {
                        con.Open();
                        using (var cmd = new SqlCommand("SELECT * FROM ArticleTbl WHERE Id = @id", con))
                        {
                            cmd.Parameters.AddWithValue("@id", _articleId);
                            using (var reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    txtHeading.Text = reader["Heading"].ToString();
                                    txtDescription.Text = reader["Description"].ToString();
                                   
                                   
                                     //fuPicture.ImageUrl = reader["Picture"].ToString();
                                  

                                }
                                else
                                {
                                    Response.Redirect("Adminpanel2.aspx");
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["id"], out _articleId))
            {


                // check if a file was uploaded
                if (fuPicture.HasFile)
                {
                    // save the uploaded file to a directory on the server
                    string filename = Path.GetFileName(fuPicture.FileName);
                    fuPicture.SaveAs(Server.MapPath("~/Uploads/") + filename);

                    using (var con = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
                    {
                        con.Open();
                        using (var cmd = new SqlCommand("UPDATE ArticleTbl SET Heading = @heading,Picture=@picture,Description = @description WHERE Id = @id", con))
                        {
                            cmd.Parameters.AddWithValue("@heading", txtHeading.Text);
                            cmd.Parameters.AddWithValue("@picture", "~/Uploads/" + filename);
                            cmd.Parameters.AddWithValue("@description", txtDescription.Text);
                            cmd.Parameters.AddWithValue("@id", _articleId);
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                else // no file was uploaded
                {
                    using (var con = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
                    {
                        con.Open();

                        using (var cmd = new SqlCommand("UPDATE ArticleTbl SET Heading = @heading, Description=@description WHERE Id =@id", con))
                        {
                            cmd.Parameters.AddWithValue("@heading", txtHeading.Text);
                            cmd.Parameters.AddWithValue("@description", txtDescription.Text);
                            cmd.Parameters.AddWithValue("@id", _articleId);
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                Response.Redirect("Adminpanel2.aspx");
            }
        }

            protected void btnCancel_Click(object sender, EventArgs e)
            {
                Response.Redirect("Adminpanel2.aspx");
            }
        
    }
}
