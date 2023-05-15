<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<meta name = "viewpoet" content = "width=device-width, initial-scale=1.0">	
<link rel="stylesheet" href="Oneway-2.css">
</head>
<body>
<%@ page import="java.sql.*"%>
<% String path = "jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB"; %>

	
	<style>

	body{
	
		background-image:url('oneway2.jpg');
		background-size: cover;
		}
	
	</style>

<!--******************Connection************************************************************************************************************************** --> 
	<% 
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		java.sql.Connection conn = DriverManager.getConnection(path, "admin", "Keshav100%");
		Statement stmt = conn.createStatement();
   		String sql = "select s.tid, s.transitline, s.origin, s.destination,s.rid, r.totalstops, ad.departuretime, ad.arrivaltime, r.traveltime, t.totalseats from RailwayDB.Schedule as s, RailwayDB.arridept as ad, RailwayDB.route as r, RailwayDB.Train as t where s.transitline = ad.transitline and s.rid = r.rid and s.tid = t.tid and s.tid = "+request.getParameter("tid1")+";";
   	
   		ResultSet rows = stmt.executeQuery(sql);
   		
//******************Showing the ticket************************************************************************************************************************** --> 	
	if(rows.next())
	{
		%>
		
		<div class="form-box"> 
		
		
		<div  style="color:#1a1aff;  position:relative; left:20px; top:12px; font-family: 'Lucida Console'; font-size: 22px;"><b>Travel Date: <%=session.getAttribute("onedate")%></b><br><br></div>		
   		<div  style="color:#1a1aff;  position:relative; left:600px; top:-38px; font-family: 'Lucida Console'; font-size: 22px;"><b><%=rows.getString("tid")%>-<%=rows.getString("transitline")%></b><br><br></div>
   			  	  
   		   	   	  
   	    <div style="color:#000099; position:relative; left:20px; top:-20px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=rows.getString("departuretime")%></b></div> 
  	    <div style="color:#000099; position:relative; left:750px;  top:-40px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=rows.getString("arrivaltime")%></b></div>
		<div style="color:#000099; position:relative; left:0px; top:-63px;   font-family: 'Lucida Console'; font-size: 18px;" align="center"> <b><%=rows.getString("traveltime")%></b></div><br>		
   		 	     
   		<div style="color:#4d4d4d;  width:120px; position:relative; left:20px;   top:-80px;  font-family: 'Courier New'; font-size: 17px;"><b><%=rows.getString("origin")%></b> </div>
 	    <div style="color:#4d4d4d;  width:120px; position:relative; left:750px; top:-117px; font-family: 'Courier New'; font-size: 17px;"><b><%=rows.getString("destination")%></b></div>
   		<div style="position:relative; left:-11px; top:-155px" >  <hr color="#999999" style="width:550px;">  </div>
   			      
   		<div style="color:#1a75ff;  width:0px; position:relative; left:150px;   top:-195px;  font-family: 'Courier New'; font-size: 40px;"><b>.</b> </div>
 	    <div style="color:#1a75ff;  width:0px; position:relative; left:700px; top:-240px; font-family: 'Courier New'; font-size: 40px;"><b>.</b></div>
   		
   	    <div style ="color:Black; position:relative; left:412px;  top:-240px;   font-family: 'Lucida Console';   font-size: 15px;">Total Stops:<b> <%=rows.getString("totalstops")%></b> </div><br>   			     

		
		

		
		<%
			float price = 0f;
			if(rows.getString("totalstops").equals("0"))
			{
				price = 50f;
			}
			else
			{
				price = (50/Integer.parseInt(rows.getString("totalstops")));
			}
				
		%>
				
		
		<div class="discount">
			<h2>Discount: Children:25%, seniors:35% and disabled:50%</h2>
		</div>
		
		</div>
		
		
		
	
		
		
		
<!--******************Set All Data in Session************************************************************************************************************************** -->
		<%session.setAttribute("price",price);%>
		<%session.setAttribute("tid",rows.getString("tid"));%>
		<%session.setAttribute("transitline",rows.getString("transitline"));%>
		<%session.setAttribute("origin",rows.getString("origin")); %>
		<%session.setAttribute("destination",rows.getString("destination"));%>
		<%session.setAttribute("totalstops",rows.getString("totalstops"));%>
		<%session.setAttribute("departuretime",rows.getString("departuretime"));%>
		<%session.setAttribute("arrivaltime",rows.getString("arrivaltime")); %>
		<%session.setAttribute("traveltime",rows.getString("traveltime")); %>
		<%session.setAttribute("totalseats",rows.getString("totalseats"));%>
		<%session.setAttribute("rid",rows.getString("rid"));%>
		
	 <%
	}
	 %> 
<!--******************Choosing how many tickets user want to buy************************************************************************************************************************** --> 	 
	
<div class="fare">
	<form action = "OneWay3.jsp">	
	
			<div class="fare1"><h3>Fare for Selected Ticket (pr Head) : $<%=session.getAttribute("price")%> </h3></div>
		    
		    <div class="choose-ticket"><h4>Choose the Number of Tickets you want to Buy.</h4></div>
		    <input required type="number" class="fare-details" min = "0" max="10" name="totalAd"
					placeholder="Adults">	
					
			<input required type="number" class="fare-details" min = "0" max="10" name="totalCh"
					placeholder="Children">
	
			<input required type="number" class="fare-details" min = "0" max="10" name="totalDi"
					placeholder="Disabled">
					
			<input required type="number" class="fare-details" min = "0" max="10" name="totalSe"
					placeholder="Seniors">	
				
			
			<br><br><input type="submit" class="submit-btn" value = "Submit" name = "Submit2">
		</form>
		
</div>
</body>
</html>