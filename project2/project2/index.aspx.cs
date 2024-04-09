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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                double latitude = double.Parse(Request.Form["latitude"]);
                double longitude = double.Parse(Request.Form["longitude"]);
                string username = (string)Session["username"];

                string filename = Path.GetFileName(fileUpload.FileName);
                fileUpload.SaveAs(Server.MapPath("~/Uploads/") + filename);


                // Insert the values into the database
                using (SqlConnection connection = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO ReportTbl (latitu, long,Location,Description,Highlights,Submittedby,pic) VALUES (@latitu, @long,@Location,@Description,@Highlights,@Submittedby,@picture)", connection);
                    cmd.Parameters.AddWithValue("@latitu", latitude);
                    cmd.Parameters.AddWithValue("@long", longitude);
                    cmd.Parameters.AddWithValue("@Location", txtLocation.Text);
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@Highlights", txthighlight.Text);
                    cmd.Parameters.AddWithValue("@Submittedby", username);
                    cmd.Parameters.AddWithValue("@picture", "~/Uploads/" + filename);
                    cmd.ExecuteNonQuery();
                }
            }
            else
            {
                double latitude = double.Parse(Request.Form["latitude"]);
                double longitude = double.Parse(Request.Form["longitude"]);
                string username = (string)Session["username"];




                // Insert the values into the database
                using (SqlConnection connection = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO ReportTbl (latitu,long,Location,Description,Highlights,Submittedby) VALUES (@latitu, @long,@Location,@Description,@Highlights,@Submittedby)", connection);
                    cmd.Parameters.AddWithValue("@latitu", latitude);
                    cmd.Parameters.AddWithValue("@long", longitude);
                    cmd.Parameters.AddWithValue("@Location", txtLocation.Text);
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@Highlights", txthighlight.Text);
                    cmd.Parameters.AddWithValue("@Submittedby", username);

                    cmd.ExecuteNonQuery();

                }
            }
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alert", "alert('Submitted Successfully!');", true);
            // Clear the form fields after successful submission
            txtLocation.Text = "";
            txtDescription.Text = "";
            txthighlight.Text = "";
            fileUpload.Dispose();
        }
    }
}
