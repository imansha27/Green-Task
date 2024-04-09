using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace project2
{
    public partial class _Default : Page
    {
        public class Report
        {
            public int ID { get; set; }
            public string Location { get; set; }
            public string Highlights { get; set; }
            public string Pic { get; set; }
            public string Approved { get; set; }
            public double Latitude { get; set; }
            public double Longitude { get; set; }
        }

        public class Article
        {
            public int ID { get; set; }
            public string Heading { get; set; }
            public string Description { get; set; }
            public string pic { get; set; }
            public DateTime publishDay { get; set; }
        }

        public class ArticleData
        {
            public static List<Article> GetArticles()
            {
                List<Article> articles = new List<Article>();

                // Retrieve the data from the ReportTbl table
                using (SqlConnection connection = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
                {
                    SqlCommand command = new SqlCommand("SELECT * FROM ArticleTbl", connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Article article = new Article();
                        article.ID = (int)reader["Id"];
                        article.Heading = (string)reader["Heading"];
                        article.pic = reader["picture"] == DBNull.Value ? null : (string)reader["picture"];
                        article.Description = (string)reader["Description"];
                        article.publishDay = (DateTime)reader["Published_date"];


                        articles.Add(article);
                    }
                    reader.Close();
                }

                return articles;
            }
        }

        public class ReportData
        {
            public static List<Report> GetReports()
            {
                List<Report> reports = new List<Report>();

                // Retrieve the data from the ReportTbl table
                using (SqlConnection connection = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
                {
                    SqlCommand command = new SqlCommand("SELECT * FROM ReportTbl WHERE Approved = 'yes'", connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Report report = new Report();
                        report.ID = (int)reader["ID"];
                        report.Location = (string)reader["Location"];
                        report.Highlights = (string)reader["Highlights"];
                        report.Pic = reader["pic"] == DBNull.Value ? null : (string)reader["pic"];
                        report.Latitude = reader["latitu"] == DBNull.Value ? 0 : Convert.ToDouble(reader["latitu"]);
                        report.Longitude = reader["long"] == DBNull.Value ? 0 : Convert.ToDouble(reader["long"]);
                        reports.Add(report);
                    }
                    reader.Close();
                }

                return reports;
            }
        }
    }

}

