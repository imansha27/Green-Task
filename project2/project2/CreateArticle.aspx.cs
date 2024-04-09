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
    public partial class CreateArticle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
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
                    using (var cmd = new SqlCommand("INSERT INTO ArticleTbl (Heading, Picture, Description) VALUES (@heading, @picture, @description)", con))
                    {
                        cmd.Parameters.AddWithValue("@heading", HeadingTextBox.Text);
                        cmd.Parameters.AddWithValue("@picture", "~/Uploads/" + filename);
                        cmd.Parameters.AddWithValue("@description", DescriptionTextBox.Text);

                        cmd.ExecuteNonQuery();
                    }
                }
            }
            else // no file was uploaded
            {
                using (var con = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
                {
                    con.Open();

                    using (var cmd = new SqlCommand("INSERT INTO ArticleTbl (Heading, Description) VALUES (@heading, @description)", con))
                    {
                        cmd.Parameters.AddWithValue("@heading", HeadingTextBox.Text);
                        cmd.Parameters.AddWithValue("@description", DescriptionTextBox.Text);

                        cmd.ExecuteNonQuery();
                    }
                }
            }

            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alert", "alert('Article Succefully Added!'); window.location.href='Adminpanel1.aspx';", true);
            // Clear the form fields after successful submission
            HeadingTextBox.Text = "";
            DescriptionTextBox.Text = "";
            fuPicture.Dispose();
        }


       
    }
}