<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<meta name = "viewpoet" content = "width=device-width, initial-scale=1.0">	
<link rel="stylesheet" href="roundtrip-3.css">
</head>
<body>

<style>

	body{
	
		background-image:url('newoneway3.jpg');
		background-size: cover;
		}
	
	</style>

	
<%@ page import="java.sql.*"%>
<% String path = "jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB"; %>

<!--******************Connection************************************************************************************************************************** --> 
	<% 
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		java.sql.Connection conn = DriverManager.getConnection(path, "admin", "Keshav100%");
		Statement stmt = conn.createStatement();
   		String sql = "select s.tid, s.transitline, s.origin, s.destination,s.rid, r.totalstops, ad.departuretime, ad.arrivaltime, r.traveltime, t.totalseats from RailwayDB.Schedule as s, RailwayDB.arridept as ad, RailwayDB.route as r, RailwayDB.Train as t where s.transitline = ad.transitline and s.rid = r.rid and s.tid = t.tid and s.tid = "+String.valueOf(session.getAttribute("tid1"))+";";
   	
   		ResultSet rows = stmt.executeQuery(sql);
   		float price1 = 0f;
   		
//******************1 Showing the ticket************************************************************************************************************************** --> 	
   		if(rows.next())
   		{
   			%>
   			
   			
   		<div class="form-box"> 
		
		
			<div  style="color:#1a1aff;  position:relative; left:20px; top:12px; font-family: 'Lucida Console'; font-size: 22px;"><b>Travel Date: <%=session.getAttribute("onedate")%></b><br><br></div>		
   			<div  style="color:#1a1aff;  position:relative; left:600px; top:-38px; font-family: 'Lucida Console'; font-size: 22px;"><b><%=rows.getString("tid")%>-<%=rows.getString("transitline")%></b><br><br></div>
   			  	  
   		   	   	  
   		    <div style="color:#000099; position:relative; left:20px; top:-40px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=rows.getString("departuretime")%></b></div> 
  	    	<div style="color:#000099; position:relative; left:750px;  top:-52px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=rows.getString("arrivaltime")%></b></div>
			<div style="color:#000099; position:relative; left:0px; top:-78px;   font-family: 'Lucida Console'; font-size: 18px;" align="center"> <b><%=rows.getString("traveltime")%></b></div><br>		
   		 	     
   			<div style="color:#4d4d4d;  width:120px; position:relative; left:20px;   top:-85px;  font-family: 'Courier New'; font-size: 17px;"><b><%=rows.getString("origin")%></b> </div>
 	    	<div style="color:#4d4d4d;  width:120px; position:relative; left:750px; top:-120px; font-family: 'Courier New'; font-size: 17px;"><b><%=rows.getString("destination")%></b></div>
   			<div style="position:relative; left:-11px; top:-155px" >  <hr color="#999999" style="width:550px;">  </div>
   			      
   			<div style="color:#1a75ff;  width:0px; position:relative; left:150px;   top:-195px;  font-family: 'Courier New'; font-size: 40px;"><b>.</b> </div>
 	    	<div style="color:#1a75ff;  width:0px; position:relative; left:700px; top:-240px; font-family: 'Courier New'; font-size: 40px;"><b>.</b></div>
   		
   	    	<div style ="color:Black; position:relative; left:412px;  top:-240px;   font-family: 'Lucida Console';   font-size: 15px;">Total Stops:<b> <%=rows.getString("totalstops")%></b> </div><br>   			     
   			
   			
   		
   	
   			
<!--******************Set All Data in Session************************************************************************************************************************** -->
		<%session.setAttribute("tid1",rows.getString("tid"));%>
		<%session.setAttribute("transitline1",rows.getString("transitline"));%>
		<%session.setAttribute("origin1",rows.getString("origin")); %>
		<%session.setAttribute("destination1",rows.getString("destination"));%>
		<%session.setAttribute("totalstops1",rows.getString("totalstops"));%>
		<%session.setAttribute("departuretime1",rows.getString("departuretime"));%>
		<%session.setAttribute("arrivaltime1",rows.getString("arrivaltime")); %>
		<%session.setAttribute("traveltime1",rows.getString("traveltime")); %>
		<%session.setAttribute("totalseats1",rows.getString("totalseats"));%>
		<%session.setAttribute("rid1",rows.getString("rid"));%>
		
		
	 <%
		if(rows.getString("totalstops").equals("0"))
		{
			price1 = 50f;
		}
		else
		{
			price1 = Float.parseFloat(rows.getString("totalstops"));
		}
	}
	 %> 

<!--******************For 2ed Train************************************************************************************************************************** -->	 
	 
	 <%
	 	String sql1 = "select s.tid, s.transitline, s.origin, s.destination,s.rid, r.totalstops, ad.departuretime, ad.arrivaltime, r.traveltime, t.totalseats from RailwayDB.Schedule as s, RailwayDB.arridept as ad, RailwayDB.route as r, RailwayDB.Train as t where s.transitline = ad.transitline and s.rid = r.rid and s.tid = t.tid and s.tid = "+request.getParameter("tid2")+";";
   		ResultSet rows1 = stmt.executeQuery(sql1);
   	 
