<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addmarks.aspx.cs" Inherits="Student_Managment_System.addmarks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
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
                   #form1 {
            margin-top: -80px;
        }
        p{
            font-size:20px;
            text-align: left;
        }

        .img1 {
            width: 190px;
            float: right;
        }

        #between {
            margin-top: -175px;
            margin-left: 254px;
        }
        .btn{
            border-radius:5px;
            cursor:pointer;
        }
        .textbox{
            width: 160px;
    height: 24px;
        }
        .btn:hover{
            transform:scale(1.015);

        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: x-large;
            color: #FF0066;
        }
        #addmarks{
            font-weight: 500;
    width: 118px;
    font-size: 21px;
    color: white;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
       


        <p>
            &nbsp;
        </p>
        <p class="auto-style1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style2"><strong>Student Managment System</strong></span></p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Student Id:&nbsp;
            <asp:TextBox Class="textbox" ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maths:
            <asp:TextBox Class="textbox" ID="TextBox2" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Science:
            <asp:TextBox Class="textbox" ID="TextBox3" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; English:
            <asp:TextBox Class="textbox" ID="TextBox4" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Social Science:
            <asp:TextBox Class="textbox" ID="TextBox5" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Language:
            <asp:TextBox Class="textbox" ID="TextBox6" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button  Class="btn" ID="Button1" runat="server" BackColor="#006600" BorderWidth="0px" ForeColor="White" Height="35px" Text="Save" Width="150px" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button Class="btn" ID="Button2" runat="server" BackColor="#0066FF" BorderWidth="0px" ForeColor="White" Height="35px" Text="Update" Width="150px" OnClick="Button2_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button Class="btn" ID="Button3" runat="server" BackColor="Red" BorderWidth="0px" ForeColor="White" Height="35px" Text="Delete" Width="150px" OnClick="Button3_Click" />
        </p>
        <header>
            <nav>
               <ul class="navbar-nav">

                    <li class="nav-item active">
                        <a href="Teacher_Dashboard.aspx" class="nav-link" id="dashboard">Dashboard </a>
                    </li>
                  
                     <li class="nav-item active">
                        <a href="addmarks.aspx" class="nav-link" id="addmarks">Add marks</a>
                    </li>
                    <li class="nav-item active">
                        <a href="Login.aspx" class="nav-link">Logout </a>
                    </li>
                </ul>
            </nav>
        </header>


        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" CellPadding="3" Width="1000px" HorizontalAlign="Center" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        </p>


    </form>
    
</body>
</html>

<script>
    var name = document.getElementById("TextBox1").value;
    if (name == "") {
        name.style.border = "1px solid red";
    }
</script>
