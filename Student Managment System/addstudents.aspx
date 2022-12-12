 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addstudents.aspx.cs" Inherits="Student_Managment_System.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head runat="server">
    <title></title>
    <%--<meta name = "viewport" content = "width = device-width, initial-scale = 1.0"/>--%>
    <script src="Scripts/jquery-3.4.1.intellisense.js"></script>
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/jquery-3.4.1.slim.js"></script>
    <script src="Scripts/jquery-3.4.1.slim.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"/>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.8.0.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.22/jquery-ui.js"></script>

    <script>
        //function filterresult() {
        //    var searchname = $("#TextBox1").val();
        //    $.ajax({
        //        type: "POST",
        //        url: "../addstudents.aspx/Filterresults",
        //        data: '{name:' + JSON.stringify(searchname) + '}', 
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        async: true,
        //        success: function (data) {
        //            let tbl = $('#tbody');
        //            tbl.empty();
        //            $.each(data.d, function () {
                        
        //                    $("#tbody").append("<tr><td>" + this.Student_Userid + "</td><td>" + this.name + "</td><td>" + this.address + "</td><td>" + this.Class + "</td><td>" + this.DOJ + "</td></tr>");               
        //            });
        //        },
        //        error: function (xhr, status, err) {
        //            _Loader_Hide($(".Response").closest(".panel-body"));
        //            var err = eval("(" + xhr.responseText + ")");
        //            fn_DialogBox(err.Message);
        //        }
        //    });
        //}
        function SearchText() {
            $("#TextBox1").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "./addstudents.aspx/Autocomplete",
                        data: "{ 'atocomplete':'" + request.term + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("No Match");
                        }
                    });
                }
            });
        }
        var temp = 1;
            function nextdata() {
            temp = temp + 1;
            getstudent_details(temp);
        }
        function previousdata() {

            temp = temp - 1;
            getstudent_details(temp);
            if (temp <= 0) {
                temp = 1;
            }
           
        }
        $(document).ready(function () {
            $('#Search_fromdate').datepicker({ dateFormat: 'dd-M-yy' }).val();
            $('#Search_todate').datepicker({ dateFormat: 'dd-M-yy' }).val();
            SearchText();
            getstudent_details(1);
            $("#show").click(function () {
                /*$('#abcd').load('Student_form.aspx');*/
                $("#abcd").css("display", "block");
                $("#abcd").load("Student_form.aspx", function () {
                    $('#imagenFondo').attr('src', "add.png");
                    $('#DOJ').datepicker({ dateFormat: 'dd-M-yy' }).val();
                    $("#cancel_icon").click(function () {
                        $("#abcd").css("display", "none");
                    })
                    $("#btn_cancel").click(function () {
                        $("#abcd").css("display", "none");
                    })
                    register_submit();
                });
                //$('#btn_update').css('display', 'none');
                //if ($('#details').css('display') == 'none')
                //{
                //    $('#details').show();
                //}
                //else
                //{
                //    $('#details').hide();
                //}
                //$("#btn_submit").show();
                //document.getElementById("span1").style.display = "none";
               <%-- $("#<%=Username.ClientID%>").val("");
                $("#<%=Name.ClientID%>").val("");
                $("#<%=Address.ClientID%>").val("");
                $("#<%=Class.ClientID%>").val("");
                $("#<%=Set_Password.ClientID%>").val("");
                $("#<%=DOJ.ClientID%>").val("");--%>
                /*document.getElementById("imagenFondo").src = null;*/
                
                $('#imagenFondo').css('opacity', "0.8");
            })
            $('#DOJ').datepicker({ dateFormat: 'dd-M-yy' }).val();
            
        })
        function register_submit() {
            $('#btn_submit').click(function () {
                if (validate()) {
                    /* blah.src = URL.createObjectURL(file)*/
                    /*  var filePath = $('#addfile').val();*/
                    var imagesrc = document.getElementById("imagenFondo").src;
                    if (imagesrc == "https://localhost:44360/add.png") {
                        imagesrc = null;
                    }
                    var student = {};
                    student.Username = $("#Username").val();
                    student.name = $("#Name").val();
                    student.Class = $("#Class").val();
                    student.address = $("#Address").val();
                    student.Password = $("#Set_Password").val();
                    student.DOJ = $("#DOJ").val();
                    student.image = imagesrc;
                    /*student.image = $("#imagenFondo").src;*/
                    $.ajax({
                        type: "POST",
                        url: "addstudents.aspx/Addstudent",
                        contentType: "application/json; charset=utf-8",
                        data: '{stu:' + JSON.stringify(student) + '}',
                        dataType: "json",
                        success: function (data) {
                            getstudent_details(1);
                            btn_submit.style.display = "none";
                            document.getElementById("span1").style.display = "block";
                            document.getElementById("details").style.display = "none";
                            $("#<%=confirm_message.ClientID%>").html("Student Added Successfully");
                            setTimeout(function () {
                                $("#confirm_message").fadeOut().empty();
                            }, 5000);
                            $("#abcd").css("display", "none");
                                /*$("confirm_message").html("Added")*/
                                /*document.getElementById("confirm_messageb").style.display = "block";*/
                            },
                            error: function (xhr, status, err) {
                                //_Loader_Hide($(".Response").closest(".panel-body"));
                                //var err = eval("(" + xhr.responseText + ")");
                                //fn_DialogBox(err.Message);

                            }
                        });
                        ;
                    }
                })
        }
        function activate(Student_Userid) {
            /*var x = confirm("Are you sure you want to Activate?");*/
            temp = 1;
            $("#activate_confirmation").click(function () {
                $.ajax({
                    type: "POST",
                    url: "../addstudents.aspx/Activatedata",
                    data: '{Student_Userid:' + JSON.stringify(Student_Userid) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true,
                    success: function (data) {
                        getstudent_details(1);
                    },
                    error: function (xhr, status, err) {
                        _Loader_Hide($(".Response").closest(".panel-body"));
                        var err = eval("(" + xhr.responseText + ")");
                        fn_DialogBox(err.Message);
                    }
                });
            })
        }
        //    if (x) {
        //        $.ajax({
        //            type: "POST",
        //            url: "../addstudents.aspx/Activatedata",
        //            data: '{Student_Userid:' + JSON.stringify(Student_Userid) + '}',
        //            contentType: "application/json; charset=utf-8",
        //            dataType: "json",
        //            async: true,
        //            success: function (data) {
        //                getstudent_details(1);
        //            },
        //            error: function (xhr, status, err) {
        //                _Loader_Hide($(".Response").closest(".panel-body"));
        //                var err = eval("(" + xhr.responseText + ")");
        //                fn_DialogBox(err.Message);
        //            }
        //        });
        //    }
        //    /*            alert(Student_Userid);*/
        //}
        function deletedata(Student_Userid) {
            temp = 1;
            /*var x = confirm("Are you sure you want to delete?");*/
            $("#delete_confirmation").click(function () {
                $.ajax({
                    type: "POST",
                    url: "../addstudents.aspx/deletestudent",
                    data: '{Student_Userid:' + JSON.stringify(Student_Userid) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true,
                    success: function (data) {
                        getstudent_details(1);
                    },
                    error: function (xhr, status, err) {
                        _Loader_Hide($(".Response").closest(".panel-body"));
                        var err = eval("(" + xhr.responseText + ")");
                        fn_DialogBox(err.Message);
                    }
                });
            })
            //if (x) {
            //    temp = 1;
            //    $.ajax({
            //        type: "POST",
            //        url: "../addstudents.aspx/deletestudent",
            //        data: '{Student_Userid:' + JSON.stringify(Student_Userid) + '}',
            //        contentType: "application/json; charset=utf-8",
            //        dataType: "json",
            //        async: true,
            //        success: function (data) {
            //            getstudent_details(1);
            //        },
            //        error: function (xhr, status, err) {
            //            _Loader_Hide($(".Response").closest(".panel-body"));
            //            var err = eval("(" + xhr.responseText + ")");
            //            fn_DialogBox(err.Message);
            //        }
            //    });
            //}
/*            alert(Student_Userid);*/
        }
        //function updatedata(Student_Userid) {
        //     $('#details').show();
        //    $("#tbody").append("");
        //    temp = 1;
        //    $('#btn_submit').css('display', 'none');
            <%--$("#<%=Username.ClientID%>").val();
            $("#<%=Name.ClientID%>").val(Student_Userid);--%>
            //$.ajax({
            //    type: "POST",
            //    url: "addstudents.aspx/getthevalues",
            //    contentType: "application/json; charset=utf-8",
            //    data: '{Student_Userid:' + Student_Userid + '}',
            //    dataType: "json",
            //    success: function (data) {
            //        var fulldata = data.d;
            //        var s_Password = fulldata[0]["Password"];
            //        var s_username = fulldata[0]["Username"];
            //        var s_name = fulldata[0]["name"];
            //        var s_Class = fulldata[0]["Class"];
            //        var s_DOJ = fulldata[0]["DOJ"];
            //        var s_address = fulldata[0]["address"];
            //        var s_image = fulldata[0]["image"];
            //        if (s_image == "") {
            //            s_image = "default.png"; 
            //        }
            //        $("#Set_Password").val(s_Password);
            //        $("#Username").val(s_username);
            //        $("#Name").val(s_name);
            //        $("#Address").val(s_address);
            //        $("#Class").val(s_Class);
            //        var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
            //        $("#DOJ").val(s_DOJ.substring(0,2) + "-" +months[s_DOJ.substring(3,5)-1]  + "-" + s_DOJ.substring(6, 10));
            //        $('#imagenFondo').attr('src', s_image);
            //     },
            //     error: function (xhr, status, err) {
                     //_Loader_Hide($(".Response").closest(".panel-body"));
                     //var err = eval("(" + xhr.responseText + ")");
                     /*fn_DialogBox(err.Message);*/
                 //}
            // });
            //$('#btn_update').css('display', 'block');
            //$("#span1").css('display', 'none');
            //$('#btn_update').click(function () {
               /* document.getElementById("btn_submit").style.display = "none";*/
               <%-- if (validate()) {
                    var imagesrc = document.getElementById("imagenFondo").src;
                    if ($('#imagenFondo').attr('src', "default.png")) {
                        imagesrc = null;
                    }
                        var student = {};
                        student.Student_Userid = Student_Userid;
                        student.Username = $("#Username").val();
                        student.name = $("#Name").val();
                        student.Class = $("#Class").val();
                        student.address = $("#Address").val();
                        student.Password = $("#Set_Password").val();
                    student.DOJ = $("#DOJ").val();
                    student.image = imagesrc;
                        $.ajax({
                            type: "POST",
                            url: "addstudents.aspx/updatedata",
                            contentType: "application/json; charset=utf-8",                           
                           data: '{stu:' + JSON.stringify(student) + '}',
                            dataType: "json",
                            success: function (data) {
                                getstudent_details(1);
                                btn_update.style.display = "none";
                                document.getElementById("span1").style.display = "block";
                                document.getElementById("details").style.display = "none";
                                $("#<%=confirm_message.ClientID%>").html("Student Updated Successfully");
                                $("confirm_message").html("Added");
                                /*document.getElementById("confirm_messageb").style.display = "block";*/
                            },
                            error: function (xhr, status, err) {
                                //_Loader_Hide($(".Response").closest(".panel-body"));
                                //var err = eval("(" + xhr.responseText + ")");
                                /*fn_DialogBox(err.Message);*/
                            }
                        });
                    }         
            })
        }--%>
        function validate() {
            var isvalid = true;
            var username = document.getElementById("Username").value;
            var name = document.getElementById("Name").value;
            var Address = document.getElementById("Address").value;
            var Class = document.getElementById("Class").value;
            var password = document.getElementById("Set_Password").value;
            var DOJ = document.getElementById("DOJ").value;
            var btn_submit = document.getElementById("btn_submit");
            var imagesrc = document.getElementById("imagenFondo").src;
            if (imagesrc=="" || imagesrc==null ){
                document.getElementById("imagenFondo").style.border = "1px solid red";
                document.getElementById("image_span").innerHTML = "Please Fill this feild";
                isvalid = false;
            }
            else {
                document.getElementById("Username").style.border = "1.5px solid #c4c4c4";
                document.getElementById("image_span").innerHTML = "";
                
            }
            if (username == "" || username==null) {
                document.getElementById("Username").style.border = "1px solid red";
                document.getElementById("Username_span").innerHTML = "Please Fill this feild";
                isvalid= false;
            }
            else {
                document.getElementById("Username").style.border = "1.5px solid #c4c4c4";
                document.getElementById("Username_span").innerHTML = "";
                
            }
            if (name == "" || name == null) {
                document.getElementById("Name").style.border = "1px solid red";
                document.getElementById("Name_span").innerHTML = "Please Fill this feild";
                isvalid= false;
            }
            else {
                document.getElementById("Name").style.border = "1.5px solid #c4c4c4";
                document.getElementById("Name_span").innerHTML = "";
            }
            if (Address == "" || Address == null) {
                document.getElementById("Address").style.border = "1px solid red";
                document.getElementById("Address_span").innerHTML = "Please Fill this feild";
                isvalid= false;
            }
            else {
                document.getElementById("Address").style.border = "1.5px solid #c4c4c4";
                document.getElementById("Address_span").innerHTML = "";
            }
            if (Class == "" || Class == null) {
                document.getElementById("Class").style.border = "1px solid red";
                document.getElementById("Class_span").innerHTML = "Please Fill this feild";
                isvalid= false;
            }
            else {
                document.getElementById("Class").style.border = "1.5px solid #c4c4c4";
                document.getElementById("Class_span").innerHTML = "";
            }
            if (password == "" || password == null) {
                document.getElementById("Set_Password").style.border = "1px solid red";
                document.getElementById("Set_Password_span").innerHTML = "Please Fill this feild";
                isvalid= false;
            }
            else {
                document.getElementById("Set_Password").style.border = "1.5px solid #c4c4c4";
                document.getElementById("Set_Password_span").innerHTML = "";
            }
            if (DOJ == "" || DOJ == null) {
                document.getElementById("DOJ").style.border = "1px solid red";
                document.getElementById("DOJ_span").innerHTML = "Please Fill this feild";
                isvalid= false;
            }
            else {
                document.getElementById("DOJ").style.border = "1.5px solid #c4c4c4";
                document.getElementById("DOJ_span").innerHTML = "";
            }
            //btn_submit.style.display = "none";
            //document.getElementById("span1").style.display = "block";
            return isvalid;
        }
        function filter() {
            temp = 1;
            getstudent_details(temp);
        }
        //function clearfilter() {
        //    temp = 1;
        //    getstudent_details(temp);
        //}
        function getstudent_details(Pageno) {
            var iObj_clsOnboardingMasterBAL = null;
            var iResumeId = null;
            var iRequirementId = null;
            try {
                //_Loader_Show("Loading Response...", $(".Response").closest(".panel-body"));
                //iResumeId = getParameterByName("ResumeId");
                //iRequirementId = getParameterByName("RequirementId");
                //iObj_clsOnboardingMasterBAL = JSON.stringify({
                //    sObj_clsOnboardingMasterBAL: {
                //        "sResumeId": iResumeId,
                //        "sRequirementId": iRequirementId
                //    }
                //});
               /* document.getElementById("Delete_All").style.display = "block";*/
                document.getElementById("span2").style.display = "none";
                var status = $("#select_all").is(":checked");
                var ele = document.getElementById('select_all');
                if (status == true)
                {
                    ele.checked = false;
                }
                var searchname = $("#TextBox1").val();
                var fromdate = $("#Search_fromdate").val();
                var todate = $("#Search_todate").val();
                var address = $("#Search_address").val();
                var status = "";
                if ($("#dropdown_list").val() == "Select") {
                    status = "";
                }
                else {
                    status = $("#dropdown_list").val();
                }
                $.ajax({
                    type: "POST",
                    url: "../addstudents.aspx/getstudentdetails",
                    data: "{ 'pageno': '" + JSON.stringify(Pageno) +
                        "', 'name': '" + searchname + "', 'address': '" + address + "', 'fromdate': '" + fromdate + "', 'todate': '" + todate + "', 'status': '" + status + "' }",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true,
                    success: function (data) {
                        let tbl = $('#insert_as_card');
                        tbl.empty();
                        $("#pagination_details").empty();
                        var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                        var fulldata = data.d;
                        /*var s_Password = fulldata[0]["Password"];*/
                        var pno = fulldata[0]["pageno"];
                        var offset = fulldata[0]["offset"];
                        var totalrows = fulldata[0]["totalrows"];
                        var last = parseInt(offset) + 9;
                        var no_of_pages = Math.trunc(totalrows / 10);
                        if (last > totalrows) {
                            last = totalrows;
                        }
                        if ((totalrows / 10) > no_of_pages) {
                            no_of_pages = no_of_pages + 1;
                        }
                        
                        $("#pagination_details").append("Page " + pno + "/" + no_of_pages + " Showing " + offset + " to " + last + " of " + totalrows)
                        $.each(data.d, function () {
      //                      <div id="insert_as_card">
      ////                      <div class="container">
      ////                          <h2>Card Image</h2>
      ////                          <p>Image at the top (card-img-top):</p>
      ////                          <div class="card" style="width:400px">
      ////                              <img class="card-img-top" src="add.png" alt="Card image" style="width:100%">
      ////                                  <div class="card-body">
      ////                                      <h4 class="card-title">John Doe</h4>
      ////                                      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
      ////                                      <a href="#" class="btn btn-primary">See Profile</a>
      ////                                  </div>
      ////</div></div>


                //            <div class="container" id="insert_as_card">
                //                <div class="card" style="width: 500px;">

                //                    <div class="col-sm-5">
                //                        <img class="card-img" src="default.png" alt="Suresh Dasari Card" style="width:100px">
                //</div>
                //                        <div class="col-sm-7">
                //                            <div class="card-body">
                //                                <h5 class="card-title">Suresh Dasari</h5>
                //                                <p class="card-text">Suresh Dasari is a founder and technical lead developer in tutlane.</p>
                //                                <a href="#" class="btn btn-primary">View Profile</a>
                //                            </div>
                //                        </div>

                //                    </div>
                            //                </div>
                            if (this.image == "") {
                                this.image="default.png"
                            }
                            if (this.status == 'Active') {
                                $("#insert_as_card").append(" <div class='card'><div class='row'><div class='col-md-2'><input class='checkrow_class' id='checkrow' name='id_name' type='checkbox'value=" + this.Student_Userid + " /></div><div class='col-md-2'><label style='font-size:17px';>Name:" + this.name + "</label></div></div><div class='row'><div class='col-md-2'><img class='card - img' src=" + this.image + " style='width: 90px;height:110px'/></div><div class='col-md-10'><div class='row'><div class='col-md-3'><label>Id:" + this.Student_Userid + "</label></div><div class='col-md-3'><label>Class:" + this.Class + "</label></div><div class='col-md-3'><label>DOJ:" + (this.DOJ).substring(0, 3) + months[this.DOJ.substring(4, 5) - 1] + "-" + this.DOJ.substring(6, 10) + "</label></div> <div class='col-md-3'><button type='button' class='btn btn-danger' data-toggle='modal' data-target='#exampleModal'  onclick='deletedata(" + this.Student_Userid + ")'>Delete</button></div><div class='col-md-12'></div><div class='col-md-12'></div><div class='col-md-3'><label>Address:" + this.address + "</label></div><div class='col-md-3'><label>Status:" + this.status + "</label></div><div class='col-md-3'><label>Creation Date:" + this.date + "</label></div><div class='col-md-3'><button type='button' class='btn btn bg-primary' text='Delete' value=" + this.Student_Userid + " id='update_row' onclick='updatedata(" + this.Student_Userid + ")'>Update</button></div></div></div><div style='display:none;background-color:#EDF0FF;'id='column1" + this.Student_Userid + "'></div></div></div ></div > ");
                            }
                            else {
                                $("#insert_as_card").append(" <div class='card'><div class='row'><div class='col-md-2'><input class='checkrow_class' id='checkrow' name='id_name' type='checkbox'value=" + this.Student_Userid + " /></div><div class='col-md-2'><label style='font-size:17px';>Name:" + this.name + "</label></div></div><div class='row'><div class='col-md-2'><img class='card - img' src=" + this.image + " style='width: 90px;height:110px'/></div><div class='col-md-10'><div class='row'><div class='col-md-3'><label>Id:" + this.Student_Userid + "</label></div><div class='col-md-3'><label>Class:" + this.Class + "</label></div><div class='col-md-3'><label>DOJ:" + (this.DOJ).substring(0, 3) + months[this.DOJ.substring(4, 5) - 1] + "-" + this.DOJ.substring(6, 10) + "</label></div> <div class='col-md-3'><button type='button' class='btn btn-success' data-toggle='modal' data-target='#active_model' text='Delete' onclick='activate(" + this.Student_Userid + ")'>Active</button></div><div class='col-md-12'></div><div class='col-md-12'></div><div class='col-md-3'><label>Address:" + this.address + "</label></div><div class='col-md-3'><label>Status:" + this.status + "</label></div><div class='col-md-3'><label>Creation Date:" + this.date + "</label></div><div class='col-md-3'><button type='button' class='btn btn bg-primary' text='Delete' value=" + this.Student_Userid + " id='update_row' onclick='updatedata(" + this.Student_Userid + ")'>Update</button></div></div></div><div style='display:none;background-color:#EDF0FF;'id='column1" + this.Student_Userid + "'></div></div></div ></div > ");
                            }

                            //if (this.image == "") {
                            //    this.image = "default.png";
                            //}  
                            //if (this.status == "Active") {
                            //    //<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>
                            //    //    Launch demo modal
                            //    //</button>
                            //    /*data - toggle='modal' data - target='#exampleModal'*/
                            //    $("#tbody").append("<tr><td><input class='checkrow_class' id='checkrow' name='id_name' type='checkbox'value=" + this.Student_Userid + " /></td><td>" + this.Student_Userid + "</td><td>" + this.name + "</td><td>" + this.address + "</td><td>" + this.Class + "</td><td>" + (this.DOJ).substring(0, 3) + months[this.DOJ.substring(4, 5) - 1] + "-" + this.DOJ.substring(6, 10) + "</td> <td><image alt='No Image' src='" + this.image + "'style='width: 40px; height: 45px;'></image></td><td>" + this.status + "</td><td>" + this.date + "</td> <td><button type='button' class='btn btn-danger' data-toggle='modal' data-target='#exampleModal'  onclick='deletedata(" + this.Student_Userid + ")'>Delete</button> <button type='button' class='btn btn bg-primary' text='Delete' value=" + this.Student_Userid + " id='update_row' onclick='updatedata(" + this.Student_Userid + ")'>Update</button></td></tr><tr id='column0" + this.Student_Userid +"' style='display:none;'><td id='column1" + this.Student_Userid + "' colspan='10' ></td></tr>");
                            //}
                            ///*<div>" + $("#abcd").load('Student_form.aspx')+"</div>*/
                            //// $("#abcd").load("Student_form.aspx", function () {
                            ////    $('#imagenFondo').attr('src', "add.png");
                            ////    register_submit();
                            //else {
                            //    $("#tbody").append("<tr><td><input class='checkrow_class' id='checkrow' name='id_name' type='checkbox'value=" + this.Student_Userid + " /></td><td>" + this.Student_Userid + "</td><td>" + this.name + "</td><td>" + this.address + "</td><td>" + this.Class + "</td><td>" + (this.DOJ).substring(0, 3) + months[this.DOJ.substring(4, 5) - 1] + "-" + this.DOJ.substring(6, 10) + "</td> <td><image alt='No Image' src='" + this.image + "'style='width: 40px; height: 45px;'></image></td><td>" + this.status + "</td><td>" + this.date + "</td><td><button type='button' class='btn btn-success' data-toggle='modal' data-target='#active_model' text='Delete' onclick='activate(" + this.Student_Userid + ")'>Active</button> <button type='button' class='btn btn bg-primary' text='Delete' id='update_row' value=" + this.Student_Userid + " onclick='updatedata(" + this.Student_Userid + ")'>Update</button></td></tr><tr id='column0"+this.Student_Userid+"' style='display:none;' ><td colspan='10' id='column1" + this.Student_Userid + "'></td></tr>");
                            //}
                        });
                    },
                    error: function (xhr, status, err) {
                        //_Loader_Hide($(".Response").closest(".panel-body"));
                        //var err = eval("(" + xhr.responseText + ")");
                        //fn_DialogBox(err.Message);
                    }
                });
            }
            catch (ex) { }
        }
        var x = null;
        var y = null;
        function updatedata(Student_Userid) {
            $(x).empty();
            $(y).css("display", "none");
            $(x).css("display", "none")
            x = "#column1" + Student_Userid;
            y = "#column0" + Student_Userid;
            $("#abcd").empty();
            $("#abcd").css("display", "none");
            document.getElementById("column1" + Student_Userid).style.display = "block";
           /* $.each($("input[name='id_name']:checked"), function () {*/
            $("#column1"+Student_Userid).load("Student_form.aspx", function () {
                $('#DOJ').datepicker({ dateFormat: 'dd-M-yy' }).val();
                $('#btn_update').css('display', 'block');
                $('#btn_submit').css('display', 'none');
                $('btn_unload').css('display','block')
                $("#cancel_icon").click(function () {
                    $("#column1" + Student_Userid).empty();
                    document.getElementById("column1" + Student_Userid).style.display = "none";
                })
            temp = 1;
           <%--- $("#<%=Username.ClientID%>").val();
            $("#<%=Name.ClientID%>").val(Student_Userid)--%>;
            $.ajax({
                type: "POST",
                url: "addstudents.aspx/getthevalues",
                contentType: "application/json; charset=utf-8",
                data: '{Student_Userid:' + Student_Userid + '}',
                dataType: "json",
                success: function (data) {
                    var fulldata = data.d;
                    var s_Password = fulldata[0]["Password"];
                    var s_username = fulldata[0]["Username"];
                    var s_name = fulldata[0]["name"];
                    var s_Class = fulldata[0]["Class"];
                    var s_DOJ = fulldata[0]["DOJ"];
                    var s_address = fulldata[0]["address"];
                    var s_image = fulldata[0]["image"];
                    if (s_image == "") {
                        s_image = "default.png"; 
                    }
                    $("#Set_Password").val(s_Password);
                    $("#Username").val(s_username);
                    $("#Name").val(s_name);
                    $("#Address").val(s_address);
                    $("#Class").val(s_Class);
                    var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                    $("#DOJ").val(s_DOJ.substring(0,2) + "-" +months[s_DOJ.substring(3,5)-1]  + "-" + s_DOJ.substring(6, 10));
                    $('#imagenFondo').attr('src', s_image);
                 },
                 error: function (xhr, status, err) {
                     _Loader_Hide($(".Response").closest(".panel-body"));
                     var err = eval("(" + xhr.responseText + ")");
            fn_DialogBox(err.Message);
                 }
            });

            
            $("#span1").css('display', 'none');
            $('#btn_update').click(function () {
             document.getElementById("btn_submit").style.display = "none";
                if (validate()) {
                    var imagesrc = document.getElementById("imagenFondo").src;
                    if (imagesrc == "default.png") {
                        imagesrc = null;
                    }
                        var student = {};
                        student.Student_Userid = Student_Userid;
                        student.Username = $("#Username").val();
                        student.name = $("#Name").val();
                        student.Class = $("#Class").val();
                        student.address = $("#Address").val();
                        student.Password = $("#Set_Password").val();
                    student.DOJ = $("#DOJ").val();
                    student.image = imagesrc;
                        $.ajax({
                            type: "POST",
                            url: "addstudents.aspx/updatedata",
                            contentType: "application/json; charset=utf-8",                           
                           data: '{stu:' + JSON.stringify(student) + '}',
                            dataType: "json",
                            success: function (data) {
                                getstudent_details(1);
                                btn_update.style.display = "none";
                                document.getElementById("span1").style.display = "block";
                                document.getElementById("details").style.display = "none";
                                $("#<%=confirm_message.ClientID%>").html("Student Updated Successfully");
                                setTimeout(function () {
                                    $("#confirm_message").fadeOut().empty();
                                }, 5000);
                                
                                $("confirm_message").html("Added");
                                /*document.getElementById("confirm_messageb").style.display = "block";*/
                            },
                            error: function (xhr, status, err) {
                                //_Loader_Hide($(".Response").closest(".panel-body"));
                                //var err = eval("(" + xhr.responseText + ")");
                                /*fn_DialogBox(err.Message);*/
                            }
                        });
                    }         
            })
        });
        }
           
              


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
        function clearfilter() {
            $("#TextBox1").val("");
            $("#Search_fromdate").val("");
            $("#Search_todate").val("");
            $("#Search_address").val("");
            $("#dropdown_list").val("Select");
            temp = 1;
            getstudent_details(temp);
            
        }
        var status = $("#select_all").is(":checked");
        function checkAll() {
            var status = $("#select_all").is(":checked");
            var ele = document.querySelectorAll(".checkrow_class");
            if (status == true) {
                for (let i = 0; i < ele.length; i++) {
                    ele[i].checked = true;
                }
            }
            else {
                for (let i = 0; i < ele.length; i++) {
                    ele[i].checked = false;
                }
            } 
        }

        //$("input[name='id_name']").each(function () {
        //    if (document.querySelectorAll(".checkrow_class")[i].checked) {
        //        alert($(this).val());
        //    }
        //});
        function Delete_multiple() {
            var id = [];
            $.each($("input[name='id_name']:checked"), function () {
                id.push($(this).val());
                console.log(id);
            });
            /*var x = confirm("Are you sure you want to delete?");*/
            temp = 1;
            $("#delete_confirmation").click(function () {
                /*$("#exampleModal").css("display", "none");*/
                $.ajax({
                    type: "POST",
                    url: "addstudents.aspx/Deletemultiple",
                    contentType: "application/json; charset=utf-8",
                    data: '{id:' + JSON.stringify(id) + '}',
                    dataType: "json",
                    success: function (data) {
                        /*document.getElementById("Delete_All").style.display = "none";*/
                        document.getElementById("span2").style.display = "block";
                        getstudent_details(1);
                    },
                    error: function (xhr, status, err) {
                        //_Loader_Hide($(".Response").closest(".panel-body"));
                        //var err = eval("(" + xhr.responseText + ")");
                        /*fn_DialogBox(err.Message);*/
                    }
                });
            })
        }
            //if (x) {
            //    $.ajax({
            //        type: "POST",
            //        url: "addstudents.aspx/Deletemultiple",
            //        contentType: "application/json; charset=utf-8",
            //        data: '{id:' + JSON.stringify(id) + '}',
            //        dataType: "json",
            //        success: function (data) {
            //            document.getElementById("Delete_All").style.display = "none";
            //            document.getElementById("span2").style.display = "block";
            //            getstudent_details(1);
            //        },
            //        error: function (xhr, status, err) {
            //            //_Loader_Hide($(".Response").closest(".panel-body"));
            //            //var err = eval("(" + xhr.responseText + ")");
            //            /*fn_DialogBox(err.Message);*/
            //        }
            //    });
            //}
               /* alert("Selected say(s) are: " + days.join(", "));*/
            
            //for (var i = 0; i < document.querySelectorAll(".checkrow_class").length; i++) {
            //    if (document.querySelectorAll(".checkrow_class")[i].checked) {
            //        /*console.log($('.checkrow_class').val());*/
            //        /*document.getElementsByName("id_name")[i]*/
            //        $("input[name='id_name']").each(function () {
            //            alert($(this).val());
            //        });
                   
            //    }
            //}
            //$("input[name='id_name']").each(function () {
            //    if (document.querySelectorAll(".checkrow_class")[i].checked) {
            //        alert($(this).val());
            //    }
            //});
         
    </script>
    <style>
        /*.card{border:1px solid black}*/
        .card{
           /* height:24rem;
            width:98rem;*/
            background-color:#EDF0FF;
            border-bottom:1px solid black
        }
        body {
            font-family: 'Rubik', sans-serif;
            width:100%;
            overflow-x: hidden;
            font-weight:100;
        }
        .message{
            color:red;
        }
        /*.heading {
            font-size: 22px;
            margin-top: -55px;
            color: cornflowerblue;
        }
        #Button1 {
        }
        body {
            height: 125vh;
            margin-top: 80px;
            padding: 30px;
            background-size: cover;
            font-family: sans-serif;
        }*/