//******************2 Showing the ticket************************************************************************************************************************** --> 	
   		if(rows1.next())
   		{
   			%>
   			
   			
   			
		
		
			<div  style="color:#1a1aff;  position:relative; left:20px; top:-240px; font-family: 'Lucida Console'; font-size: 22px;"><b>Travel Date: <%=session.getAttribute("twodate")%></b><br><br></div>		
   			<div  style="color:#1a1aff;  position:relative; left:600px; top:-290px; font-family: 'Lucida Console'; font-size: 22px;"><b><%=rows1.getString("tid")%>-<%=rows1.getString("transitline")%></b><br><br></div>
   			  	  
   		   	   	  
   		    <div style="color:#000099; position:relative; left:20px; top:-300px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=rows1.getString("departuretime")%></b></div> 
  	    	<div style="color:#000099; position:relative; left:750px;  top:-315px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=rows1.getString("arrivaltime")%></b></div>
			<div style="color:#000099; position:relative; left:0px; top:-340px;   font-family: 'Lucida Console'; font-size: 18px;" align="center"> <b><%=rows1.getString("traveltime")%></b></div><br>		
   		 	     
   			<div style="color:#4d4d4d;  width:120px; position:relative; left:20px;   top:-350px;  font-family: 'Courier New'; font-size: 17px;"><b><%=rows1.getString("origin")%></b> </div>
 	    	<div style="color:#4d4d4d;  width:120px; position:relative; left:750px; top:-385px; font-family: 'Courier New'; font-size: 17px;"><b><%=rows1.getString("destination")%></b></div>
   			<div style="position:relative; left:-11px; top:-417px" >  <hr color="#999999" style="width:550px;">  </div>
   			      
   			<div style="color:#1a75ff;  width:0px; position:relative; left:150px;   top:-457px;  font-family: 'Courier New'; font-size: 40px;"><b>.</b> </div>
 	    	<div style="color:#1a75ff;  width:0px; position:relative; left:700px; top:-502px; font-family: 'Courier New'; font-size: 40px;"><b>.</b></div>
   		
   	    	<div style ="color:Black; position:relative; left:412px;  top:-505px;   font-family: 'Lucida Console';   font-size: 15px;">Total Stops:<b> <%=rows1.getString("totalstops")%></b> </div><br>   			     
   			
   			
   		</div>
   		
   	<% 	
   		float price = 0f;
   		
   		float price2 = 0f;
   		
		
			if((""+session.getAttribute("totalstops1")).equals("0"))
			{
				price2 = 50f;
			}
			else
			{
				price2 = Float.parseFloat(""+session.getAttribute("totalstops1"));
			}
				price = (50/price1/price2);
   			
	%>
   			
   			
   			<div class="discount">
   				<h2>Discount: Children:25%, seniors:35% and disabled:50%</h2>
   			</div>
   			
<!--******************Set All Data in Session************************************************************************************************************************** -->
		<%session.setAttribute("price",price);%>
		<%session.setAttribute("tid2",rows1.getString("tid"));%>
		<%session.setAttribute("transitline2",rows1.getString("transitline"));%>
		<%session.setAttribute("origin2",rows1.getString("origin")); %>
		<%session.setAttribute("destination2",rows1.getString("destination"));%>
		<%session.setAttribute("totalstops2",rows1.getString("totalstops"));%>
		<%session.setAttribute("departuretime2",rows1.getString("departuretime"));%>
		<%session.setAttribute("arrivaltime2",rows1.getString("arrivaltime")); %>
		<%session.setAttribute("traveltime2",rows1.getString("traveltime")); %>
		<%session.setAttribute("totalseats2",rows1.getString("totalseats"));%>
		<%session.setAttribute("rid2",rows1.getString("rid"));%>
		
	 <%
	  }
	 %> 

<!--******************Choosing how many tickets user want to buy************************************************************************************************************************** --> 	 
	
<div class="fare">
	<form action = "RoundTrip4.jsp">	
	
	
			
		    <div class="choose-ticket">  <h3>Choose the Number of Tickets you want to Buy.</h3></div>
		    
		    <input required type="number" class="fare-details"min = "0" max="10" name="totalAd"
					placeholder="Adults">	
					
			<input required type="number" class="fare-details"min = "0" max="10" name="totalCh"
					placeholder="Children">
	
			<input required type="number" class="fare-details"min = "0" max="10" name="totalDi"
					placeholder="Disabled">
					
			<input required type="number" class="fare-details"min = "0" max="10" name="totalSe"
					placeholder="Seniors">	
				
			<br><br><input type="submit" class="submit-btn" value = "Submit" name = "Submit3">
		</form>
</div>
</body>
</html>