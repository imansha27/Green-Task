using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project2
{
    public partial class Reportpanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                BindData();
            
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var articleId = int.Parse(button.CommandArgument);
            using (var con = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
            {
                con.Open();
                using (var cmd = new SqlCommand("DELETE FROM ReportTbl WHERE ID = @Id", con))
                {
                    cmd.Parameters.AddWithValue("@Id", articleId);
                    cmd.ExecuteNonQuery();
                }
            }
            BindData();

        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }



        private void BindData()
        {
            string username = (string)Session["username"];
            if (username == null)
            {
                username = Request.QueryString["username"];
                Session["username"] = username;
            }
            using (var con = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
            {
                con.Open();
                using (var cmd = new SqlCommand("SELECT * FROM ReportTbl where Submittedby='" + username + "'", con))
                {
                    using (var adapter = new SqlDataAdapter(cmd))
                    {
                        var dt = new DataTable();
                        adapter.Fill(dt);

                        ((ImageField)ReportList.Columns[2]).DataImageUrlField = "pic";
                        ReportList.DataSource = dt;
                        ReportList.DataBind();
                    }
                }
            }
        }


    }
}

  

