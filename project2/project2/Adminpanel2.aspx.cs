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
    public partial class Adminpanel2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            using (var con = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
            {
                con.Open();
                using (var cmd = new SqlCommand("SELECT * FROM ArticleTbl", con))
                {
                    using (var adapter = new SqlDataAdapter(cmd))
                    {
                        var dt = new DataTable();
                        adapter.Fill(dt);

                        ((ImageField)ArticleList.Columns[2]).DataImageUrlField = "Picture";
                        ArticleList.DataSource = dt;
                        ArticleList.DataBind();
                    }
                }
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var articleId = int.Parse(button.CommandArgument);
            using (var con = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
            {
                con.Open();
                using (var cmd = new SqlCommand("DELETE FROM ArticleTbl WHERE Id = @Id", con))
                {
                    cmd.Parameters.AddWithValue("@Id", articleId);
                    cmd.ExecuteNonQuery();
                }
            }
            BindData();
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateArticle.aspx");
        }
    }
}