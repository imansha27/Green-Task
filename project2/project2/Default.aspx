<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="project2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions" %>
    <!DOCTYPE html>
    <html>
        <head>
			<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbZz5VC1Z7oaNltnHrFXtsDB-kMwnI698&callback=initMap" async defer></script>
            <title></title>

			<style>

               body {
		
		font-family: Arial, sans-serif;
		display: flex;
		flex-direction: column;
		height: 85%;
		background-color:#B2D3C2;
	}
	
	.container1 {
		display: flex;
		flex: 1;
		max-height: 100%;
		overflow-x: hidden;
        
        justify-content: center; 

       
    
		
       
	}
	
	.left {
		flex:2;
		max-height: calc(100% - 20px);
		overflow-y: scroll;
		display: flex;
		flex-direction: column;
		padding: 10px 10px;
		box-sizing: border-box;
       
	}
	
	.right {
		flex: 3;
		max-height: calc(100% - 20px);
		display: flex;
		flex-direction: column;
		padding: 10px 10px;
		box-sizing: border-box;
	}
	
	
	
	.map {
		width: 100%;
		height: 100%;
		background-color: #f7f7f7;
		border-radius: 5px;
		box-shadow: 0 2px 4px rgba(0,0,0,0.1);
	}
	
	.report {
		display: flex;
		margin-bottom: 10px;
		padding: 5px;
		background-color: #f7f7f7;
		border: 1px solid #ccc;
		border-radius: 5px;
		box-shadow: 0 2px 4px rgba(0,0,0,0.1);
		align-items: center;
		height: 80px;
		flex-shrink: 0;
		box-sizing: border-box;
	}
	
	.report img {
		width: 90px;
		height: 86px;
        padding:2px;
		flex-shrink: 0;
	}
	
	.report h3 {
		
		font-size: 14px;
		font-weight: bold;
		flex-grow: 1;
		flex-basis: 0;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	
	
    a {
  text-decoration: none;
  color: inherit;
}



	.card {
   width: 90%;
  height: 600px;
  border-radius: 10px;
  background-color: #f7f7f7;
  box-shadow: 0 2px 4px #234F1E;
  margin-bottom: 20px;
}

.card-title {
  font-weight: bold;
}

.card-text {
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 10; /* Number of lines to show */
  -webkit-box-orient: vertical;
}



.card-img-top {
  width:100%;
  padding: 10px;
  box-sizing: border-box;
 
}

	
</style>
          
        </head>
        <body>
			<br />
       
			<br />
			<div class="container">
    <div class="row">
        <% foreach (var article in ArticleData.GetArticles()) { %>
            <div class="col-md-4">
                <div class="card">
                    <% if (!string.IsNullOrEmpty(article.pic)) { %>
                        <%--<img src="<%= article.pic %>" class="card-img-top" alt="Article Image">--%>
						 <img src="<%= article.pic.Replace("~/", "") %>" alt="Article Image">
                    <% } %>
                    <div class="card-body">
                        <h5 class="card-title"><%= article.Heading %></h5>
                        <p class="card-text"><%= article.Description %></p>
                        <p class="card-text"><strong>Published Day:</strong> <%= article.publishDay %></p>
                    </div>
                </div>
            </div>
            <% if (Array.IndexOf(ArticleData.GetArticles().ToArray(), article) % 3 == 2) { %>
                </div><div class="row">
            <% } %>
        <% } %>
    </div>
</div>




















			 <br />
     

  <div class="container1">
   
  <div class="left">
    <% foreach (var report in ReportData.GetReports())  { %>
  
      <div class="report">
         <h3><%= report.Location %></h3>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <br />

       <%-- <img src="<%= report.Pic %>" alt="Report image">--%>
		 <img src="<%= report.Pic.Replace("~/", "") %>" alt="Report Image">  
        
       
      </div>
    
    <% } %>
  </div>

    <div class="right">
      <div id="map" class="map"></div>
    </div>
 </div>

  <script>
      // Initialize the map
	  function initMap() {
		  const map = new google.maps.Map(document.getElementById("map"), {
			  center: { lat: 6.9271, lng: 79.8612 },
			  zoom: 10,
		  });

		  // Create a marker for each report
       <% foreach (var report in ReportData.GetReports()) { %>
		  console.log('Latitude: <%= report.Latitude %>, Longitude: <%= report.Longitude %>');
		  var marker = new google.maps.Marker({
			  position: new google.maps.LatLng(<%= report.Latitude %>, <%= report.Longitude %>),
			  map: map,
			  title: '<%= report.Location %>'
		  });
		  var infowindow = new google.maps.InfoWindow({
              content: '<h4><%= report.Location %></h4><p><img src="<%= report.Pic.Replace("~/", "") %>" alt="Report image" style="width: 150px; height: 50px;"></p>'
		  });
		  marker.addListener('click', function () {
			  infowindow.open(map, marker);
		  });
<% } %>

	  }
  </script>
</body>

 </html>
</asp:Content>

