﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="project2.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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






          body {
          font-family: Arial, sans-serif;
          background-color:#B2D3C2;
        }
        .form-box {
            width: 700px;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .form {
            width: 100%;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            padding: 40px;
         
        }
        .form h2 {
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        input[type="text"],
        textarea {
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
    <br />
    


    <form id="form1" runat="server">


        <div class="form-box">
        <div class="form">
            <h2>Report Submission</h2>
            
                <label for="location">Location:</label>
                <asp:TextBox ID="txtLocation" runat="server" required="required" CssClass="form-control"></asp:TextBox>

                <label for="description">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" required="required" CssClass="form-control"></asp:TextBox>

                <label for="location">Highlights:</label>
                <asp:TextBox ID="txthighlight" runat="server" required="required" CssClass="form-control"></asp:TextBox>

                <label for="photo">Photo:</label>
            
                <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" Width="329px"/>

             <input type="hidden" id="latitude" name="latitude" />
            <input type="hidden" id="longitude" name="longitude" />

           
        <br />
            <label for="loc">Pick the Location:</label>
        <br />

        <div>
            <div id="googleMap" style="width: 620px; height: 700px;"></div>
             <br />
        <br />
            
             <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary"  Height="45px" Width="86px" OnClick="btnSubmit_Click" />
        </div>

    </div>
        
     </div>

<script>
    function validateForm() {
        var location = document.getElementById("txtLocation").value;
        var description = document.getElementById("txtDescription").value;
        var highlight = document.getElementById("txthighlight").value;

        if (location === "" || description === "" || highlight === "") {
            alert("Please fill in all the required fields.");
            return false; 
        }
    }
</script>




    </form>
    <script defer="">
        function myMap() {
                var longitudeField = document.getElementById("longitude");
                latitudeField.value = location.lat();
                longitudeField.value = location.lng();

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbZz5VC1Z7oaNltnHrFXtsDB-kMwnI698&callback=myMap" defer=""></script>
</body>
</html>