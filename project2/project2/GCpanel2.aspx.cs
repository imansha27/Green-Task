using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace project2
{



    public partial class GCpanel2 : System.Web.UI.Page
    {
        private int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get the ID from the query string
                if (!int.TryParse(Request.QueryString["id1"], out id))
                {
                    // Handle invalid or missing ID
                    return;
                }

                // Load the report information
                LoadReportInfo();
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {

            if (int.TryParse(Request.QueryString["id1"], out id))
            {  // Get the value of the selected radio button
                string approval = radYes.Checked ? "yes" : "no";

                // Update the Approved field in the database
                string connectionString = "Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();
                        string query = "UPDATE ReportTbl SET Approved = @Approved WHERE ID = @ID";
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@ID", id);
                            command.Parameters.AddWithValue("@Approved", approval);
                            int rowsAffected = command.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                // Display a success message
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Update successful.');", true);

                                // Reload the report information
                                LoadReportInfo();
                            }
                            else
                            {
                                // Display an error message
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Update unsuccessful.');", true);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);
                    }
                    finally
                    {
                        connection.Close();
                    }
                }

            }

        }

        //private void LoadReportInfo()
        //    {
        //        // Retrieve the report information from the database
        //        string connectionString = "Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True";
        //        using (SqlConnection connection = new SqlConnection(connectionString))
        //        {
        //            try
        //            {
        //                connection.Open();
        //                string query = "SELECT Location, Pic, Highlights, Approved, Description, Date, Submittedby FROM ReportTbl WHERE ID = @ID";
        //                using (SqlCommand command = new SqlCommand(query, connection))
        //                {
        //                    command.Parameters.AddWithValue("@ID", id);
        //                    using (SqlDataReader reader = command.ExecuteReader())
        //                    {
        //                        if (reader.Read())
        //                        {
        //                            // Display the report information on the page
        //                            lblLocation.Text = reader.GetString(0);
        //                            imgPic.ImageUrl = reader.IsDBNull(1) ? "" : reader.GetString(1);
        //                            lblHighlights.Text = reader.GetString(2);
        //                            imgapprove.Text = reader.IsDBNull(3) ? "" : reader.GetString(3);
        //                            lbldiscription.Text = reader.GetString(4);
        //                            lbldate.Text = reader.IsDBNull(5) ? "" : reader.GetDateTime(5).ToString("yyyy-MM-dd");
        //                            lblby.Text = reader.IsDBNull(6) ? "" : reader.GetString(6);

        //                            // Check the appropriate radio button based on the value of Approved
        //                            if (imgapprove.Text == "yes")
        //                            {
        //                                radYes.Checked = true;
        //                            }
        //                            else if (imgapprove.Text == "no")
        //                            {
        //                                radNo.Checked = true;
        //                            }
        //                        }


        //                    }
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //            ScriptManager.RegisterStartupScript(this, GetType(), "script", "alert('An error occurred: " + ex.Message + "');", true);
        //        }
        //        finally
        //        {
        //            connection.Close();
        //        }
        //    }
        //    }
        //}














        //protected void BtnUpdate_Click(object sender, EventArgs e)
        //{
        //    if (int.TryParse(Request.QueryString["id"], out id))
        //    {

        //        // Get the value of the selected radio button
        //        string approval = radYes.Checked ? "yes" : "no";

        //        // Update the Approved field in the database
        //        string connectionString = "Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True";
        //        using (SqlConnection connection = new SqlConnection(connectionString))
        //        {
        //            try
        //            {
        //                connection.Open();
        //                string query = "UPDATE ReportTbl SET Approved = @Approved WHERE ID = @ID";
        //                using (SqlCommand command = new SqlCommand(query, connection))
        //                {
        //                    command.Parameters.AddWithValue("@ID", id);
        //                    command.Parameters.AddWithValue("@Approved", approval);
        //                    int rowsAffected = command.ExecuteNonQuery();
        //                    if (rowsAffected > 0)
        //                    {
        //                        // Display a success message
        //                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Update successful.'); window.location.reload();", true);

        //                        // Reload the report information
        //                        LoadReportInfo();

        //                    }
        //                    else
        //                    {
        //                        // Display an error message
        //                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Update unsuccessful.');", true);
        //                    }
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                // Handle the exception
        //                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);
        //            }
        //            finally
        //            {
        //                connection.Close();
        //            }
        //        }
        //    }
        //}

        private void LoadReportInfo()
        {
            // Retrieve the report information from the database
            string connectionString = "Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "SELECT Location, Pic, Highlights, Approved, Description, Date, Submittedby FROM ReportTbl WHERE ID = @ID";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@ID", id);
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Display the report information on the page
                                lblLocation.Text = reader.GetString(0);
                                imgPic.ImageUrl = reader.IsDBNull(1) ? "" : reader.GetString(1);
                                lblHighlights.Text = reader.GetString(2);
                                imgapprove.Text = reader.IsDBNull(3) ? "" : reader.GetString(3);
                                lbldiscription.Text = reader.GetString(4);
                                lbldate.Text = reader.IsDBNull(5) ? "" : reader.GetDateTime(5).ToString("yyyy-MM-dd");
                                lblby.Text = reader.IsDBNull(6) ? "" : reader.GetString(6);

                                // Check the appropriate radio button based on the value of Approved
                                if (imgapprove.Text == "yes")
                                {
                                    radYes.Checked = true;
                                }
                                else if (imgapprove.Text == "no")
                                {
                                    radNo.Checked = true;
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "script", "alert('An error occurred: " + ex.Message + "');", true);
                }
                finally
                {
                    connection.Close();
                }
            }
        }
    }


}
      
