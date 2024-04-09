<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GCpanel2.aspx.cs" Inherits="project2.GCpanel2" %>

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



* {
  box-sizing: border-box;
  
}

/* Set default font family, size and color */
body {
  font-family: Arial, sans-serif;
  font-size: 16px;
  color: #333;
  background-color:#B2D3C2;
}

/* Center the report container */
#report-container {
  width: 500px;
  height: auto;
  margin: auto;
  padding: 60px;
  border: 1px solid #ccc;
  box-shadow: 0 0 10px #ccc;
  border-radius:10px;
  background-color:white;
}

/* Style the report details heading */
.auto-style6 {
  margin: 0;
  font-size: 24px;
  font-weight: bold;
  text-align: center;
}

/* Style the table cells */
td {
  padding: 10px;
}

/* Style the table headers */
th {
  padding: 10px;
  text-align: left;
  background-color: #eee;
}

/* Style the location label */
#lblLocation {
  font-weight: bold;
}

/* Style the pic image */
#imgPic {
  display: block;
  max-width: 100%;
  height: auto;
  margin: auto;
}

/* Style the status label */
#imgapprove {
  font-weight: bold;
  color: green;
}

/* Style the highlights label */
#lblHighlights {
  font-weight: bold;
}

/* Style the description label */
#lbldiscription {
  text-align: justify;
}

/* Style the date and submitted by labels */
#lbldate, #lblby {
  font-style: italic;
}

/* Style the update button */
#btnUpdate {
  margin-top: 10px;
}


        .auto-style7 {
            width: 413px;
            height: 398px;
        }
        .auto-style8 {
            width: 151px;
        }


    </style>
</head>
    
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







<body style="height: 555px">
    <div id="report-container">
    <form id="form1" runat="server">
        <div>
            <h2 class="auto-style6">&nbsp;Report Details</h2>
            <hr />
            <table class="auto-style7">
                <tr>
                    <td class="auto-style8" style="text-align: center; line-height: 6px; font-weight: bold;">Location:</td>
                    <td class="auto-style13"><asp:Label ID="lblLocation" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style8" style="text-align: center; line-height: 6px; font-weight: bold;">Pic:</td>
                    <td class="auto-style11"><asp:Image ID="imgPic" runat="server" /></td>
                </tr>
                <tr>
                    <td class="auto-style8" style="text-align: center; line-height: 6px; font-weight: bold;">Approved:</td>
                    <td class="auto-style19"><asp:Label ID="imgapprove" runat="server"></asp:Label></td>
                </tr>
                
                <tr>
                    <td class="auto-style8" style="text-align: center; line-height: 6px; font-weight: bold;">Highlights:</td>
                    <td class="auto-style21"><asp:Label ID="lblHighlights" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style8" style="text-align: center; line-height: 6px; font-weight: bold;">Discription:</td>
                    <td class="auto-style15"><asp:Label ID="lbldiscription" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    
                    <td class="auto-style8" style="text-align: center; line-height: 6px; font-weight: bold;">Submitted On:</td>
                    <td><asp:Label ID="lbldate" runat="server"></asp:Label></td>
                </tr>
                 <tr>
                    <td class="auto-style8" style="text-align: center; line-height: 6px; font-weight: bold;">Submitted by:</td>
                    <td><asp:Label ID="lblby" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style8" style="text-align: center; line-height: 6px; font-weight: bold;">Approve:</td>
                    <td>
                        <asp:RadioButton ID="radYes" runat="server" Text="yes" GroupName="Approval" />
                        <asp:RadioButton ID="radNo" runat="server" Text="no" GroupName="Approval" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="BtnUpdate_Click" />
                    </td>
               </tr>
              
            </table>
            
        </div>
    </form>
        </div>
</body>
</html>


