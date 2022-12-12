<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_form.aspx.cs" Inherits="Student_Managment_System.WebForm9" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%-- <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>--%>
    <style>
        .form-group{
            text-align:left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div  id="details" style="margin-left:17rem;">
      <div class="row col-md-10 ">
        <div class="panel panel-primary" >
            <button type="button" class="close" aria-label="Close">
  <span aria-hidden="true" id="cancel_icon" style="color:white;position:relative;top:1rem;right:1rem;">X</span>
</button>
          <div class="panel-heading" style="text-align:left">Student Info</div>
                        
          <div class="panel-body">          
              <div class="form-group">
                <asp:label for="Username" runat="server">Username</asp:label>
                  <label class="required_feild">*</label>
                  <asp:TextBox class="form-control" ID="Username" runat="server"></asp:TextBox>
                  <span class="message" id="Username_span" runat="server"></span>

              </div>
              <div class="form-group">
                <asp:label for="Name" runat="server">Name</asp:label>
                  <label class="required_feild">*</label>
                <asp:TextBox class="form-control" ID="Name" runat="server"></asp:TextBox>
                   <span class="message" id="Name_span" runat="server"></span>
              </div>
              <div class="form-group">
                <asp:label for="Address" runat="server">Address</asp:label>
                  <label class="required_feild">*</label>
                <asp:TextBox class="form-control" ID="Address" runat="server"></asp:TextBox>
                   <span class="message" id="Address_span" runat="server"></span>
              </div>
              <div class="form-group">
                <asp:label for="Class" runat="server">Class</asp:label>
                  <label class="required_feild">*</label>
                <asp:TextBox class="form-control" ID="Class" runat="server"></asp:TextBox>
                   <span class="message" id="Class_span" runat="server"></span>
              </div>
              <div class="form-group">
                <asp:label for="Set_Password" runat="server">Set Password</asp:label>
                  <label class="required_feild">*</label>
                <asp:TextBox class="form-control" ID="Set_Password" runat="server"></asp:TextBox>
                   <span class="message" id="Set_Password_span" runat="server"></span>
              </div>
              <div class="form-group">
                <asp:label for="DOJ" runat="server">DOJ</asp:label>
                  <label class="required_feild">*</label>
                <asp:TextBox class="form-control" ID="DOJ" runat="server"></asp:TextBox>
                  <span class="message" id="DOJ_span" runat="server"></span>
                   </div>
              <div class="form-group">
                <asp:label for="image" runat="server" style="font-size:15px">Profile Image</asp:label>      
                   </div>
<%--              <label style="font-size: 16px;font-weight: 200;text-align:left; position:relative;left:-43.5rem">Profile Image</label>--%>
                  <div class="form-group">
                     <%-- <asp:Image  runat="server" id="imagenFondo" style="height: 12rem; border: 1px solid black; width: 11rem; margin-top: 1rem;" />--%>
                      <label>
                       <img id="imagenFondo" src="#" style="height: 12rem; border: 1px solid black; width: 11rem;cursor:pointer "/>
                      <%--<label class="required_feild">*</label>--%>
                      <span class="message" id="image_span" runat="server"></span>
                      <input type="file" id="addfile" onchange="preview(this)" style=" display:none"/>     
                          </label>
                      <%--<asp:FileUpload runat="server" onchange="preview(this)" ID="fileupload1" />--%>        
                  </div>
          </div>
            
          <div class="panel-footer">
<%--            <asp:Button class="btn btn-primary" ID="btn_submit" OnClientClick="return validate()" runat="server" Text="Submit" OnClick="Unnamed7_Click"  /> --%>
              <%--<div class="row">
                  <div class="col-md-5"></div>
              <button class="btn btn-primary" id="btn_submit" type="button" >Submit</button></div>--%>
              <button class="btn btn-primary" id="btn_submit" type="button" >Submit</button>
              <button class="btn btn-primary" id="btn_update" type="button" style="display:none;" >Update</button>
               <%--<button class="btn btn-primary" id="btn_cancel" type="button"  >Cancel</button>--%>
              <span id="span1" runat="server" style="display:none ;color: blue;">Loading...</span>
              <br />
          </div>
        </div>
      </div>
    </div>
    </form>
</body>
</html>
