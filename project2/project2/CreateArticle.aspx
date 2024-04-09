<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateArticle.aspx.cs" Inherits="project2.CreateArticle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
   
<head runat="server">
     <title></title>
   <webopt:bundlereference runat="server" path="~/Content/css" />
 <style type="text/css">
html, body {
  height: 100%;
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  
 background-color:#B2D3C2;
        
}

.wrapper {
  
  flex-direction: column;
  height: 100%;
  
  margin-left: 300px;
  margin-right:300px;
  background-color: white;
  border-radius: 10px;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  padding: 20px 5px;
  margin: 0 auto; 
  max-width: 500px;

}

h2 {
  text-align: center;
  font-weight: bold;
  display: block;
  margin-bottom: 20px;
  text-decoration:underline;

  color: #333;
}

.form-group {
  margin-bottom: 20px;
 
}

label {
  font-weight: bold;
  display: block;
  margin-bottom: 5px;
  color: #555;

  
  
}

.form-control {
  width: 100%;
  padding: 10px;
  border-radius: 5px;
  border: 1px solid #ccc;
  color: #333;
  font-size: 16px;
}

.form-control[rows="5"] {
  resize: none;
  
}

.btn {
  display: inline-block;
  padding: 10px 20px;
  border-radius: 5px;
  border: none;
  background-color: #007bff;
  color: #fff;
  cursor: pointer;
  font-size: 16px;
  text-transform: uppercase;
  transition: all 0.3s ease;
}

.btn-primary {
  background-color:#10b30d;
}

.btn-primary:hover {
  background-color:#3e8e41;
}

.btn:active {
  background-color: #4d9e50;
  box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
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
    <form runat="server" method="post">
        <center>
        <div class="wrapper">
        <h2>Add Article</h2>
            <br />
        <div class="form-group">
            <label for="heading">Heading</label>
            <asp:TextBox ID="HeadingTextBox" runat="server" CssClass="form-control" required="true"></asp:TextBox>
        </div>
            <br />
        <div class="form-group">
             <label for="fuPicture">Picture:</label>
                <asp:FileUpload ID="fuPicture" runat="server" /><br /><br />
        </div>
             <br />
        <div class="form-group">
            <label for="description">Description</label>
            <asp:TextBox ID="DescriptionTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" required="true"></asp:TextBox>
        </div>
       
        <asp:Button ID="SubmitButton" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="SubmitButton_Click" />
   
     </div>
            </center>
     </form>
   
</body>
</html>
