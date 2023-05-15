<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<meta name = "viewpoet" content = "width=device-width, initial-scale=1.0">	
<link rel="stylesheet" href="ViewReservations.css">

<style>

	body{
	
		background-image:url('home.jpg');
		background-size: fix;
		}
		
	
	</style>
</head>
<body>

<%@ page import="java.sql.*"%>
<% String path = "jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB"; %>

<div class="title"><h2>View Reservations</h2></div>
<!--******************Search For Reservation Via Reservation Number******************************************************************************************************** -->	
    
    <form action = "Home1.jsp">
		<input type = "submit"class="submit-btn"  name = "home"value = "Home">
	</form>
    
    
    
    <form action = "ViewReservations.jsp">
        <input required type="text" class="Rid" name="resID" placeholder="Reservation ID">
		<input type = "submit"class="search"  name = "Search"value = "Search">
	</form>
	
	<%
	if(request.getParameter("Search")!=null)
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		java.sql.Connection conn = DriverManager.getConnection(path, "admin", "Keshav100%");
		Statement stmt1 = conn.createStatement();
   		String sql1 = "select resID,tid,date,time,totalfare,transitline,origin,destination,departuretime, arrivaltime, sum(adult+disable+senior+child) as TotalPassengers from RailwayDB.Reservation where resID = '"+request.getParameter("resID")+"' group by resid,date,time;";
	
   		ResultSet rows = stmt1.executeQuery(sql1);
   		
   	%>  <table align="center"class="table">
  			
			   <tr>
 		    	   <th>Reservations</th>
 				   <th>Delete</th> 
 			   </tr>
 	<%
   		while(rows.next())
  			{
   			%>
  				<tr>
  			   	 	<td>
  			   	 	
  			   	 	<div class="table1">
  			   	 	
  			   	 	      <div style="color:#003cb3; position:relative; left:370px; top:10px; font-family: 'Lucida Console'; font-size: 18px;">Reservation ID: <b><%= rows.getString("resID") %></b> </div>	  	 
   			  	  		  <div style="color:#003cb3; position:relative; left: 700px; top: -10px; font-family: 'Lucida Console'; font-size: 18px;"><b>Date: <%= rows.getString("date") %></b><br><br></div>
   			  	  
   			  	  		  <div style="color:#003cb3; position:relative; left:20px;  top:-55px;font-family: 'Lucida Console'; font-size: 18px;"><b><%=rows.getString("tid")%>-<%=rows.getString("transitline")%></b><br><br></div>
   			  	  
   		   	   	  
     	     	 		  <div style="color:#000099; position:relative; left:50px; top:-70px; font-family: 'Lucida Console'; font-size: 15px;"><b><%=rows.getString("departuretime")%></b></div> 
  	   		    		  <div style="color:#000099; position:relative; left:700px;  top:-83px; font-family: 'Lucida Console'; font-size: 15px;"><b><%=rows.getString("arrivaltime")%></b></div>
			   			  <div style="color:#000099; position:relative; left:20px; top:-100px;   font-family: 'Lucida Console'; font-size: 15px;" align="center"> <b><%=rows.getString("time")%></b></div><br>		
   		 	      
   		 	  			  <div style="color:#4d4d4d;  width:200px; position:relative; left:20px;   top:-115px;  font-family: 'Courier New'; font-size: 14px;"><b><%=rows.getString("origin")%></b> </div>
 	  					  <div style="color:#4d4d4d;  width:200px; position:relative; left:665px; top:-130px; font-family: 'Courier New'; font-size: 14px;"><b><%=rows.getString("destination")%></b></div>
   			    		  <div style="position:relative; left:6px; top:-145px" >  <hr color="#999999" style="width:400px;">  </div>
   			      
   			    		  <div style="color:#1a75ff;  width:0px; position:relative; left:223px;   top:-185px;  font-family: 'Courier New'; font-size: 40px;"><b>.</b> </div>
 	  					  <div style="color:#1a75ff;  width:0px; position:relative; left:627px; top:-230px; font-family: 'Courier New'; font-size: 40px;"><b>.</b></div>
   				
   			 	  		  <div style ="color:Black; position:relative; left:300px;  top:-220px;   font-family: 'Lucida Console';   font-size: 17px;">Total passenger:<b> <%= rows.getString("TotalPassengers") %></b> </div><br>   			     
   					      <div style ="color:Black; position:relative; left:460px;  top:-257px; font-family: 'Lucida Consolel';  font-size: 17px;">Total Fare: <b><%= rows.getString("totalfare") %></b> </div><br>
   			      
					</div>
					
  			        </td>
  			    
  			        <td>
  			    		<div align="center" class="tableview" ><a href="Delete.jsp?idd=<%=rows.getString("resID")%>">Delete</a></div>
  			        </td>
  			    </tr>
  	 <%
  			}
	  %>
	  </table>
	  <%
	}
	else
	{
		
	%>
<!--******************JDBC Connection******************************************************************************************************** -->	
    <% 
		Class.forName("com.mysql.cj.jdbc.Driver");
		java.sql.Connection conn = DriverManager.getConnection(path, "admin", "Keshav100%");
		Statement stmt1 = conn.createStatement();
   		String sql1 = "select b.resID from RailwayDB.books as b where b.username = '"+String.valueOf(session.getAttribute("Id"))+"';";
   		 

   		ResultSet rows1 = stmt1.executeQuery(sql1);
   		
   	//--***************Check If Two Reservation******************************************************************************************************** -->		
   		
   		while(rows1.next())
   		{
   			Statement stmt2 = conn.createStatement();
   			String sql2 = "select count(r.resID) as count from RailwayDB.Reservation as r where r.resID = '"+rows1.getString("resID")+"';";
   			ResultSet rows2 = stmt2.executeQuery(sql2);
   			
   			if(rows2.next())
   			{
   			if(rows2.getString("count").equals("1"))
   			{
   				Statement stmt3 = conn.createStatement();
   				String sql3 = "select resID,tid,date,time,totalfare,transitline,origin,destination,departuretime, arrivaltime, sum(adult+disable+senior+child) as TotalPassengers from RailwayDB.Reservation where resID = '"+rows1.getString("resID")+"' group by resid,date,time;";
   	   			ResultSet rows3 = stmt3.executeQuery(sql3);
   	   		    
   	   			while(rows3.next())
   	   			{
   	   		 %>	
   	   			<table align="center" class="table">
   	   				<tr>
   	   			   	 <td>
   	   			   	 
   	   			   	 
   	   			   	 <div class="oneway-table">
   	   			   	     	   			   	  
   	   			   	  	  <b>  <text type="text" class="oneway" >One Way</text></b>
   	   			   	  
   	   			   	      <div style="color:#003cb3; position:relative; left:370px; top:10px; font-family: 'Lucida Console'; font-size: 18px;">Reservation ID: <b><%= rows3.getString("resID") %></b> </div>	  	 
   			  	  		  <div style="color:#003cb3; position:relative; left: 700px; top: -10px; font-family: 'Lucida Console'; font-size: 18px;"><b>Date: <%= rows3.getString("date") %></b><br><br></div>
   			  	  
   			  	  		  <div style="color:#003cb3; position:relative; left:20px;  top:-55px;font-family: 'Lucida Console'; font-size: 18px;"><b><%=rows3.getString("tid")%>-<%=rows3.getString("transitline")%></b><br><br></div>
   			  	  
   		   	   	  
     	     	 		  <div style="color:#000099; position:relative; left:50px; top:-70px; font-family: 'Lucida Console'; font-size: 15px;"><b><%=rows3.getString("departuretime")%></b></div> 
  	   		    		  <div style="color:#000099; position:relative; left:700px;  top:-83px; font-family: 'Lucida Console'; font-size: 15px;"><b><%=rows3.getString("arrivaltime")%></b></div>
			   			  <div style="color:#000099; position:relative; left:20px; top:-100px;   font-family: 'Lucida Console'; font-size: 15px;" align="center"> <b><%=rows3.getString("time")%></b></div><br>		
   		 	      
   		 	  			  <div style="color:#4d4d4d;  width:200px; position:relative; left:20px;   top:-115px;  font-family: 'Courier New'; font-size: 14px;"><b><%=rows3.getString("origin")%></b> </div>
 	  					  <div style="color:#4d4d4d;  width:200px; position:relative; left:665px; top:-130px; font-family: 'Courier New'; font-size: 14px;"><b><%=rows3.getString("destination")%></b></div>
   			    		  <div style="position:relative; left:6px; top:-145px" >  <hr color="#999999" style="width:400px;">  </div>
   			      
   			    		  <div style="color:#1a75ff;  width:0px; position:relative; left:223px;   top:-185px;  font-family: 'Courier New'; font-size: 40px;"><b>.</b> </div>
 	  					  <div style="color:#1a75ff;  width:0px; position:relative; left:627px; top:-230px; font-family: 'Courier New'; font-size: 40px;"><b>.</b></div>
   				
   			 	  		  <div style ="color:Black; position:relative; left:300px;  top:-220px;   font-family: 'Lucida Console';   font-size: 17px;">Total passenger:<b> <%= rows3.getString("TotalPassengers") %></b> </div><br>   			     
   					      <div style ="color:Black; position:relative; left:460px;  top:-257px; font-family: 'Lucida Consolel';  font-size: 17px;">Total Fare: <b><%= rows3.getString("totalfare") %></b> </div><br>
   			      
   			        </div>
   			 		
   	   			   	   			   	 
   	   			   
   	   			       </td>
   	   			    
   	   			       <td>
   	   			    		<div align="center" class="tableview" ><a href="Delete.jsp?idd=<%=rows3.getString("resID")%>">Delete</a></div>
   	   			       </td>
   	   			   </tr>
   	   			</table>
   	   	 <%
   	   			}
   	   		
   			}
   			
   			else
   			{
   				
   				// aa 2 row mate nu che, and 1 row mate nu pati gayu che khali quary ek var joi levani che.
   				Statement stmt3 = conn.createStatement();
   				String sql3 = "select resID,tid,date,time,totalfare,transitline,origin,destination,departuretime, arrivaltime, sum(adult+disable+senior+child) as TotalPassengers from RailwayDB.Reservation where resID = '"+rows1.getString("resID")+"' group by resid,date,time;";

   	   			ResultSet rows3 = stmt3.executeQuery(sql3);
   	   			
   	   			
   	   			
   	   	  %>
   	   		<table align="center" class="table">  
   	   			  <tr>
   	   			   	 
   	   	  <%		   	 
   	   			   	 rows3.next();	
   	   	  %>	
   	   	  			 <td>
   	   	  			 
   	   	  			 
   	   	  			 
   	   			   	  <div class="table-contain2">
   	   			   	  
   	   			   	  	  <b>  <text align="center" type="text" class="oneway" >Return</text></b>
   	   			   	  
   	   			   	      <div style="color:#003cb3; position:relative; left:370px; top:10px; font-family: 'Lucida Console'; font-size: 18px;">Reservation ID: <b><%= rows3.getString("resID") %></b> </div>	  	 
   			  	  		  <div style="color:#003cb3; position:relative; left: 700px; top: -10px; font-family: 'Lucida Console'; font-size: 18px;"><b>Date: <%= rows3.getString("date") %></b><br><br></div>
   			  	  
   			  	  		  <div style="color:#003cb3; position:relative; left:20px;  top:-55px;font-family: 'Lucida Console'; font-size: 18px;"><b><%=rows3.getString("tid")%>-<%=rows3.getString("transitline")%></b><br><br></div>
   			  	  
   		   	   	  
     	     	 		  <div style="color:#000099; position:relative; left:50px; top:-70px; font-family: 'Lucida Console'; font-size: 15px;"><b><%=rows3.getString("departuretime")%></b></div> 
  	   		    		  <div style="color:#000099; position:relative; left:700px;  top:-83px; font-family: 'Lucida Console'; font-size: 15px;"><b><%=rows3.getString("arrivaltime")%></b></div>
			   			  <div style="color:#000099; position:relative; left:20px; top:-100px;   font-family: 'Lucida Console'; font-size: 15px;" align="center"> <b><%=rows3.getString("time")%></b></div><br>		
   		 	      
   		 	  			  <div style="color:#4d4d4d;  width:200px; position:relative; left:20px;   top:-115px;  font-family: 'Courier New'; font-size: 14px;"><b><%=rows3.getString("origin")%></b> </div>
 	  					  <div style="color:#4d4d4d;  width:200px; position:relative; left:665px; top:-130px; font-family: 'Courier New'; font-size: 14px;"><b><%=rows3.getString("destination")%></b></div>
   			    		  <div style="position:relative; left:6px; top:-145px" >  <hr color="#999999" style="width:400px;">  </div>
   			      
   			    		  <div style="color:#1a75ff;  width:0px; position:relative; left:223px;   top:-185px;  font-family: 'Courier New'; font-size: 40px;"><b>.</b> </div>
 	  					  <div style="color:#1a75ff;  width:0px; position:relative; left:627px; top:-230px; font-family: 'Courier New'; font-size: 40px;"><b>.</b></div>
   	   			   	      
 
   			      
   			  </div>
   	   	  			 
  	    
   	   			     
   	   			      
         <%		   	 
   	   			   	 rows3.next();	
         
   	   	 %>	
   	   	 
   	   	 
   	   	  <div class="table-contain2">
   	   	  
   			  	    <div style="color:#003cb3; position:relative; left: 700px; top: -10px; font-family: 'Lucida Console'; font-size: 18px;"><b>Date: <%= rows3.getString("date") %></b><br><br></div>  	  
   			  	    <div style="color:#003cb3; position:relative; left:20px;  top:-55px;font-family: 'Lucida Console'; font-size: 18px;"><b><%=rows3.getString("tid")%>-<%=rows3.getString("transitline")%></b><br><br></div>
   			  	  
   		   	   	  
     	     	    <div style="color:#000099; position:relative; left:50px; top:-70px; font-family: 'Lucida Console'; font-size: 15px;"><b><%=rows3.getString("departuretime")%></b></div> 
  	   		    	<div style="color:#000099; position:relative; left:700px;  top:-83px; font-family: 'Lucida Console'; font-size: 15px;"><b><%=rows3.getString("arrivaltime")%></b></div>
			   	    <div style="color:#000099; position:relative; left:20px; top:-100px;   font-family: 'Lucida Console'; font-size: 15px;" align="center"> <b><%=rows3.getString("time")%></b></div><br>		
   		 	      
   		 	  		<div style="color:#4d4d4d;  width:200px; position:relative; left:20px;   top:-115px;  font-family: 'Courier New'; font-size: 14px;"><b><%=rows3.getString("origin")%></b> </div>
 	  			    <div style="color:#4d4d4d;  width:200px; position:relative; left:665px; top:-130px; font-family: 'Courier New'; font-size: 14px;"><b><%=rows3.getString("destination")%></b></div>
   			        <div style="position:relative; left:6px; top:-145px" >  <hr color="#999999" style="width:400px;">  </div>
   			      
   			        <div style="color:#1a75ff;  width:0px; position:relative; left:223px;   top:-185px;  font-family: 'Courier New'; font-size: 40px;"><b>.</b> </div>
 	  			    <div style="color:#1a75ff;  width:0px; position:relative; left:627px; top:-230px; font-family: 'Courier New'; font-size: 40px;"><b>.</b></div>
   				
   			 	    <div style ="color:Black; position:relative; left:300px;  top:-220px;   font-family: 'Lucida Console';   font-size: 17px;">Total passenger:<b> <%= rows3.getString("TotalPassengers") %></b> </div><br>   			     
   					<div style ="color:Black; position:relative; left:460px;  top:-257px; font-family: 'Lucida Consolel';  font-size: 17px;">Total Fare: <b><%= rows3.getString("totalfare") %></b> </div><br>
   	   	  
   	    </div>
   	   				    
   	   			      </td>
   	   			    
   	   			      <td>
   	   			    		<div align="center" class="tableview2" ><a href="Delete.jsp?idd=<%=rows3.getString("resID")%>">Delete</a></div>
   	   			      </td>
   	   		
   	   			
   	   	 <%				
   	   	                 
   	   	  %>
   	   	  	       </tr>  
   	  			 </table>
   	<%
   	   			
   			}
   			}
   	   	 
   		 %>
   			
    <%
   		}
	}
   	%>
  
</body>
</html>