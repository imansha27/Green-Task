<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditArticle.aspx.cs" Inherits="project2.EditArticle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
     <title>Edit Article</title>
     <webopt:bundlereference runat="server" path="~/Content/css" />
 <style type="text/css">
     body{
            background-color:#B2D3C2;
        }

    .container {
  display: flex;
  justify-content: center;
  
 
}

.form-box {
  padding: 40px;
  padding-bottom:20px;
  border-radius: 5px;
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
  background-color: white;
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
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Adminpanel1">Add GC</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Adminpanel2">Add Articles</a></li>
                        <li class="nav-item"><a class="nav-link1" runat="server" href="~/Login">Log-out</a></li>
                    </ul>
               </div>
            
        </nav>
 

    <br />
    
    

    <div class="container">
        <div class="form-box">
            <form id="form1" runat="server" enctype="multipart/form-data">
                <h1>Edit Article</h1>
                  <br />
    <br />
                <label for="txtHeading">Heading:</label>
                <asp:TextBox ID="txtHeading" runat="server"></asp:TextBox><br /><br />
                <label for="fuPicture">Picture:</label>
                <asp:FileUpload ID="fuPicture" runat="server" /><br /><br />
                <label for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="10" Columns="50"></asp:TextBox><br /><br />
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </form>
        </div>
    </div>
</body>

</html>
