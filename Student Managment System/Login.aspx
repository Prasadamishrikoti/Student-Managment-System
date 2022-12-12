<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Student_Managment_System.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Managment System</title>
    <style>
        .auto-style1 {
            text-align: center;
        }
        * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
}

body {
  background: #e35869;
  font-family: 'Rubik', sans-serif;
  background-image:url(https://images.unsplash.com/photo-1494949649109-ecfc3b8c35df?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80);
  background-size:cover;
}
#form1{
    background: #fff;
  width: 490px;
  margin: 65px auto;
  display: -webkit-box;
  background-color:black;
  background-color:none;
  opacity:0.9;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
          flex-direction: column;
  border-radius: 10px;
  box-shadow: 0 2px 25px rgba(0, 0, 0, 0.2);
  margin-top:190px;
  
}
#Button1{
     width: 15%;
  border: none;
  padding: 8px;
  font-family: 'Rubik', sans-serif;
  cursor: pointer;
  text-transform: uppercase;
  background: yellow;
  color: ;
  border-radius:5px;
  letter-spacing: 0.2px;
  outline: 0;
  -webkit-transition: all .3s;
  transition: all .3s;
  opacity:0.9;
}
.textbox{
      font-size: 16px;
  font-family: 'Rubik', sans-serif;
  padding: 10px 1px;
  border: 0;
  border-bottom: 1px solid #747474;
  outline: none;
  opacity:1;

}
#Button1:hover{
    background:#f7d502;
     transform: scale(1.03);
}
#Forgot{
    text-align:center;
    text-decoration:none;
}

.id{
    color:white;
}
    </style>
</head>

<body >
    <form id="form1" runat="server">
      
        <div class="auto-style1">

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            &nbsp;<asp:Label ID="Label1" runat="server" ForeColor="#66FFFF" Text="School Managment System" Font-Size="X-Large" CssClass="auto-style1"></asp:Label>
            <br />
            <br />
            
            <asp:Label ID="Label3" runat="server" Font-Size="23px" Text=" Login" ForeColor="#FFFF99"></asp:Label>
&nbsp;
            <br />
            <br />
            <span class="id">User Name:</span>&nbsp;
            <asp:TextBox ID="TextBox1" class="textbox" placeholder="Username" runat="server" ></asp:TextBox>
            <br />
            <br />
            <span class="id">Password:</span>&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" class="textbox"  placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button  ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
            <br />    <%-- <a id="forgot" href="Forgot_Password.aspx">Forgot Password</a>--%>
            <br />
            &nbsp;<asp:Label ID="Label2" runat="server"></asp:Label>

        </div>
    <p>
        &nbsp;</p>
    </form>
    </body>
</html>
    