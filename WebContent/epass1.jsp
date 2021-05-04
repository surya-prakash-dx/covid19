<%@ page import="java.sql.*" %>  
<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser1","root","surya@123"); //create connection
	
	if(request.getParameter("btn_register")!=null) //check register button click event not null
	{
		String fullname,parentname,mobilenumber,email,gender,age,passengers,idproof,idproofnumber,address,source,destination,vehicletype,reason,date,trange,vehiclenumber;
		
        fullname=request.getParameter("txt_fullname"); //txt_fullname
        parentname=request.getParameter("txt_parentname"); //txt_fullname
		mobilenumber=request.getParameter("txt_mobilenumber"); //txt_mobilenumber
        email=request.getParameter("txt_email"); //txt_email
        gender=request.getParameter("txt_gender");
        age=request.getParameter("txt_age");
        passengers=request.getParameter("txt_passengers");
        idproof=request.getParameter("txt_idproof");
        idproofnumber=request.getParameter("txt_idproofnumber");
        address=request.getParameter("txt_address"); //txt_address
        date=request.getParameter("txt_date"); //txt_date
        source=request.getParameter("txt_source"); //txt_source
        destination=request.getParameter("txt_destination"); //txt_destination
        vehicletype=request.getParameter("txt_vechiletype");
        reason=request.getParameter("txt_reason"); //txt_reason
        trange=request.getParameter("txt_trange");
        vehiclenumber=request.getParameter("txt_vehiclenumber");
		PreparedStatement pstmt=null; //create statement
		
        pstmt=con.prepareStatement("insert into epass(fullname,parentname,mobilenumber,email,gender,age,passengers,idproof,idproofnumber,address,date,source,destination,vehicletype,vehiclenumber,reason,trange) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"); //sql insert query

        pstmt.setString(1,fullname);
        pstmt.setString(2,parentname);
		pstmt.setString(3,mobilenumber);
        pstmt.setString(4,email);
        pstmt.setString(5,gender);
        pstmt.setString(6,age);
        pstmt.setString(7,passengers);
        pstmt.setString(8,idproof);
        pstmt.setString(9,idproofnumber);
        pstmt.setString(10,address);
        pstmt.setString(11,date);
        pstmt.setString(12,source);
        pstmt.setString(13,destination);
        pstmt.setString(14,vehicletype);
        pstmt.setString(15,reason);
        pstmt.setString(16,trange);
        pstmt.setString(17,vehiclenumber);

		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","form submitted click view pass"); //register success messeage

		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%> 
 
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<title>E-PASS FORM</title>
    <link rel ="icon" href="https://cdn.clipart.email/da35a99138d1c37b05356e30e4f0ad71_circle-profile-user-icon-png_500-512.png" type ="image/x-icon">

	<link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/login-register.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet"  type="text/css" href="style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <link rel="stylesheet" href="jquery/jquery-ui.css">
   <script src="jquery/external/jquery/jquery.js"></script>
   
   <script src="jquery/jquery-ui.js"></script>
    
   
   <div class="container-fluid bg-light text-center my-3">
    <h1 style="block-size: auto;"> EPASS FORM</h1>
    </div>
    <ul>
        <li><a href="index.html">Back to Home</a></li>
    </ul>
	<!-- javascript for registeration form validation-->
	<script>	
	
		function validate()
		{
			var full_name= /^[a-z A-Z ]+$/; //pattern allowed alphabet a-z or A-Z 
            var parent_name= /^[a-z A-Z ]+$/; //pattern allowed alphabet a-z or A-Z 
			var mobile_number= /^\d{10}$/; //pattern allowed number 0-9 
			var email_id= /^[\w\d\.]+\@[a-z A-Z\.]+\.[A-Z a-z]{1,4}$/; //pattern valid email validation
            var gender=/^[a-z A-Z ]+$/;
            var address_reg=/^[a-z A-Z 0-9 /,.]+$/; //pattern address allowed A to Z, a to z, 0-9
            var date_of_journey =/^[0-9\b]+$/;
            var source_from = /^[a-z A-Z]+$/;
            var destination_to=/^[a-z A-Z]+$/;
            var reason_for=/^[a-z A-Z]+$/;
            var range_from=/^[a-z A-Z]+$/;


			var fullname = document.getElementById("fullname"); //textbox id fullname
            var parentname = document.getElementById("parentname"); //textbox id fullname
            var mobilenumber = document.getElementById("mobilenumber"); //textbox id lname
            var email = document.getElementById("email"); //textbox id email
            var gender = document.getElementById("gender");
            var address = document.getElementById("address"); //textbox id address
            var date = document.getElementById("date");
            var source = document.getElementById("source");
            var Source = source.value.toLowerCase();
            var destination = document.getElementById("destination"); //textbox id destination
            var Destination = destination.value.toLowerCase();
            var reason = document.getElementById("reason"); //textbox id reason
            var trange = document.getElementById("trange");

            if(!email_id.test(email.value)) 
            {
				alert("Enter Valid Email");
                return false;                    
            }
            if(!mobile_number.test(mobilenumber.value)) 
            {
				alert("Invalid mobile number");
                return false;                    
            }
             if (Source != Destination)
             {
                return true;
             }
             else{
                alert("Source and destination should not be the same");
                return false;
             } 
              
        }
        
        $(document).ready(function(){
            $("#date").datepicker({
                minDate:0
            });
        });

	</script>	

</head>

<body>

  <div class="main-content">

        <form class="form-register" method="POST"  onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">
				   
				   </br>
                   <div class="form-row" >
                        <label>
                            <span>FULL NAME</span>
                            <input type="text" name="txt_fullname" id="fullname" placeholder="enter fullname" required autofocus>
                        </label>
                    </div>
                    <div class="form-row" >
                        <label>
                            <span>PARENT/GUARDIAN NAME</span>
                            <input type="text" name="txt_parentname" id="parentname" placeholder="enter fathername" required>
                        </label>
                    </div>
					<div class="form-row">
                        <label>
                            <span>MOBILE NUMBER</span>
                            <input type="number" name="txt_mobilenumber" id="mobilenumber" placeholder="enter mobilenumber" required> 
                        </label>
                    </div>
                    
                    
                    <div class="form-row">
                        <label>
                            <span>EMAIL</span>
                            <input type="text" name="txt_email" id="email" placeholder="enter email" required>
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>GENDER</span>
                            <select name="txt_gender" id="gender" required >
                                  <option value="">SELECT GENDER</option>
                                  <option value="MALE">MALE</option>
                                 <option value="FEMALE">FEMALE</option>
                            </select>
                         </label>
                      </div>

                      <div class="form-row">
                        <label>
                            <span>AGE</span>
                            <input type="number" size="3" name="txt_age" min="18" max="99" value="18"><br>
                         </label>
                      </div>
                      
                      <div class="form-row">
                        <label>
                            <span>DATE OF JOURNEY</span>
                            <input type="text"  name="txt_date" id="date"placeholder="MM/DD/YYYY" required readonly >
                        </label>
                    </div>
                    
                    <div class="form-row">
                        <label>
                            <span>ADDRESS</span>
                            <input type="text" name="txt_address" id="address" placeholder="enter address" required>
                        </label>
                    </div>
                    
                      <div class="form-row">
                        <label>
                            <span>NUMBER OF PASSENGERS OTHER THAN APPLICANT</span>
                            <input type="number" size="2" name="txt_passengers" min="1" max="10" value="1" required><br>
                         </label>
                      </div>

                      <div class="form-row">
                        <label>
                            <span>ID PROOF OF APPLICANT</span>
                            <select name="txt_idproof" id="reason" required>
                                  <option value="">SELECT ID</option>
                                  <option value="Aadhar card">Aadhar card</option>
                                 <option value="Driving License">Driving License</option>
                                 <option value="Ration card">Ration card</option>
                                 <option value="Pan card">Pan card</option>
                                 <option value="Passport">Passport</option>
                                
                            </select>
                         </label>
                      </div>
                      <div class="form-row">
                        <label>
                            <span>ID PROOF NUMBER</span>
                            <input type="number" name="txt_idproofnumber" id="idproofnumber" placeholder="enter id proof number" required> 
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>TRAVEL RANGE</span>
                            <select name="txt_trange" id="trange" required>
                                <option value="">SELECT TRAVEL RANGE</option>
                                <option value="Travelling with in a district">Travelling with in a district</option>
                               <option value="Travelling within tamilnadu from one district to another">Travelling within tamilnadu from one district to another</option>
                               <option value="Going outside tamilnadu to another state">Going outside tamilnadu to another state</option>
                               <option value="Coming inside tamilnadu from another state">Coming inside tamilnadu from another state</option>
                               <option value="Transit (Travelling from one state to another via tamilnadu)">Transit (Travelling from one state to another via tamilnadu)</option>                                
                            </select>
                         </label>
                      </div>
                      <div class="form-row">
                        <label>
                            <span>REASON</span>
                            <select name="txt_reason" id="reason" required>
                                  <option value="">SELECT REASON</option>
                                  <option value="return of stranded people">Return of stranded people</option>
                                 <option value="Marriage">Marriage</option>
                                 <option value="Medical Emergency">Medical Emergency</option>
                                 <option value="Death">Death</option>
                                 <option value="Government Super">Government Supervision</option>
                                
                            </select>
                         </label>
                      </div>
                      <div class="form-row">
                        <label>
                            <span>SOURCE</span>
                            <input type="text" name="txt_source" id="source" placeholder="enter source" required>
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>DESTINATION</span>
                            <input type="text" name="txt_destination" id="destination" placeholder="enter destination" required>
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>TYPE OF VEHICLE</span>
                            <select name="txt_vechiletype" id="vehicle" required>
                                  <option value="">SELECT VEHICLE</option>
                                  <option value="Bus">BUS(Max : Driver + 60% of the capacity or 30 - whichever is less)</option>
                                 <option value="Van">VAN(Max :  Driver + 7) </option>
                                 <option value="Innova/Suv">Innova/Suv(Max :  Driver + 4)</option>
                                 <option value="Car/Hired Taxi">Car/Hired Taxi(Max : Driver + 3) </option>
                                 <option value="Hired Auto">Hired Auto(Max : Driver + 2)</option>
                                
                            </select>
                         </label>
                        </div>                    
                        <div class="form-row">
                            <label>
                                <span>VEHICLE NUMBER</span>
                                <input type="text" name="txt_vehiclenumber" id="vehiclenumber" placeholder="TN/xx/x/xxxx" required> 
                            </label>
                        </div>
					<button type="submit" name="btn_register" id="submit" class="btn btn-outline-primary" value="onsubmit">submit</button>
					
                </div>
                
				
            </div>

        </form>

    </div>

</body>

</html>
