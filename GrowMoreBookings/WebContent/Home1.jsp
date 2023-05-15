<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<meta name = "viewpoet" content = "width=device-width, initial-scale=1.0">	
<link rel="stylesheet" href="home-1.css">

<!--*******************Prevent user to Go Back************************************************************************************************************************* -->
	<style>

	body{
	
		background-image:url('home.jpg');
		background-size: cover;
		}
	
	</style>




</head>

<body>



	
		<div class="navbar">
		
<!--*******************View Reservations************************************************************************************************************************* -->
			<form action = "ViewReservations.jsp">
	    		<input type ="submit" class="reservation" value = "View Reservations">
			</form>
			
			<text type="text" class="growmorebooking" > Grow More Booking </text>
			<div class="login-icon"><i class="material-icons" style="font-size:30px;">account_circle</i> </div>
			
		<div class="user"><h3><%=session.getAttribute("Id")%></h3></div>
		</div>
		
		<br>
	
		<div class="form-box">	
			<text type="text" class="train-booking" > Book Train Ticket </text>
			<br>
	<%@ page import="java.sql.*"%>
	<% String path = "jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB"; %>
			
<!--*******************Trip Selection************************************************************************************************************************* -->
	
<form action = "Home1.jsp">

	
	
		<select class="trip1" name="trip">
		
			<option selected disabled>Choose a Trip</option>
			<option value="oneWay">One Way</option>
			<option value="roundtrip">Round Trip</option>	
		
		</select>
		
	
		 <input type ="submit" class="submitbtn"  value ="Go"  name="Go"> 
			 
		
</form>


			
		

		
	
	
<!--*******************Origin, Destination, Date, Submit************************************************************************************************************************* -->
	      <form action = "OneWay1.jsp" >
   			<%
				Class.forName("com.mysql.jdbc.Driver");
				java.sql.Connection conn = DriverManager.getConnection(path, "admin", "Keshav100%");
				Statement stmt = conn.createStatement();
	            String sql = "SELECT distinct origin FROM RailwayDB.Schedule;";
	            
	            ResultSet rows = stmt.executeQuery(sql);
	        %>  
	     <!--*******************Origin Selection************************************************************************************************************************* -->
	         
	            
	           		 <select name = "origin" class="origin">
	            		<option disabled selected value="origin">Origin</option> 
	            
	            	
	            	
	        <%  
	           		while(rows.next())
	            	{
	           			String org = rows.getString("origin");
	            		%><option  value = "<%=org %>"><%=rows.getString("origin")%></option><%
	            	}
	        %>  
	            </select>
	         <div class="icon-1" >   <i class="material-icons" style="font-size:30px;">sync_alt</i></div>
	            
	       
			<% 	
				String sql1 = "SELECT distinct destination FROM RailwayDB.Schedule;";
				ResultSet rows1 = stmt.executeQuery(sql1);
			%>
			 
		<!--*******************Destination Selection************************************************************************************************************************* -->
				<select name = "destination" class="destination">
					<option disabled selected value=>Destination</option>
					
	        <%  
	           		while(rows1.next())
	            	{
	           			String des =rows1.getString("destination");
	            		%><option  value = "<%=des %>"><%=rows1.getString("destination")%></option><%
	            	}
	        %>  
	            </select>
	            
	         
	            <br>
	
		 <!--*******************Redirecting Page by Date Selection ************************************************************************************************************************* -->
			
			<%
					if(request.getParameter("trip")==null || request.getParameter("trip").equals("oneWay"))
					{
			%>         
					<div>
						<input  type = "date" name = "onedate"  class="oneway1">
						<br>
					</div>
						
			<%
					}
					else
					{
											
		    %>         
		    		
		    			<input type = "date" name = "onedate"  class="oneway2" > 
						
					<div class="material2">	<i class="material-icons" style="font-size:32px;">compare_arrows</i> </div>
						
						<input type = "date" name = "rounddate"   class="roundtrip">
					
			<%
					}
			  conn.close();
			%>
		  <!--*******************Submit************************************************************************************************************************* -->
			  <br>
              <input type="submit" value="Submit" class="submit" name="submit">
	            
	        </form>

<!--*******************LogOut************************************************************************************************************************* -->	
 	<form action = "LogIn.jsp">
 		<br> <input type="submit" value="Logout" class="logout" name="logout">
	</form>
	
	
	
	
		
		</div>
		
	
	
	
</body>
</html>