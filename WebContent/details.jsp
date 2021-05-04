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
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>
<%@page import="java.sql.*" %>

<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser1","root","surya@123");  //create connection 

	if(request.getParameter("delete")!=null)
	{
		int id=Integer.parseInt(request.getParameter("delete"));
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("delete from epass where id=? "); //sql delete query
		pstmt.setInt(1,id);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%>	
<html>


	
	<head>
		
	
		<title>ADMIN</title>
		
		<!--css for div main class and table -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<link rel ="icon" href="https://icons-for-free.com/iconfiles/png/512/locked+login+password+privacy+private+protect+protection+safe-1320196167397530530.png" type ="image/x-icon">
		<link rel="stylesheet" href="details.css">
		<link rel ="icon" href="https://icons-for-free.com/iconfiles/png/512/locked+login+password+privacy+private+protect+protection+safe-1320196167397530530.png" type ="image/x-icon">
    	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    	<link rel="stylesheet"  type="text/css" href="style.css">
</head>
	</head>	
	
	<ul>
		<div id="navbar">
		<li><a class="active" href="details.jsp">Home</a></li>
		<ul class="nav navbar-nav navbar-right"></ul>
            <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span>logout</a></li>
	  </ul>
	</div>
	
	  
	
<body>
		
		

	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">FULL NAME</th>
				<th scope="col">PARENT/GUARDIAN NAME</th>
				<th scope="col">MOBILE NUMBER</th>
				<th scope="col">EMAIL</th>
				<th scope="col">GENDER</th>	
				<th scope="col">AGE</th>
				<th scope="col">PASSENGERS</th>
				<th scope="col">ID PROOF</th>
				<th scope="col">ID PROOF NUMBER</th>
				<th scope="col">ADDRESS</th>
				<th scope="col">DATE</th>
				<th scope="col">SOURCE</th>
				<th scope="col">DESTINATION</th>
				<th scope="col">TRAVEL RANGE</th>
				<th scope="col">REASON</th>
				<th scope="col">VEHICLE TYPE</th>
				<th scope="col">VEHICLE NUMBER</th>
				<th scope="col">APPROVAL</th>
				<th scope="col">STATUS</th>
			</tr>
		</thead>
		<%
		
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");  //load driver 
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser1","root","surya@123");  //creat connection 

			PreparedStatement pstmt=null; //create statement
		
			pstmt=con.prepareStatement("select * from epass"); //sql select query  
			
			ResultSet rs=pstmt.executeQuery(); //execute query and set in resultset object rs.  
		
			while(rs.next())
			{	
		%>
				<tbody>
					<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>
					<td><%=rs.getString(9)%></td>
					<td><%=rs.getString(10)%></td>
					<td><%=rs.getString(11)%></td>
					<td><%=rs.getString(12)%></td>
					<td><%=rs.getString(13)%></td>
					<td><%=rs.getString(14)%></td>
					<td><%=rs.getString(15)%></td>
					<td><%=rs.getString(18)%></td>
					<td><%=rs.getString(17)%></td>
					<td><%=rs.getString(16)%></td>
					<td><%=rs.getString(19)%></td>
					
					<td><button type="button" onclick="document.location='check.jsp?edit=<%=rs.getInt(1)%>'" class="btn btn-success" >CHECK</button></td>
					</tr>
			</tbody>
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