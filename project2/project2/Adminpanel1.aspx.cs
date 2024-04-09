using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project2
{
    public partial class Adminpanel1 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetGCList();
               
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fname = TextBox1.Text, lname = TextBox2.Text, city = TextBox4.Text, address = TextBox5.Text, email = TextBox6.Text, username = TextBox7.Text, usertype ="Green Captain",password=TextBox8.Text;
            int age = int.Parse(TextBox3.Text);
            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO UsersTbl (FirstName, LastName, Age, City, Address, Email,Username, UserType,Password) VALUES (@fname, @lname, @age, @city, @address, @email,@username, @usertype,@pass)", connection);

                cmd.Parameters.AddWithValue("@fname", fname);
                cmd.Parameters.AddWithValue("@lname", lname);
                cmd.Parameters.AddWithValue("@age", age);
                cmd.Parameters.AddWithValue("@city", city);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@usertype", usertype);
                cmd.Parameters.AddWithValue("@pass", password);
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, GetType(), "script", "alert('Account Successfully Created');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "script", "alert('An error occurred: " + ex.Message + "');", true);
            }
            finally
            {
                connection.Close();
            }
            GetGCList();
        }

        void GetGCList()
        {
            try
            {
                connection.Open();
                string selectSql = "SELECT FirstName, LastName, Age, City, Address, Email,Username, UserType,JoiningDate FROM UsersTbl WHERE UserType='Green Captain'";
                SqlCommand cmd = new SqlCommand(selectSql, connection);
                SqlDataReader reader = cmd.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
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