/**/        header {
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
        /*.img {
            width: 190px;
            height: 188px;
        }
        #form1 {
            margin-top: -80px;
        }
        p{
            font-size:20px;
            margin: 0 0 -40px;
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
        #addstudents{        
    font-weight: 500;
    width: 118px;
    font-size: 21px;
    color: white;
}
        .container{
            margin:50px;
            position: relative;
    top: 3rem;
}
        }
        .border{
            border:1px solid red;
        }
        #show{
           
        }
        #tabl{
              margin-left: 24rem;
              margin-right: auto;
              width: 102rem;
              position:relative;
        }
        #navbar{
            position:sticky;
        }
        table th{
            text-align: center;
        vertical-align: middle;
        }*/
        .required_feild{
            color:red;
        }
        label{
            font-weight:100
        }
        /*.filter_textbox{
            margin-left:10px;
        }
#Label2{
    margin-left:55rem;
    color:green;
}
.form-control-sm{
    height:3rem;
    width:18rem;
    margin-left:1rem;
    margin-top:-2.5rem
}*/
        .form-control-sm {
            /*margin-left: 1rem;
            width:21rem;*/
           /* margin-top:-2rem;*/
        }
        filter_btn{
            margin:0
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete Record?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Are You Sure you want to delete
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="delete_confirmation" data-dismiss="modal" class="btn btn-danger">Delete</button>
      </div>
    </div>
  </div>
</div>
   
        <div class="modal fade" id="active_model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="active_model_1">Activate Record</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Are You Sure you want to Activate Record
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="activate_confirmation" class="btn btn-success" data-dismiss="modal">Activate</button>
      </div>
    </div>
  </div>
</div>

        <div class="row">
        <header style="z-index:10">
            <nav id="navbar">
               <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a href="Admin.aspx" class="nav-link" id="dashboard">Dashboard </a>
                    </li>
                    <li class="nav-item active">
                        <a href="addstudents.aspx" class="nav-link" id="addstudents">Manage Students </a>
                    </li>
                     <li class="nav-item active">
                        <a href="Fees.aspx" class="nav-link" id="fees">Fees</a>
                    </li>
                    <li class="nav-item active">
                        <a href="Login.aspx" class="nav-link">Logout </a>
                    </li>
                </ul>
            </nav>
        </header>
            </div>
       
         <div class="row">
             <div class="col-md-3 col-sm-3"></div>
             <div class="col-md-1">
             <button id="show" style="margin-top:8rem; margin-bottom:3rem;" class="btn btn-info" type="button">Add Student</button>
             </div>
             </div>
        <div class="row">       
              <div class="col-md-4 col-sm-4"></div>
              <div class="col-md-8 col-sm-8" id="abcd" style="margin-left: -17rem;"></div>

        </div>
        
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 col-sm-6"></div>
        <asp:Label runat="server" ID="confirm_message" style="color:green;font-size:20px;"  ></asp:Label>
            </div>

        

        <div class="row">
            <div class="col-md-3 col-sm-3"></div>
            <div class="col-md-3 col-sm-3 ">
                <div class="col-md-0"></div>
                <%--<div class="col-md-12"><br /><br />--%>
                <label id="pagination_details" style="color:dodgerblue; margin-top:3.5rem;"></label>
                    <%--</div>--%>
            </div>
            
            <div class="col-md-2 col-sm-2">
                <div class="col-md-6 col-sm-6"></div>
               <ul class="pagination" style="cursor:pointer;">
                 <li><a id="previous_btn" onclick="previousdata()" >&laquo;</a></li>
                 <li><a id="next_btn" onclick="nextdata()">&raquo;</a></li>
               </ul>
            </div>
            <div class="col-md-1 col-sm-1"></div>
            <div class="col-md-2 col-sm-2">
<%--                <div class="col-md-12"></div>--%>
                <div class="col-md-4 col-sm-4"></div>
                <div class="col-md-7 col-sm-7">
                 <button type="button" class="btn btn-danger" style="margin-top:2rem;"  id="Delete_All" onclick="Delete_multiple()" data-toggle='modal' data-target='#exampleModal'>Delete Selected</button>
                </div>
            </div>
            </div>
        <div class="row">
        <div class="col-md-3"></div>
            <div class="col-md-2">
                <input style="margin-left:1.5rem;" type="checkbox"id="select_all" onchange="checkAll()" />Select All
            </div>
            </div>
        
        <div class="row"></div>


        <div class="row "> 
            <div class="col-md-1 col-sm-1"></div>
            <div class="col-md-2 col-sm-2">
                 <div style="background: #D6EAF8;border-radius: 7px;"><br />
                     <div class="row">
                         <div class="col-md-1 col-sm-1"></div>
                         <div class="col-md-5 col-sm-5">
             <label class="form-control-sm" style="color:blueviolet;font-size: 17px; ">Filter</label></div>
                     </div>
                     <div class="row">
                         <div class="col-md-1 col-sm-1"></div>
                         <div class="col-md-9 col-sm-9">
        <input class="form-control form-control-sm"  type="text" id="TextBox1" placeholder="Search by Name" /><br /></div>
                     </div>
                     <div class="row">
                         <div class="col-md-1 col-sm-1"></div>
                         <div class="col-md-9 col-sm-9">
             <input class="form-control form-control-sm" type="text" id="Search_fromdate" placeholder="From" />
             <br /></div></div>
                     <div class="row">
                         <div class="col-md-1 col-sm-1"></div>
                         <div class="col-md-9 col-sm-9">
              <input class="form-control form-control-sm" type="text" id="Search_todate" placeholder="To" /><br /></div></div>
                     <div class="row">
                          <div class="col-md-1 col-sm-1"></div>
                         <div class="col-md-9 col-sm-9">
             <input class="form-control form-control-sm"  type="text" id="Search_address"placeholder="Address"/><br /></div></div>
                     <div class="row">
                         <div class="col-md-1 col-sm-1"></div>
                         <div class="col-md-9 col-sm-9">
             <label class="filter_textbox form-control-sm">Status:</label>
                         </div></div>
                     <div class="row">
                         <div class="col-md-1 col-sm-1"></div>
                         <div class="col-md-9 col-sm-9">
              <select id="dropdown_list" class="form-control form-control-sm">
                  <option>Select</option>
                 <option>Active</option>
                 <option>Inactive</option>
             </select>
                             </div>
                         </div>
                     <br />
                     <div class="row">
                         <div class="col-md-1 col-sm-1"></div>

                          <div class="col-md-4 col-sm-4">
              <button type="button" class="btn btn bg-primary filter_btn" id="filter_button" onclick="filter()" >Filter</button>
             <%--<button type="button" onclick="checked()">Check</button>--%>
             <%--<button type="button" id="clear_filter" onclick="clearfilter()" class="btn btn bg-danger filter_btn ">Clear Filter</button>  --%>
                         </div>
                          <div class="col-md-5 col-sm-5">
              <%--<button type="button" class="btn btn bg-primary filter_btn" id="filter_button" onclick="filter()" >Filter</button>--%>
             <%--<button type="button" onclick="checked()">Check</button>--%>
             <button type="button" id="clear_filter" onclick="clearfilter()" class="btn btn bg-danger filter_btn ">Clear Filter</button>  
                         </div>
                         </div>
                      <br />         
            </div>
            </div>
            <div class="col-md-8" >
                <div class="container col-md-12"  id="insert_as_card">
                   <%--<div class='card'style='height:35rem;'>
                       <div class='card-body'>
                         <div class="row">
                             <dix class="col-md-2"><label>Nams</label></dix>
                             
                         </div>
                            <div class='row'>
                                 <div class='col-md-2'>
                                       <img class='card - img' src=" + this.image + " style='width: 90px;height:110px'/>
                                   </div>
                                <div class='col-md-10'>
                                <div class='row'>
                                   <div class='col-md-3'>
                                       <label>Id</label>
                                   </div>
                                    <div class='col-md-3'>
                                       <label>Class</label>
                                   </div>
                                   <div class='col-md-3'>
                                       <label>Class</label>
                                   </div>
                                  
                               
                                 
                                   <div class='col-md-3'>
                                       <button type="button" class='btn btn-danger'>Delete</button>
                                   </div>
                                     <div class='col-md-12'>
                                      
                                   </div>
                                     <div class='col-md-12'>
                                      
                                   </div>
                          
                          
                                    <div class='col-md-3'>
                                       <label>Class</label>
                                   </div>
                                   <div class='col-md-3'>
                                      <label>Class</label>
                                   </div>
                                     <div class='col-md-3'>
                                      <label>Class</label>
                                   </div>
                                     <div class='col-md-3'>
                                      <button type='button' class='btn btn-primary'>Update</button>
                                   </div>
                                  
                               </div></div>
                           <%--<img class='card - img' src=" + this.image + " style='width: 90px;height:110px'>--%>
                           </div>
                       </div>
                       </div>--%>
            
             <%--<div class="container" id="insert_as_card">--%>
<%--        <div class="card" style="width: 500px;">
           
                <div class="col-sm-5">
                    <img class="card-img" src="default.png" alt="Suresh Dasari Card" style="width:100px">
                </div>
                <div class="col-sm-7">
                    <div class="card-body">
                        <h5 class="card-title">Suresh Dasari</h5>
                        <p class="card-text">Suresh Dasari is a founder and technical lead developer in tutlane.</p>
                        <a href="#" class="btn btn-primary">View Profile</a>
                    </div>
                </div>
            
        </div>--%>
   <%-- </div>--%>

           <%-- <div id="insert_as_card">--%>
            <%--<div class="container" >--%>
 <%-- <h2>Card Image</h2>
  <p>Image at the top (card-img-top):</p>
  <div class="card" style="width:400px">
    <img class="card-img-top" src="add.png" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">John Doe</h4>
      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
      <a href="#" class="btn btn-primary">See Profile</a>
    </div>
      </div>--%>
                <%--</div>--%>

      <%--  </div>--%>
           <%-- <div class="col-md-8 col-sm-8">
                 <table class="table table-hover col-md-2 col-sm-2" id="tabl" style="z-index:1;">
            <thead>
                <tr style="background-color:#879BFF;">
                <th><input type="checkbox"id="select_all" onchange="checkAll()" />Select All</th>
                <th >Student Id</th>
                <th >Name</th>
                <th> Address</th>
                <th> Class</th>
                <th > DOJ</th>
                <th>Profile image</th>
                <th>Status</th>
                <th>Creation Date</th>
                <th style="width:16rem;">Update/Delete</th>
            </tr>
            </thead>
            <tbody id="tbody" style="background-color:#EDF0FF; text-align:center;">
            </tbody>
        </table>       

            </div>--%>
        
        </div>

    </form> 
    <span id="span2" runat="server" style="display:none ;color: blue;">Loading...</span>
    <p>
        &nbsp;</p>
</body>
</html>