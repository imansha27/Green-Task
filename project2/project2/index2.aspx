<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index2.aspx.cs" Inherits="project2.index2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
     <title>Edit Article</title>
     <webopt:bundlereference runat="server" path="~/Content/css" />
 <style type="text/css">
     body{
          background-color:#B2D3C2;
          
     }
    .container1 {
  display: flex;
  justify-content: center;
  background-color:#B2D3C2;
  margin-top:20px;
  margin-bottom:20px;
 
}

.form-box {
  padding: 40px;
  padding-bottom:20px;
  border-radius: 5px;
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
  background-color: #fff;
  width: 100%;
  max-width: 700px;
  font-family: Arial, sans-serif;
}

.form-box h1 {
  text-align: center;
  font-weight: bold;
  font-size: 30px;
  color: #6E6E6E;
  text-decoration: underline;
}

.form-box label {
  display: block;
  font-size: 18px;
  font-weight: bold;
  color: #6E6E6E;
  margin-bottom: 10px;

}

.form-box input[type="text"], 

.form-box textarea {



    width: 100%;
    padding: 10px;
    border-radius: 5px;
     border: 1px solid #ccc;
      margin-bottom: 20px;
     box-sizing: border-box;
     max-width: 700px;
       resize: none;
}

 input[type="file"] {
            margin-bottom: 20px;
        }



.form-box input[type="submit"], 
.form-box input[type="button"] {
  display: inline-block;
  background-color: #4CAF50;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
}

.form-box input[type="submit"]:hover, 
.form-box input[type="button"]:hover {
  background-color: #3e8e41;
}



          /* Colors */
     :root {
            --primary-color: #165611;
            --secondary-color: #FFFFFF;
            --tertiary-color: #6E6E6E;
          
        }

        /* Navbar */
      .navbar {
           /* background-color: var(--secondary-color);
            color: var( --primary-color);*/
            /*padding: 10px 0;*/

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
           /* font-weight: 800;*/
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







</style>


</head>


<body>
      <nav class="navbar navbar-expand-sm navbar-toggleable-sm">
            
        <div class="container">
                <a class="navbar-brand" runat="server">Green Task</a>
                    <ul class="navbar-nav flex-grow-1">
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Reportpanel">Report List</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/index">Submit a Report</a></li>
                        <li class="nav-item"><a class="nav-link1" runat="server" href="~/Login">Log-out</a></li>
                    </ul>
               </div>
            
        </nav>
 
    <div class="container1">
        
        <div class="form-box">
            <form id="form1" runat="server" enctype="multipart/form-data">
                <h1>Edit Report</h1>
                  <br />
    <br />
                <label for="txtLocation">Location:</label>
                <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox><br /><br />
                <label for="fuPicture">Picture:</label>
                <asp:FileUpload ID="fuPicture" runat="server" /><br /><br />
                 <label for="txtHighlights">Highlights:</label>
                <asp:TextBox ID="txtHighlights" runat="server"></asp:TextBox><br /><br />
                <label for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="10" Columns="50"></asp:TextBox><br /><br />
                <input type="hidden" id="latitude" name="latitude" />
            <input type="hidden" id="longitude" name="longitude" />
        <br />
            <label for="loc">Pick the Location:</label>
        <br />


        <div>
            <div id="googleMap" style="width: 620px; height: 700px;"></div>
             <br />
        <br />

            
                
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
           
        </div>
    </div>

    <script>
    function validateForm() {
        var location = document.getElementById("txtLocation").value;
        var description = document.getElementById("txtDescription").value;
        var highlight = document.getElementById("txtHighlight").value;

        if (location === "" || description === "" || highlight === "") {
            alert("Please fill in all the required fields.");
            return false; 
        }
    }
</script>




   </form>
    <script defer="">
        function myMap() {            var mapProp = {                center: new google.maps.LatLng(7.8731, 80.7718),                zoom: 7,                mapTypeId: google.maps.MapTypeId.ROADMAP            };            var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);            var infowindow = new google.maps.InfoWindow();            var marker, i;            google.maps.event.addListener(map, 'click', function (event) {                placeMarker(map, event.latLng);            });            var marker = null;            function placeMarker(map, location) {                if (marker != null) {                    marker.setMap(null);                }                marker = new google.maps.Marker({                    position: location,                    map: map                });                var infowindow = new google.maps.InfoWindow({                    content: 'Latitude: ' + location.lat() +                        '<br>Longitude: ' + location.lng()                });                infowindow.open(map, marker);                var latitudeField = document.getElementById("latitude");
                var longitudeField = document.getElementById("longitude");
                latitudeField.value = location.lat();
                longitudeField.value = location.lng();            }        }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbZz5VC1Z7oaNltnHrFXtsDB-kMwnI698&callback=myMap" defer=""></script>




</body>

</html>
