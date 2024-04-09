
 <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="project2.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body{
            background-color: #B2D3C2;
        }
        .wrapper {
            display: flex;
            justify-content: center; 
        }
        table {
            display: flex;
            flex-wrap: wrap;
           background-color: #ffffff;
            border-radius: 10px;
            box-shadow:0 2px 4px #234F1E;
            padding: 20px;
            padding-left: 50px;
            padding-right: 50px;
            font-size: 18px;
            font-weight: bold;
            color: rgba(110, 110, 110);
        }
        .title {
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            width: 100%;
        }
        .inputbx {
            flex-basis: 48%;
            margin-bottom: 25px;
        }
        input[type="text"], input[type="email"], input[type="password"], select {
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: none;
            background-color: #f1f1f1;
            box-sizing: border-box;
            background-color: rgba(242, 242, 242);
        }
        input[type="text"], input[type="email"], input[type="password"], focus {
            outline: none;
           
        }


 
        . input[type="text"]:focus,
        .input[type="password"]:focus,
        . select:focus {
            outline: none;
            box-shadow: 0 0 2px rgba(186, 255, 57);
        }

        .auto-style9 {
            width: 151px;
        }
        .auto-style13 {
            margin-bottom: 16px;
        }
        .auto-style14 {
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            width: 97%;
            height: 50px;
        }
        .auto-style18 {
            height: 65px;
        }
        .auto-style22 {
            width: 15px;
            height: 65px;
        }
        .auto-style23 {
            height: 69px;
            width: 134px;
        }
        .auto-style24 {
            width: 15px;
            height: 69px;
        }
        .auto-style25 {
            height: 77px;
        }
        .auto-style27 {
            height: 65px;
            width: 134px;
        }
        .auto-style28 {
            height: 77px;
            width: 134px;
        }

    </style>
    <html>
        <body>
    <div class="wrapper">
        <div class="form">
            <table>
                <tr>
                    <td colspan="4">
                        <div class="auto-style14">
                            User Registration
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        <label for="txtfname">First Name:&nbsp;&nbsp; </label>
                    </td>
                    <td class="auto-style18">
                        <asp:TextBox ID="txtfname" runat="server" placeholder="First Name" required="required" Height="39px" Width="143px"></asp:TextBox>
                    </td>
                    <td class="auto-style27">
                        <label for="txtlname" class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Last Name:</label>
                    </td>
                    <td class="auto-style22">
                        <asp:TextBox ID="txtlname" runat="server" placeholder="Last Name" required="required"  Height="39px" Width="143px" CssClass="auto-style13"></asp:TextBox>
                    </td>
                </tr>
               
                 <tr>
                    <td class="auto-style18">
                         <label for="txtage">Age:</label>
                    </td>
                    <td class="auto-style18">
                        <asp:TextBox ID="txtage" runat="server" placeholder="Age" required="required" Height="39px" Width="143px"></asp:TextBox>
                    </td>
                    <td class="auto-style27">
                       <label for="txtcity" class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; City:</label>
                    </td>
                    <td class="auto-style22">
                      <asp:TextBox ID="txtcity" runat="server" placeholder="City" required="required" Height="39px" Width="143px"></asp:TextBox>
                    </td>
                </tr>

                 <tr>
                     <td>
                         <label for="txtpostal">Postal Code:</label>
                     </td>
                     <td>
                          <asp:TextBox ID="txtpostal" runat="server" placeholder="Postal Code" required="required" Height="39px" Width="143px"></asp:TextBox>
                     </td>
                     <td class="auto-style23">
                         <label for="txtemail">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:</label>
                    </td>

                    <td class="auto-style24">
                        <asp:TextBox ID="txtemail" TextMode="Email" runat="server" placeholder="Email" required="required" Height="39px" Width="143px"></asp:TextBox>
                    </td>   
                </tr>
                <tr>
                     <td>
                         <label for="txtuname">Username:</label>
                     </td>
                     <td>
                          <asp:TextBox ID="txtuname" runat="server" placeholder="Username" required="required" Height="39px" Width="143px"></asp:TextBox>
                     </td>
                     <td class="auto-style23">
                         <label for="txtPass">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password:</label>
                    </td>

                    <td class="auto-style24">
                        <asp:TextBox ID="txtPass" TextMode="Password" runat="server" placeholder="Password" Required="true" Height="39px" Width="143px"></asp:TextBox>
                    </td> 
                    
                </tr>

                    <tr>
                     <td class="auto-style18">
                         <label for="txtadd">Address:</label>
                    </td>
                    <td class="auto-style18" colspan="2">
                        <asp:TextBox ID="txtadd" runat="server" placeholder="Address" required="required" Height="39px" Width="248px"></asp:TextBox>
                    </td>
                </tr>



                <tr>  <td class="auto-style25" colspan="2"> 
                        </td>
                    <td class="auto-style28"> 
                     <asp:Button ID="Reg2btn" runat="server" OnClick="Reg2btn_Click" CssClass="btn btn-primary" Text="Register" Width="105px" BackColor="#10B30D" BorderColor="#10B30D" />
                        </td>
                </tr>


                 </table>

              </div>
        </div>
    </body>
    </html>
</asp:Content>