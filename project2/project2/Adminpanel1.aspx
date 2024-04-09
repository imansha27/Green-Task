<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminpanel1.aspx.cs" Inherits="project2.Adminpanel1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Green Captains Accounts Management</title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <style type="text/css">
        body{
             background-color:#B2D3C2;
        }
        
        .form-box {
            margin: 50px auto;
            max-width: 800px;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            background-color: white;
            color: rgba(110, 110, 110);
        }

        .form-box h2 {
           
            font-size: 40px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 40px;
            width: 100%;
            text-decoration:underline;
        }

        .form-box label {
            display: inline-block;
            width: 150px;
            margin-right: 10px;
            font-size: 18px;
            font-weight: bold;
        }

        .form-box input[type="text"],
        .form-box input[type="email"],
        .form-box textarea {
            width: 40%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            margin-bottom: 20px;
            box-sizing: border-box;
            background-color: #f2f2f2;
           
        }

        .form-box input[type="file"] {
            display: block;
            margin-bottom: 20px;
        }

        .form-box button {
            margin-top: 20px;
          
        }

        .datagrid-box {
            margin: 50px auto;
            max-width: 800px;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            background-color: white;
            color: rgba(110, 110, 110);

        }

        .datagrid-box table {
            border-collapse: collapse;
            width: 100%;
        }

        .datagrid-box th {
           
            background-color: #f2f2f2;
            font-weight: bold;
             text-align:center;
        }

        .datagrid-box td, .datagrid-box th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .datagrid-box tr {
                 background-color: #fff;
        }

       
        .auto-style1 {
            margin-left: 426px;
            margin-top: 8px;
        }
        .auto-style4 {
            margin-left: 140px;
        }
        .auto-style5 {
            margin-left: 140px;
        }
        .auto-style6 {
            margin-left: 140px;
        }
        .auto-style7 {
            margin-left: 140px;
        }
        .auto-style8 {
            margin-left: 140px;
        }
        .auto-style9 {
            width: 234px;
        }
         


        .bt{
            padding-left:475px
        }



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



        </style>
</head>
    <body>



<form id="form1" runat="server" enctype="multipart/form-data">
         
            
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


          <div class="form-box">
   


            <h2>Add Green Captains</h2>
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <label class="auto-style9">First Name:</label>
                <asp:TextBox ID="TextBox1" runat="server" required="required" CssClass="auto-style8"></asp:TextBox>
            </div>
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <label>Last Name:</label>
                <asp:TextBox ID="TextBox2" runat="server" required="true"  CssClass="auto-style4"></asp:TextBox>
            </div>
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <label>Age:</label>
                <asp:TextBox ID="TextBox3" runat="server" required="true"  CssClass="auto-style6"></asp:TextBox>
            </div>
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <label>City:</label>
                <asp:TextBox ID="TextBox4" runat="server" required="true"  CssClass="auto-style5"></asp:TextBox>
            </div>
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <label>Address:</label>
                <asp:TextBox ID="TextBox5" runat="server" required="true"  CssClass="auto-style6"></asp:TextBox>
            </div>
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <label>Email:</label>
                <asp:TextBox ID="TextBox6" runat="server" required="true"  type="email" CssClass="auto-style6"></asp:TextBox>
            </div>
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <label>Username:</label>
                <asp:TextBox ID="TextBox7" runat="server" required="true"  CssClass="auto-style7"></asp:TextBox>
            </div>
              <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <label>Password:</label>
                <asp:TextBox ID="TextBox8" runat="server" required="true"  CssClass="auto-style7"></asp:TextBox>
            </div>
        
        
            <div class="bt">
                <asp:Button ID="Button1" runat="server" Text="Add Account" OnClick="Button1_Click" CssClass="btn btn-primary"  BackColor="#10B30D" BorderColor="#10B30D" />
                
            </div>
        </div>



         <div class="datagrid-box">
            <asp:GridView ID="GridView1" runat="server" CssClass="datagrid" AutoGenerateColumns="False" DataKeyNames="Username" >
                <Columns>
                  
                    <asp:BoundField DataField="FirstName" HeaderText="First Name"  />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name"  />
                    <asp:BoundField DataField="Age" HeaderText="Age" />
                    <asp:BoundField DataField="City" HeaderText="City"  />
                     <asp:BoundField DataField="Address" HeaderText="Address"  />
                    <asp:BoundField DataField="Email" HeaderText="Email"  />
                    <asp:BoundField DataField="Username" HeaderText="Username"  />
                     <asp:BoundField DataField="UserType" HeaderText="UserType"  />
                    <asp:BoundField DataField="JoiningDate" HeaderText="RegisteredDate"  />
                     
            
                   
                </Columns>
            </asp:GridView>
     </div>

    </form>
    </body>
    </html>