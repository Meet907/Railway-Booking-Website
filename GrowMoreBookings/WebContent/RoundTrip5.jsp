<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<meta name = "viewpoet" content = "width=device-width, initial-scale=1.0">	
<link rel="stylesheet" href="Roundtrip-5.css">
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

<!--******************1 Showing the ticket************************************************************************************************************************** -->	
	<div class="form-box"> 
		
		
			<div  style="color:#1a1aff;  position:relative; left:20px; top:14px; font-family: 'Lucida Console'; font-size: 22px;"><b>Travel Date: <%=session.getAttribute("onedate")%></b><br><br></div>		
   			<div  style="color:#1a1aff;  position:relative; left:600px; top:-38px; font-family: 'Lucida Console'; font-size: 22px;"><b><%=session.getAttribute("tid1")%>-<%=session.getAttribute("transitline1")%></b><br><br></div>
   			  	  
   		   	   	  
   		    <div style="color:#000099; position:relative; left:20px; top:-40px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=session.getAttribute("departuretime1")%></b></div> 
  	    	<div style="color:#000099; position:relative; left:750px;  top:-52px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=session.getAttribute("arrivaltime1")%></b></div>
			<div style="color:#000099; position:relative; left:0px; top:-78px;   font-family: 'Lucida Console'; font-size: 18px;" align="center"> <b><%=session.getAttribute("traveltime1")%></b></div><br>		
   		 	     
   			<div style="color:#4d4d4d;  width:120px; position:relative; left:20px;   top:-85px;  font-family: 'Courier New'; font-size: 17px;"><b><%=session.getAttribute("origin1")%></b> </div>
 	    	<div style="color:#4d4d4d;  width:120px; position:relative; left:750px; top:-120px; font-family: 'Courier New'; font-size: 17px;"><b><%=session.getAttribute("destination1")%></b></div>
   			<div style="position:relative; left:-11px; top:-155px" >  <hr color="#999999" style="width:550px;">  </div>
   			      
   			<div style="color:#1a75ff;  width:0px; position:relative; left:150px;   top:-195px;  font-family: 'Courier New'; font-size: 40px;"><b>.</b> </div>
 	    	<div style="color:#1a75ff;  width:0px; position:relative; left:700px; top:-240px; font-family: 'Courier New'; font-size: 40px;"><b>.</b></div>
   		
   	    	<div style ="color:Black; position:relative; left:412px;  top:-240px;   font-family: 'Lucida Console';   font-size: 15px;">Total Stops:<b> <%=session.getAttribute("totalstops1")%></b> </div><br>  
	
	
	
<!--******************2 Showing the ticket************************************************************************************************************************** -->		

	 <div  style="color:#1a1aff;  position:relative; left:20px; top:-240px; font-family: 'Lucida Console'; font-size: 22px;"><b>Travel Date: <%=session.getAttribute("twodate")%></b><br><br></div>		
   			<div  style="color:#1a1aff;  position:relative; left:600px; top:-290px; font-family: 'Lucida Console'; font-size: 22px;"><b><%=session.getAttribute("tid2")%>-<%=session.getAttribute("transitline2")%></b><br><br></div>
   			  	  
   		   	   	  
   		    <div style="color:#000099; position:relative; left:20px; top:-300px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=session.getAttribute("departuretime2")%></b></div> 
  	    	<div style="color:#000099; position:relative; left:750px;  top:-315px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=session.getAttribute("arrivaltime2")%></b></div>
			<div style="color:#000099; position:relative; left:0px; top:-340px;   font-family: 'Lucida Console'; font-size: 18px;" align="center"> <b><%=session.getAttribute("traveltime2")%></b></div><br>		
   		 	     
   			<div style="color:#4d4d4d;  width:120px; position:relative; left:20px;   top:-350px;  font-family: 'Courier New'; font-size: 17px;"><b><%=session.getAttribute("origin2")%></b> </div>
 	    	<div style="color:#4d4d4d;  width:120px; position:relative; left:750px; top:-385px; font-family: 'Courier New'; font-size: 17px;"><b><%=session.getAttribute("destination2")%></b></div>
   			<div style="position:relative; left:-11px; top:-417px" >  <hr color="#999999" style="width:550px;">  </div>
   			      
   			<div style="color:#1a75ff;  width:0px; position:relative; left:150px;   top:-457px;  font-family: 'Courier New'; font-size: 40px;"><b>.</b> </div>
 	    	<div style="color:#1a75ff;  width:0px; position:relative; left:700px; top:-502px; font-family: 'Courier New'; font-size: 40px;"><b>.</b></div>
   		
   	    	<div style ="color:Black; position:relative; left:412px;  top:-505px;   font-family: 'Lucida Console';   font-size: 15px;">Total Stops:<b> <%=session.getAttribute("totalstops2")%></b> </div><br>   			     
   			
   			
   		</div>

	<%float totalfare = (Float.parseFloat(""+session.getAttribute("totalFare")))*2;%>
	
	
<!--******************1 Inserting Variables************************************************************************************************************************** -->	
	<%String username = (""+session.getAttribute("Id"));%>
	
	<%String date1 = (""+session.getAttribute("onedate"));%>
	<%String travelTime1 = (""+session.getAttribute("traveltime1"));%>
	<%int tid1 =  Integer.parseInt((""+session.getAttribute("tid1")));%>
	<%int rid1 =  Integer.parseInt((""+session.getAttribute("rid1")));%>
	<%int totalseats1 =  Integer.parseInt((""+session.getAttribute("totalseats1")));%>
	<%String transitline1 = (""+session.getAttribute("transitline1"));%>
	<%String origin1 = (""+session.getAttribute("origin1"));%>
	<%String destination1 = (""+session.getAttribute("destination1"));%>
	<%String departuretime1 = (""+session.getAttribute("departuretime1"));%>
	<%String arrivaltime1 = (""+session.getAttribute("arrivaltime1"));%>
	
