
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GCpanel1.aspx.cs" Inherits="project2.GCpanel1" %>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbZz5VC1Z7oaNltnHrFXtsDB-kMwnI698&callback=initMap" async defer></script>

    <title></title>
     <webopt:bundlereference runat="server" path="~/Content/css" />
 <style type="text/css">

           /* Colors */
        :root {
            --primary-color: #165611;
            --secondary-color: #FFFFFF;
            --tertiary-color: #6E6E6E;
          
        }

        /* Navbar */
        .navbar {
         

    width: 100%;
    height: 80px;
    background: #ffffff;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 100px;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            color: var( --primary-color);
              font-size: 30px;
              font-family: 'Intro', sans-serif;
              font-weight: 800;
              text-transform: uppercase;
               justify-content: flex-start;
        }
        .navbar-brand:hover {
              /* Remove hover effect */
              color: var(--primary-color);
              text-decoration: none;
            }

        .navbar-nav .nav-item .nav-link {
            color: var( --primary-color);
            justify-content: flex-end;



    display: block;
   /* font-weight: 800;*/
    font-size: 15px;
    padding: 10px 10px;
    border-radius: 50px;
    transition: 0.2s;
    margin: 0.5px;
        }
         .navbar-nav .nav-item .nav-link:hover {
            color: rgb(25, 21, 22);
            background: #10b30d;
         }
        
         
         
          .nav-link1 {
            color: var( --primary-color);
            justify-content: flex-end;



            display: block;
           
            font-size: 15px;
            padding: 10px 10px;
            border-radius: 50px;
            transition: 0.2s;
            margin: 0.5px;
            background:#1bcd33;
        }
         .nav-link1:hover {
            color: rgb(25, 21, 22);
            background: #10b30d;
         }






        body {
		
		font-family: Arial, sans-serif;
		display: flex;
		flex-direction: column;
		height: 90%;
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
		max-height: 100%;
		overflow-y: scroll;
		display: flex;
		flex-direction: column;
		padding: 10px 10px;
		box-sizing: border-box;
       
	}
	
	.right {
		flex: 3;
		max-height: 100% ;
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
    .heading{
       font-size: 40px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 40px;
            width: 100%;
            text-decoration:underline;

    }
    
	
	
    a {
  text-decoration: none;
  color: inherit;
}

	




 </style>


</head>
<body>

      
         <nav class="navbar navbar-expand-sm navbar-toggleable-sm">
            
        <div class="container">
                <a class="navbar-brand" runat="server">Green Task</a>
                    <ul class="navbar-nav flex-grow-1">
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/GCpanel1">Check-Reports</a></li>
                        &nbsp;
                        <li class="nav-item"><a class="nav-link1" runat="server" href="~/Login">Log-out</a></li>
                    </ul>
               </div>
            
        </nav>
    <br />
     <br />
    <div class="heading">
        <h3>Submitted Reports</h3>
    </div>
     
     <br />
     
    
  <div class="container1">
     
   
  <div class="left">
    <% foreach (var report in ReportData.GetReports())  { %>
  <a href="/GCpanel2?id1=<%= report.ID %>" style="text-decoration: none; color: inherit;">
      <div class="report">
         <h3><%= report.Location %></h3>
        <% if (report.Approved == "yes") { %>
        <img src="https://cutewallpaper.org/24x/hpg5mr2is/1577820877.jpg" style="height:40px; width:40px"> <% } %>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        
          <img src="<%= report.pic.Replace("~/", "") %>" alt="Report image">
        
       
      </div>
    </a>
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
    // Create a marker for each report
<% foreach (var report in ReportData.GetReports()) { %>
          console.log('Latitude: <%= report.Latitude %>, Longitude: <%= report.Longitude %>');
          var marker = new google.maps.Marker({
              position: new google.maps.LatLng(<%= report.Latitude %>, <%= report.Longitude %>),
        map: map,
        title: '<%= report.Location %>'
    });
    var infowindow = new google.maps.InfoWindow({
        content: '<h4><%= report.Location %></h4><p><img src="<%= report.pic.Replace("~/", "") %>" alt="Report image" style="width: 150px; height: 50px;"></p>'
    });
    marker.addListener('click', (function(marker, infowindow) {
        return function() {
            infowindow.open(map, marker);
        };
    })(marker, infowindow));
<% } %>



      }
  
  </script>
</body>