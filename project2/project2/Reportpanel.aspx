<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reportpanel.aspx.cs" Inherits="project2.Reportpanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

   
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <style type="text/css">
    body {
        font-family: Arial, Helvetica, sans-serif;
       background-color:#B2D3C2;
    }
    
    h1 {
        text-align: center;
        margin-top: 40px;
        margin-bottom: 30px;
        color: #696969;
        font-size: 45px;
        font-weight: bold;
        text-decoration: underline;
    }
    
    #form1 {
        margin: 0 auto;
        width: 90%;
        max-width: 1200px;
       
      
        

       
    }
    
    .button {
        display: inline-block;
        padding: 2px 14px;
        margin: 10px 5px;
        background-color:#10b30d;
        color: white;
        font-size: 16px;
        text-decoration: none;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .button1 {
        display: inline-block;
        padding: 2px 5px;
        margin: 10px 5px;
        background-color:#FF0000;
        color: white;
        font-size: 16px;
        text-decoration: none;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    
    .button:hover {
        background-color: #3e8e41;
    }
    
    .button1:hover {
        background-color: #d34c75;
    }
    
    #ReportList {
        border-collapse: collapse;
        width: 100%;
         background-color:#ffffff;
    }
    
    #ReportList td, #ReportList th {
        border: 1px solid #ddd;
        padding: 8px;
       
    }
  
    
    #ReportList tr:hover {background-color: #ddd;}
    
    #ReportList th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: left;
        background-color:rgba(110, 110, 110); 
        color:#000000;
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
                       <li class="nav-item">
                             <a class="nav-link1" runat="server" href="~/Login">Log-out</a>
                        </li>
                    </ul>
               </div>
            
        </nav>







    <form id="form1" runat="server">
    <h1>Reports List</h1>
    <div>
        <asp:Button runat="server" ID="AddButton" Text="Add a Report" CssClass="button" OnClick="AddButton_Click" />
        
       <asp:GridView ID="ReportList" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="Location" HeaderText="Location" />
                <asp:ImageField DataImageUrlField="pic" HeaderText="Picture" ControlStyle-Width="100" ControlStyle-Height="100" />
                <asp:BoundField DataField="Highlights" HeaderText="Highlights" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="Submittedby" HeaderText="Submitted by" />
                <asp:BoundField DataField="Date" HeaderText="Submitted Date" />
                <asp:BoundField DataField="Approved" HeaderText="Approved" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button runat="server" ID="EditButton" Text="Edit" PostBackUrl='<%# "index2.aspx?Id=" + Eval("ID") %>' CssClass="button" />
                        <asp:Button runat="server" ID="DeleteButton" Text="Delete" CommandArgument='<%# Eval("ID") %>' OnClick="DeleteButton_Click" CssClass="button1" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
          
    </div>
</form>

</body>
</html>
