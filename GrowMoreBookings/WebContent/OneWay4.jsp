<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<meta name = "viewpoet" content = "width=device-width, initial-scale=1.0">	
<link rel="stylesheet" href="Oneway4.css">
</head>
<body>


<style>

	body{
	
		background-image:url('roundtrip5.jpg');
		background-size: cover;
		}
	
	</style>
<%@ page import="java.sql.*"%>
<% String path = "jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB"; %>

	<div class="thankyou" align="center"><h1>Thank You for Using our Service. Please Print your ticket from here</h1></div>
	
<!--******************Showing the ticket************************************************************************************************************************** -->	
	<div class="form-box"> 
	
		<div  style="color:#1a1aff;  position:relative; left:20px; top:30px; font-family: 'Lucida Console'; font-size: 19px;"><b>Travel Date: <%=session.getAttribute("onedate")%></b><br><br></div>		
   		<div  style="color:#1a1aff;  position:relative; left:647px; top:-15px; font-family: 'Lucida Console'; font-size: 19px;"><b><%=session.getAttribute("tid")%>-<%=session.getAttribute("transitline")%></b><br><br></div>
   			  	  
   		   	   	  
   	    <div style="color:#000099; position:relative; left:20px; top:-20px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=session.getAttribute("departuretime")%></b></div> 
  	    <div style="color:#000099; position:relative; left:750px;  top:-40px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=session.getAttribute("arrivaltime")%></b></div>
		<div style="color:#000099; position:relative; left:0px; top:-60px;   font-family: 'Lucida Console'; font-size: 18px;" align="center"> <b><%=session.getAttribute("traveltime")%></b></div><br>		
   		 	     
   		<div style="color:#4d4d4d;  width:120px; position:relative; left:20px;   top:-80px;  font-family: 'Courier New'; font-size: 17px;"><b><%=session.getAttribute("origin")%></b> </div>
 	    <div style="color:#4d4d4d;  width:120px; position:relative; left:750px; top:-117px; font-family: 'Courier New'; font-size: 17px;"><b><%=session.getAttribute("destination")%></b></div>
   		<div style="position:relative; left:-11px; top:-155px" >  <hr color="#999999" style="width:550px;">  </div>
   			      
   		<div style="color:#1a75ff;  width:0px; position:relative; left:150px;   top:-195px;  font-family: 'Courier New'; font-size: 40px;"><b>.</b> </div>
 	    <div style="color:#1a75ff;  width:0px; position:relative; left:700px; top:-240px; font-family: 'Courier New'; font-size: 40px;"><b>.</b></div>
   		
   	    <div style ="color:Black; position:relative; left:412px;  top:-240px;   font-family: 'Lucida Console';   font-size: 15px;">Total Stops:<b> <%=session.getAttribute("totalstops")%></b> </div><br>   			     
		<div style ="color:Black; position:relative; left:230px;  top:-230px;   font-family: 'Lucida Console';   font-size: 18px;">Total Passenger:<b> <%=session.getAttribute("totalPassenger")%></b> </div><br>  
		<div style ="color:Black; position:relative; left:540px;  top:-267px;   font-family: 'Lucida Console';   font-size: 18px;">Total Fare:<b> <%=session.getAttribute("totalFare")%></b> </div><br>  
	
	</div>
	
	
<!--******************Inserting Variables************************************************************************************************************************** -->	
	<%String date = (""+session.getAttribute("onedate"));%>
	<%String travelTime = (""+session.getAttribute("traveltime"));%>
	<%float totalFare =  Float.parseFloat((""+session.getAttribute("totalFare")));%>
	<%int adult =  Integer.parseInt((""+session.getAttribute("totalAd")));%>
	<%int child =  Integer.parseInt((""+session.getAttribute("totalCh")));%>
	<%int disable =  Integer.parseInt((""+session.getAttribute("totalDi")));%>
	<%int senior =  Integer.parseInt((""+session.getAttribute("totalSe")));%>
	<%float totalADfare =  Float.parseFloat((""+session.getAttribute("totalAdultFare")));%>
	<%float totalCHfare =  Float.parseFloat((""+session.getAttribute("totalChildronFare")));%>
	<%float totalDIfare =  Float.parseFloat((""+session.getAttribute("totalDisabledFare")));%>
	<%float totalSEfare =  Float.parseFloat((""+session.getAttribute("totalSeniorFare")));%>
	<%int tid =  Integer.parseInt((""+session.getAttribute("tid")));%>
	<%int rid =  Integer.parseInt((""+session.getAttribute("rid")));%>
	<%String transitline = (""+session.getAttribute("transitline"));%>
	<%String username = (""+session.getAttribute("Id"));%>
	<%int totalseats =  Integer.parseInt((""+session.getAttribute("totalseats")));%>
	<%int totalPassenger =  Integer.parseInt((""+session.getAttribute("totalPassenger")));%>
	<%String origin = (""+session.getAttribute("origin"));%>
	<%String destination = (""+session.getAttribute("destination"));%>
	<%String departuretime = (""+session.getAttribute("departuretime"));%>
	<%String arrivaltime = (""+session.getAttribute("arrivaltime"));%>


<!--******************Inserting Data to the DataBase************************************************************************************************************************** -->	
	<%
	
	//fair
		if(request.getParameter("confirm")!=null)
		{
			int resID = 0;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			java.sql.Connection conn = DriverManager.getConnection(path, "admin", "Keshav100%");
			Statement stmt = conn.createStatement();
			
			ResultSet rows = null;

//******************Generating Rendom ReservationID************************************************************************************************************************** -->	
			do
			{
				resID = ((int) (Math.random()*(10000 - 1))) + 1;
				String sql0 ="select resID FROM RailwayDB.Reservation where resID ="+resID+";";
	 		    rows = stmt.executeQuery(sql0);
			}
		while(rows.next());
			
			
			%><div class="reservation"><h1>Reservation ID:<%=resID %> </h1> </div><%
			
					
					
//<!--******************Inserting into Database************************************************************************************************************************* -->	
					
			
			String sql1 = "insert into RailwayDB.Reservation (resID, date, time, totalfare, adult, child, disable, senior, totalADfare, totalCHfare, totalDIfare, totalSEfare, transitline, origin, destination, departuretime, arrivaltime, rid, tid) values("+resID+", '"+date+"', '"+travelTime+"', "+totalFare+","+adult+","+child+","+disable+", "+senior+","+totalADfare+","+totalCHfare+","+totalDIfare+","+totalSEfare+",'"+transitline+"','"+origin+"','"+destination+"','"+departuretime+"','"+arrivaltime+"',"+rid+","+tid+");";
			int update0 = stmt.executeUpdate(sql1);
			
			String sql2 = "insert into RailwayDB.for_res (resID, tid,rid,transitLine) values ("+resID+","+tid+","+rid+",'"+transitline+"');";
			int update1 = stmt.executeUpdate(sql2);
			
			String sql3 = "insert into RailwayDB.books (resID, username) values ("+resID+",'"+username+"');";
			int update2 = stmt.executeUpdate(sql3);
			
			String sql4 = "update RailwayDB.Train set totalseats = "+totalseats+" - "+totalPassenger+" where tid = "+tid+";";
			int update3 = stmt.executeUpdate(sql4);
		}
	 %>

<!--******************Print And Going Home************************************************************************************************************************** -->	
	<form>
		<input type = "submit"class="submit-btn" value = "Print" onclick = "window.print()">
	</form>
	
	<form action = "Home1.jsp">
	    	<input type ="submit" class="home"  value = "Home">
    </form>
		
</body>
</html>