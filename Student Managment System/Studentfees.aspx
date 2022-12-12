<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Studentfees.aspx.cs" Inherits="Student_Managment_System.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        body 
{
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
            text-align: center;
        }
        .auto-style2 {
            color: #FF0066;
            font-size: x-large;
        }
    
        #fees{
            font-weight: 500;
    width: 118px;
    font-size: 21px;
    color: white;
        }

        td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
        table{
            background-color:#FFCC00;
        }
        

        </style>
</head>
<body>
    
<header>
<ul class="navbar-nav">

                    <li class="nav-item active">
                        <a href="StudentDashboard.aspx" class="nav-link" id="dashboard">Dashboard </a>
                    </li>
                  
                     <li class="nav-item active">
                        <a href="Result.aspx" class="nav-link" id="addmarks">View Result</a>
                    </li>
                    <li class="nav-item active">
                        <a href="Studentfees.aspx" class="nav-link" id="fees">Fees </a>
                    </li>
                           <li class="nav-item active">
                        <a href="Login.aspx" class="nav-link">Logout </a>
                    </li>
                </ul>
</header>

    <form id="form1" runat="server">
        <img class="img" src="data:image/png;base64,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"/>
                <img class="img1" src="data:image/png;base64,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"/><div id="between">
            <div class="auto-style1"> 
                <strong>
                <br />
                <span class="auto-style2">Student Managment System</span></strong><br />
            Student Dashboard&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <p style="font-size:larger">
            Name:
            <asp:Label ID="Label1" runat="server" ></asp:Label>
        </p>
        <p style="font-size:larger">
            Subject:<asp:Label ID="Label2" runat="server"></asp:Label>
        </p>
        <p style="font-size:larger">
            UserId:<asp:Label ID="Label3" runat="server"></asp:Label>
        </p>
            </div>
    
    <hr />
  
        <br />
        <div id="tbl2" runat="server">
    <table >
  <tr>
    <th>Total Fees</th>
    <th>Paid Fees</th>
    <th>Paid On</th>
      <th>Balance Fees</th>
     
  </tr>
  <tr>
    <td>
        <asp:Label ID="Label4" runat="server"></asp:Label>
      </td>
    <td>
        <asp:Label ID="Label5" runat="server"></asp:Label>
      </td>
    <td>
        <asp:Label ID="Label6" runat="server"></asp:Label>
      </td>
      <td>
          <asp:Label ID="Label7" runat="server"></asp:Label>
      </td>
  </tr>
 
  
  
</table>
           </div>
       
    </form>
    
    </body>
</html>

