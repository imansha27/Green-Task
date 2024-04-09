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
    public partial class Contact : Page
    {
        SqlConnection connection = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Regisbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {

            try
            {

                {
                    connection.Open();
                    string query = "SELECT * FROM UsersTbl WHERE Username=@Username AND Password=@Password AND UserType=@UserType";
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@Username", txtUser.Text);
                        cmd.Parameters.AddWithValue("@Password", txtPass.Text);
                        cmd.Parameters.AddWithValue("@UserType", Usertyp.Text);

                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            if (sdr.HasRows)
                            {
                                if (Usertyp.Text == "Web Master (Admin)")
                                {
                                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alert", "alert('Login Successful!'); window.location.href='Adminpanel1.aspx';", true);
                                }
                                else if(Usertyp.Text == "GTF Member")
                                {
                                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alert", "alert('Login Successful!'); window.location.href='Reportpanel.aspx?username="+ txtUser.Text +"';", true);

                                }
                                else if (Usertyp.Text == "Green Captain")
                                {
                                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alert", "alert('Login Successful!');  window.location.href='GCpanel1.aspx';", true);

                                }



                            }
                            else
                            {
                                if (string.IsNullOrEmpty(txtUser.Text) || string.IsNullOrEmpty(txtPass.Text))
                                {
                                    ScriptManager.RegisterStartupScript(this, GetType(), "EmptyFields", "alert('Please enter both username and email.');", true);
                                }
                                else if (string.IsNullOrEmpty(Usertyp.Text))
                                {
                                    ScriptManager.RegisterStartupScript(this, GetType(), "EmptyUserType", "alert('Please select a user type.');", true);
                                }
                                else if (!string.IsNullOrEmpty(txtUser.Text) && !string.IsNullOrEmpty(txtPass.Text))
                                {
                                    sdr.Close();
                                 // Determine whether the incorrect login is due to an incorrect username or password
                                    
                                    using (SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM [UsersTbl] WHERE Username=@Username AND Usertype=@Usertype", connection))
                                    {
                                        cmd2.Parameters.AddWithValue("@Username", txtUser.Text);
                                        cmd2.Parameters.AddWithValue("@Usertype", Usertyp.Text);
                                        int count = Convert.ToInt32(cmd2.ExecuteScalar());
                                        if (count == 0)
                                        {
                                            ScriptManager.RegisterStartupScript(this, GetType(), "IncorrectUsertype", "alert('Incorrect usertype.');", true);
                                            return;
                                        }
                                        
                                    }
                                    using (SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM [UsersTbl] WHERE Username=@Username", connection))
                                    {
                                        cmd2.Parameters.AddWithValue("@Username", txtUser.Text);
                                        int count = Convert.ToInt32(cmd2.ExecuteScalar());
                                        if (count == 0)
                                        {
                                            ScriptManager.RegisterStartupScript(this, GetType(), "IncorrectUsername", "alert('Incorrect Username.');", true);
                                        }
                                        else
                                        {
                                            ScriptManager.RegisterStartupScript(this, GetType(), "IncorrectPassword", "alert('Incorrect Password.');", true);
                                        }
                                    }

                                }
                            }
                        }

                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('An error occurred: " + ex.Message + "');", true);
            }



        }

    
}
}