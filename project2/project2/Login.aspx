
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="project2.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions" %>

    <style>
        body{
            background-color:#B2D3C2;
        }

        main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            
        }
        

        .wrapper {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow:0 2px 4px #234F1E;
            padding: 30px;
            padding-left :50px;
             padding-right :50px;

        }

        .title {
            font-size: 34px;
            font-weight: bold;
            text-align: center;
            color: rgba(110, 110, 110);
            margin-bottom: 20px;
          
            
        }

        .inputfield {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color:rgba(110, 110, 110); 
            font-weight: bold;
        }

        .custom_select {
            position: relative;
        }
        .form input[type="text"],
        .form input[type="password"],
        .form select {
            background-color: rgba(242, 242, 242);
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            margin-top: 5px;
        }


        .form input[type="text"]:focus,
        .form input[type="password"]:focus,
        .form select:focus {
            outline: none;
            box-shadow: 0 0 2px rgba(186, 255, 57);
        }

      
       
     </style>
    <body>
        <main aria-labelledby="title">
       
      

        <div class="wrapper">
            <div class="title">
               User Login
            </div>
            <div class="form">
                <div class="inputfield">
                    <label for="Usertyp">Status</label>
                    <div class="custom_select">
                        <asp:DropDownList ID="Usertyp" runat="server" Width="221px">
                            <asp:ListItem>GTF Member</asp:ListItem>
                            <asp:ListItem>Green Captain</asp:ListItem>
                            <asp:ListItem>Web Master (Admin)</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div> 

                <div class="inputfield">
                    <label for="txtUser" style="height: 29px">Username</label>
                    <asp:TextBox ID="txtUser" placeholder="Username" runat="server" Width="221px"></asp:TextBox>
                </div> 

                <div class="inputfield">
                    <label for="txtPass" style="height: 24px">Password</label>
                    <asp:TextBox ID="txtPass" placeholder="Password" runat="server" TextMode="Password"  Width="221px" ></asp:TextBox>
                </div>  
                <br />
                <div class="inputfield">
                    <asp:Button ID="loginbtn" runat="server" OnClick="loginbtn_Click" CssClass="btn btn-primary" Text="Login" Width="105px" BackColor="#10B30D" BorderColor="#10B30D" />
                    &nbsp;
                    
                    <asp:Button ID="Regisbtn" runat="server" OnClick="Regisbtn_Click" CssClass="btn btn-primary" Text="Register" Width="105px" BackColor="#10B30D" BorderColor="#10B30D" />
                </div>
            </div>
        </div>

    </main>
        </body>
</asp:Content>