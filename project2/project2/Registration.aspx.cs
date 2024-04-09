using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project2
{
    public partial class About : Page
    {
        SqlConnection connection = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Reg2btn_Click(object sender, EventArgs e)
        {
          
            try
            {
                connection.Open();

                // Check if the username already exists in the database
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM UsersTbl WHERE Username=@Username", connection))
                {
                    cmd.Parameters.AddWithValue("@Username", txtuname.Text);
                    int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alert", "alert('Username already exists!');", true);
                        return;
                    }
                }

                // Check if the password already exists in the database
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM UsersTbl WHERE Password=@Password", connection))
                {
                    cmd.Parameters.AddWithValue("@Password", txtemail.Text);
                    int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alert", "alert('Password already exists!');", true);
                        return;
                    }
                }

                // Insert the data into the database
                using (SqlCommand cmd = new SqlCommand("INSERT INTO UsersTbl (FirstName, LastName, Age, City, Address, Email, Username,Postal,Password) VALUES (@FirstName, @LastName, @Age, @City, @Address, @Email, @Username,@Postal,@Password)", connection))
                {
                    cmd.Parameters.AddWithValue("@FirstName", txtfname.Text);
                    cmd.Parameters.AddWithValue("@LastName", txtlname.Text);
                    cmd.Parameters.AddWithValue("@Age", txtage.Text);
                    cmd.Parameters.AddWithValue("@City", txtcity.Text);
                    cmd.Parameters.AddWithValue("@Address", txtadd.Text);
                    cmd.Parameters.AddWithValue("@Email", txtemail.Text);
                    cmd.Parameters.AddWithValue("@Username", txtuname.Text);
                    cmd.Parameters.AddWithValue("@Postal", txtpostal.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPass.Text);
                    cmd.ExecuteNonQuery();
                }


                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alert", "alert('Registration Successful!'); window.location.href='Login.aspx';", true);
              

            }
            catch (Exception )
            {
                string errorMessage = "An error occurred while processing your request. Please try again later";
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alert", $"alert('{errorMessage}');", true);
            }







        }

    }
}