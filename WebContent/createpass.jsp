<%@page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%

    String mobilenumber = request.getParameter("mobilenumber");
    try {

 
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser1","root","surya@123");
        
        
        PreparedStatement st  = con.prepareStatement("select * from epass where mobilenumber=?");

        st.setString(1, mobilenumber); 

         ResultSet rs = st.executeQuery();

        ResultSetMetaData rsmd = rs.getMetaData(); 
        
       
       if (rs.next()) {
      
      
%>
<script>
        function printpage() {
        var printButton = document.getElementById("printpagebutton");
        printButton.style.visibility = 'hidden';
        window.print()
        printButton.style.visibility = 'visible';
    }
</script>
<!DOCTYPE html>
<html lang="en">
<html>
	<head>
		<title>USER</title>
		<link rel ="icon" href="https://www.pngitem.com/pimgs/m/69-692608_transparent-answer-icon-png-check-pass-icon-png.png" type ="image/x-icon">
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<form id=myfrm>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="card">
				<h1 style="text-align: center;">EPASS</h1>
                <div class="card-body p-0">
                    <div class="row p-1">
                        <div class="col-md-6">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSN3CoHHQRZ5bftKC0LLCzQ6FV2S9uyGw9-3w&usqp=CAU">
                        </div>

                        <div class="col-md-6 text-right">
							<p class="font-weight-bold mb-1" style="color:red">ID:<%=rs.getInt(1)%></p>
							<p><strong>DATE OF JOURNEY:</strong><%=rs.getString(12)%></p>
							<br><img src="https://store-images.s-microsoft.com/image/apps.33967.13510798887182917.246b0a3d-c3cc-46fc-9cea-021069d15c09.392bf5f5-ade4-4b36-aa63-bb15d5c3817a" width="100" height="100">
                        </div>
                    </div>

                    <hr class="my-5">

                    <div class="row pb-5 p-5">
                        <div class="col-md-6">
                            <p class="font-weight-bold mb-4">DETAILS</p>
							<p><label><strong> NAME:</strong></label><%=rs.getString(2)%></p>
							<p><label><strong>PARENT/GUARDIAN NAME:</strong></label><%=rs.getString(3)%></p>
							<p><label><strong>MOBILE NUMBER:</strong></label><%=rs.getString(4)%></p>
							<p><label><strong>EMAIL:</strong></label><%=rs.getString(5)%></p>
							<p><label><strong>FROM:</strong></label><%=rs.getString(13)%></p> 
						</div>
						<div class="col-md-6 text-right">
							<br><p><label><strong>GENDER:</strong></label><%=rs.getString(6)%></p>
							<p><label><strong>AGE:</strong></label><%=rs.getString(7)%></p>
							<p><label><strong>ADDRESS:</strong></label><%=rs.getString(11)%></p>
							<p><label><strong>NO OF PASSENGERS:</strong></label><%=rs.getString(8)%></p>
							<p><label><strong>TO:</strong></label><%=rs.getString(14)%></p>
                        </div>
                    </div>

                    <div class="row p-5">
                        <div class="col-md-12">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="border-0 text-uppercase small font-weight-bold">ID PROOF</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">ID PROOF NUMBER</th>
										<th class="border-0 text-uppercase small font-weight-bold">TRAVEL RANGE</th>
										<th class="border-0 text-uppercase small font-weight-bold">REASON</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">VEHICLE TYPE</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">VEHICLE NUMBER</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
										<td><%=rs.getString(9)%></td>
										<td><%=rs.getString(10)%></td>
										<td><%=rs.getString(15)%></td>
										<td><%=rs.getString(18)%></td>
                                        <td><%=rs.getString(17)%></td>
                                        <td><%=rs.getString(16)%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="d-flex flex-row-reverse bg-dark text-white p-4">
                        <div class="py-3 px-5 text-right">
                            <p style="font-size: xx-large;" class="font-weight-bold mb-1">STATUS</p>
							<p style="font-size: xx-large; color:green" class="font-weight-bold mb-1"><%=rs.getString(19)%></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</form>
    <p align="center"><button type="button"  class="btn btn-primary" id="printpagebutton" style="margin-top:15px;" onclick="printpage()">DOWNLOAD</button>
		<%
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
	
	
		
    </body>
</html>