<!--******************2 Inserting Variables************************************************************************************************************************** -->	
	<%String date2 = (""+session.getAttribute("twodate"));%>
	<%String travelTime2 = (""+session.getAttribute("traveltime2"));%>
	<%int tid2 =  Integer.parseInt((""+session.getAttribute("tid2")));%>
	<%int rid2 =  Integer.parseInt((""+session.getAttribute("rid2")));%>
	<%int totalseats2 =  Integer.parseInt((""+session.getAttribute("totalseats2")));%>
	<%String transitline2 = (""+session.getAttribute("transitline2"));%>
	<%String origin2 = (""+session.getAttribute("origin2"));%>
	<%String destination2 = (""+session.getAttribute("destination2"));%>
	<%String departuretime2 = (""+session.getAttribute("departuretime2"));%>
	<%String arrivaltime2 = (""+session.getAttribute("arrivaltime2"));%>
	
<!--******************Same Inserting Variables************************************************************************************************************************** -->		
	<%int adult =  Integer.parseInt((""+session.getAttribute("totalAd")));%>
	<%int child =  Integer.parseInt((""+session.getAttribute("totalCh")));%>
	<%int disable =  Integer.parseInt((""+session.getAttribute("totalDi")));%>
	<%int senior =  Integer.parseInt((""+session.getAttribute("totalSe")));%>
	<%int totalPassenger =  Integer.parseInt((""+session.getAttribute("totalPassenger")));%>
	
	<%float totalADfare =  Float.parseFloat((""+session.getAttribute("totalAdultFare")));%>
	<%float totalCHfare =  Float.parseFloat((""+session.getAttribute("totalChildronFare")));%>
	<%float totalDIfare =  Float.parseFloat((""+session.getAttribute("totalDisabledFare")));%>
	<%float totalSEfare =  Float.parseFloat((""+session.getAttribute("totalSeniorFare")));%>
	<%float totalFare =  Float.parseFloat((""+session.getAttribute("totalFare")));%>
	
	
<!--******************JDBC Connection************************************************************************************************************************** -->	
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
			
			%><div class="reservation"><h1>Reservation ID:<%=resID %> </h1><%	
					
//<!--******************Inserting into Database************************************************************************************************************************* -->	
			
			String sql1 = "insert into RailwayDB.Reservation (resID, date, time, totalfare, adult, child, disable, senior, totalADfare, totalCHfare, totalDIfare, totalSEfare, transitline, origin, destination, departuretime, arrivaltime, rid, tid) values("+resID+", '"+date1+"', '"+travelTime1+"', "+totalFare+","+adult+","+child+","+disable+", "+senior+","+totalADfare+","+totalCHfare+","+totalDIfare+","+totalSEfare+",'"+transitline1+"','"+origin1+"','"+destination1+"','"+departuretime1+"','"+arrivaltime1+"',"+rid1+","+tid1+");";
			int update1 = stmt.executeUpdate(sql1);
			String sql2 = "insert into RailwayDB.Reservation (resID, date, time, totalfare, adult, child, disable, senior, totalADfare, totalCHfare, totalDIfare, totalSEfare, transitline, origin, destination, departuretime, arrivaltime, rid, tid) values("+resID+", '"+date2+"', '"+travelTime2+"', "+totalFare+","+adult+","+child+","+disable+", "+senior+","+totalADfare+","+totalCHfare+","+totalDIfare+","+totalSEfare+",'"+transitline2+"','"+origin2+"','"+destination2+"','"+departuretime2+"','"+arrivaltime2+"',"+rid2+","+tid2+");";
			int update2 = stmt.executeUpdate(sql2);
			
			String sql3 = "insert into RailwayDB.for_res (resID, tid,rid,transitLine) values ("+resID+","+tid1+","+rid1+",'"+transitline1+"');";
			int update3 = stmt.executeUpdate(sql3);
			String sql4 = "insert into RailwayDB.for_res (resID, tid,rid,transitLine) values ("+resID+","+tid2+","+rid2+",'"+transitline2+"');";
			int update4 = stmt.executeUpdate(sql4);
			
			String sql5 = "insert into RailwayDB.books (resID, username) values ("+resID+",'"+username+"');";
			int update5 = stmt.executeUpdate(sql5);
			
			String sql6 = "update RailwayDB.Train set totalseats = "+totalseats1+" - "+totalPassenger+" where tid = "+tid1+";";
			int update6 = stmt.executeUpdate(sql6);
			String sql7 = "update RailwayDB.Train set totalseats = "+totalseats2+" - "+totalPassenger+" where tid = "+tid2+";";
			int update7 = stmt.executeUpdate(sql7);
		}
	 %>
	 
<!--******************Print And Going Home************************************************************************************************************************** -->	
	<form>
		<input type = "submit" class="submit-btn1" value = "Print" onclick = "window.print()">
	</form>
	
	<form action = "Home1.jsp">
	    	<input type ="submit" class="submit-btn" value = "Home">
    </form>

</body>
</html>