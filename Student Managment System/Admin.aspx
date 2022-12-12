<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Student_Managment_System.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard</title>
    <style>
        body {
  font-family: 'Rubik', sans-serif;
}
        .heading{        
            font-size:22px;
            margin-top:-55px;
            color:cornflowerblue;
        }
        #Button1{    
        }
        body {
height: 125vh;
margin-top: 80px;
padding: 30px;
background-size: cover;
font-family: sans-serif;
}
header {
background-color: orange;
position: fixed;
left: 0;
right: 0;
top: 0px;
height: 50px;
display: flex;
align-items: center;
box-shadow: 0 0 25px 0 black;
}
header * {
display: inline;
}
header li {
margin: 20px;
}
header li a {
color: blue;
text-decoration: none;
}
.img{
    width:190px;
    height:188px;
}
#form1{
    margin-top:-80px;
}
.img1{
    width:190px;
    float:right;
}
#between{
   margin-top: -175px;
    margin-left: 254px;
}
        .auto-style1 {
            font-size: 22px;
            margin-top: -55px;
            color: cornflowerblue;
            text-align: left;
        }
        .auto-style2 {
            color: #FF0066;
            font-size: x-large;
            margin-left:20rem;
        }
        #dashboard {
    font-weight: 500;
    width: 118px;
    font-size: 21px;
    color: white;
}
        </style>
</head>
<body>
<header>
<nav>
                <ul class="navbar-nav">

                    <li class="nav-item active">
                        <a href="Admin.aspx" class="nav-link" id="dashboard">Dashboard </a>
                    </li>
                     <li class="nav-item active">
                        <a href="addstudents.aspx" class="nav-link" id="addstudents">Manage Students </a>
                    </li>
                    
                    <li class="nav-item active">
                        <a href="Fees.aspx" class="nav-link">Fees </a>
                    </li>
                    <li class="nav-item active">
                        <a href="Login.aspx" class="nav-link">Logout </a>
                    </li>
                </ul>
            </nav>
</header>
    <form id="form1" runat="server">
        <img class="img" src="download.png"/>
                <img id="imagenFondo" style="height: 12rem; border: 1px solid black; width: 11rem; margin-top: 2rem;margin-left: 65rem;"/>
        <div id="between"/>
            <div class="auto-style1"> 
                <strong>
                <span class="auto-style2">Student Managment System</span></strong><br />
                Admin Dashboard&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <p style="font-size:larger">
            Name:
            <asp:Label ID="Label1" runat="server" ></asp:Label>
        </p>
        <p style="font-size:larger">
            Address:<asp:Label ID="Label2" runat="server"></asp:Label>
        </p>

            </div>
    <input type="file" onchange="preview(this)" style="position: relative;top: 1.9rem;right: -77rem;"/>
    <hr />
        <br />      
    </form>  
    </body>
</html>
<script>
    var outImage = "imagenFondo";
    function preview(obj) {
        if (FileReader) {
            var reader = new FileReader();
            reader.readAsDataURL(obj.files[0]);
            reader.onload = function (e) {
                var image = new Image();
                image.src = e.target.result;
                image.onload = function () {
                    document.getElementById(outImage).src = image.src;
                };
            }
        }
        else {
            // Not supported
        }
    } 
</script>