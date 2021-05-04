<%@ page import="java.sql.*" %>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser1","root","surya@123"); // create connection 
	
	if(request.getParameter("btn_update")!=null) //check button click event not null
	{
		int hide; 
		
		String status;
		
		hide=Integer.parseInt(request.getParameter("txt_hide")); //it is hidden id get for update record
		status=request.getParameter("txt_status"); //txt_owner
		
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update epass set status=? where id=?"); //sql update query 
		pstmt.setString(1,status);
		pstmt.setInt(2,hide);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //connection close

		out.println("Update Successfully...! Click Back link."); //after update record successfully message
		response.sendRedirect("details.jsp");
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

<html>

	<head>
	
		<title>Admin</title>
		
	<!--css for div main class and table-->
		
		<!-- javascript for form validation-->
		<script>
		
			function validate()
			{
				var status = document.myform.txt_status;
			}
			
		</script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel ="icon" href="https://icons-for-free.com/iconfiles/png/512/locked+login+password+privacy+private+protect+protection+safe-1320196167397530530.png" type ="image/x-icon">
	<link rel ="icon" href="https://icons-for-free.com/iconfiles/png/512/locked+login+password+privacy+private+protect+protection+safe-1320196167397530530.png" type ="image/x-icon">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet"  type="text/css" href="style.css">	
	</head>

	<ul>
		<li><a class="active" href="details.jsp">ADMIN</a></li>
	  </ul>
	
<body>

	<div class="main">

	<form method="post" name="myform"  onsubmit="return validate();">
	
		
		<table>	
		   <%
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); //load driver  
		
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser1","root","surya@123"); // create connection  
	
			if(request.getParameter("edit")!=null) 
			{
				int id=Integer.parseInt(request.getParameter("edit"));
		
				String status;
		
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from epass where id=?"); // sql select query
				pstmt.setInt(1,id);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					id=rs.getInt(1);
					status=rs.getString(2);
			%>
			<br><br><br><br><br><br><br><br><br><br><br><br><center><label>APPROVE OR REJECT</label>
			<select name="txt_status" id="type" required>
				<option value="">SELECT</option>  
				<option value="ACCEPTED">ACCEPT</option>
				 <option value="REJECTED">REJECT</option>
			</select>
			<p align="center"><button type="submit" class="btn btn-outline-primary" name="btn_update">SUBMIT</button></p></center>
			
				
				<input type="hidden" name="txt_hide" value="<%=id%>">
				
		<%
				}
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>	
		</table>
		

		
	</form>

	</div>
</body>

</html>