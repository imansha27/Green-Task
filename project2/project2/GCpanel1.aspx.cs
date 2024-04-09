using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;




namespace project2
{
    public partial class GCpanel1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public class Report
{
    public int ID { get; set; }
    public string Location { get; set; }
    public string Highlights { get; set; }
    public string pic { get; set; }
    public string Approved { get; set; }
    public double Latitude { get; set; }
    public double Longitude { get; set; }
}

public class ReportData
{
    public static List<Report> GetReports()
    {
        List<Report> reports = new List<Report>();

                // Retrieve the data from the ReportTbl table
                using (SqlConnection connection = new SqlConnection("Data Source=kithmi;Initial Catalog=GreenForceDB;Integrated Security=True"))
                {
            SqlCommand command = new SqlCommand("SELECT * FROM ReportTbl", connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Report report = new Report();
                report.ID = (int)reader["ID"];
                report.Location = (string)reader["Location"];
                report.Highlights = (string)reader["Highlights"];
                report.pic = reader["pic"] == DBNull.Value ? null : (string)reader["pic"];
                report.Approved = (string)reader["Approved"];
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


