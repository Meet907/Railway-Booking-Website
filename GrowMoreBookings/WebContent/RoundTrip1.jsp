<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<meta name = "viewpoet" content = "width=device-width, initial-scale=1.0">	
<link rel="stylesheet" href="Roundtrip-1.css">
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

<!--*******************Header************************************************************************************************************************* -->
<b>	<div class="title" align="center"><h3>Reservation For Departure: <%=session.getAttribute("onedate")%></h3></div></b>

<!--***************Shorting***************************************************************************************************************************** -->
          <form action= "RoundTrip1.jsp">
                  <select name= "short" class="sort">
                   <option disabled selected value=>Sort By</option>  
                	<option value = "arrivaltime">Arrival Time</option>
                	<option value = "arrivaltimeD">Arrival Time in Descending</option>
                	<option value = "departuretime">Departure Time</option>
                	<option value = "departuretimeD">Departure Time Descending</option>
                	<option value = "fare">Fare</option>
                	<option value = "fareD">Fare Descending</option>
                	<option value = "origin">Origin</option>
                	<option value = "originD">Origin Descending</option>
                	<option value = "destination">Destination</option>
                	<option value = "destinationD">Destination Descending</option>
                	<option value = "stops">Stops</option>
                	<option value = "stopsD">Stops Descending</option>
                  </select>
                  <input type="submit" class="go" name = "bingo" value="GO">              
           </form>
           
<!--*******************JDBC Connection************************************************************************************************************************* -->
	<% 
		Class.forName("com.mysql.cj.jdbc.Driver");
		java.sql.Connection conn = DriverManager.getConnection(path, "admin", "Keshav100%");
		Statement stmt = conn.createStatement();
   		String sql = "";
    
   		if(request.getParameter("short")==null)
		{
			sql = "select s.*,r.totalstops, ad.departuretime, ad.arrivaltime, r.traveltime, t.totalseats from RailwayDB.Schedule as s, RailwayDB.arridept as ad, RailwayDB.route as r, RailwayDB.Train as t where s.origin = '"+String.valueOf(session.getAttribute("origin"))+"' and s.destination = '"+String.valueOf(session.getAttribute("destination"))+"' and s.transitline = ad.transitline and s.rid = r.rid and s.tid = t.tid and t.totalseats > 0 order by s.tid"+";";
		}
		else if(request.getParameter("short").equals("arrivaltime"))
		{
		 	sql = "select s.*,r.totalstops, ad.departuretime, ad.arrivaltime, r.traveltime, t.totalseats from RailwayDB.Schedule as s, RailwayDB.arridept as ad, RailwayDB.route as r, RailwayDB.Train as t where s.origin = '"+String.valueOf(session.getAttribute("origin"))+"' and s.destination = '"+String.valueOf(session.getAttribute("destination"))+"' and s.transitline = ad.transitline and s.rid = r.rid and s.tid = t.tid and t.totalseats > 0 order by ad.arrivaltime"+";";
		}
		else if(request.getParameter("short").equals("arrivaltimeD"))
		{
		 	sql = "select s.*,r.totalstops, ad.departuretime, ad.arrivaltime, r.traveltime, t.totalseats from RailwayDB.Schedule as s, RailwayDB.arridept as ad, RailwayDB.route as r, RailwayDB.Train as t where s.origin = '"+String.valueOf(session.getAttribute("origin"))+"' and s.destination = '"+String.valueOf(session.getAttribute("destination"))+"' and s.transitline = ad.transitline and s.rid = r.rid and s.tid = t.tid and t.totalseats > 0 order by ad.arrivaltime desc"+";";
		}
		else if(request.getParameter("short").equals("departuretime"))
		{
		 	sql = "select s.*,r.totalstops, ad.departuretime, ad.arrivaltime, r.traveltime, t.totalseats from RailwayDB.Schedule as s, RailwayDB.arridept as ad, RailwayDB.route as r, RailwayDB.Train as t where s.origin = '"+String.valueOf(session.getAttribute("origin"))+"' and s.destination = '"+String.valueOf(session.getAttribute("destination"))+"' and s.transitline = ad.transitline and s.rid = r.rid and s.tid = t.tid and t.totalseats > 0 order by ad.departuretime"+";";
		}
		else if(request.getParameter("short").equals("departuretimeD"))
		{
		 	sql = "select s.*,r.totalstops, ad.departuretime, ad.arrivaltime, r.traveltime, t.totalseats from RailwayDB.Schedule as s, RailwayDB.arridept as ad, RailwayDB.route as r, RailwayDB.Train as t where s.origin = '"+String.valueOf(session.getAttribute("origin"))+"' and s.destination = '"+String.valueOf(session.getAttribute("destination"))+"' and s.transitline = ad.transitline and s.rid = r.rid and s.tid = t.tid and t.totalseats > 0 order by ad.departuretime desc"+";";
		}
		else if(request.getParameter("short").equals("origin"))
		{
		 	sql = "select s.*,r.totalstops, ad.departuretime, ad.arrivaltime, r.traveltime, t.totalseats from RailwayDB.Schedule as s, RailwayDB.arridept as ad, RailwayDB.route as r, RailwayDB.Train as t where s.origin = '"+String.valueOf(session.getAttribute("origin"))+"' and s.destination = '"+String.valueOf(session.getAttribute("destination"))+"' and s.transitline = ad.transitline and s.rid = r.rid and s.tid = t.tid and t.totalseats > 0 order by s.origin"+";";
		}
		else if(request.getParameter("short").equals("originD"))
		{
		 	sql = "select s.*,r.totalstops, ad.departuretime, ad.arrivaltime, r.traveltime, t.totalseats from RailwayDB.Schedule as s, RailwayDB.arridept as ad, RailwayDB.route as r, RailwayDB.Train as t where s.origin = '"+String.valueOf(session.getAttribute("origin"))+"' and s.destination = '"+String.valueOf(session.getAttribute("destination"))+"' and s.transitline = ad.transitline and s.rid = r.rid and s.tid = t.tid and t.totalseats > 0 order by s.origin desc"+";";
		}
		else if(request.getParameter("short").equals("destination"))
		{
		 	sql = "select s.*,r.totalstops, ad.departuretime, ad.arrivaltime, r.traveltime, t.totalseats from RailwayDB.Schedule as s, RailwayDB.arridept as ad, RailwayDB.route as r, RailwayDB.Train as t where s.origin = '"+String.valueOf(session.getAttribute("origin"))+"' and s.destination = '"+String.valueOf(session.getAttribute("destination"))+"' and s.transitline = ad.transitline and s.rid = r.rid and s.tid = t.tid and t.totalseats > 0 order by s.destination"+";";
		}
		else if(request.getParameter("short").equals("destinationD"))
		{
		 	sql = "select s.*,r.totalstops, ad.departuretime, ad.arrivaltime, r.traveltime, t.totalseats from RailwayDB.Schedule as s, RailwayDB.arridept as ad, RailwayDB.route as r, RailwayDB.Train as t where s.origin = '"+String.valueOf(session.getAttribute("origin"))+"' and s.destination = '"+String.valueOf(session.getAttribute("destination"))+"' and s.transitline = ad.transitline and s.rid = r.rid and s.tid = t.tid and t.totalseats > 0 order by s.destination desc"+";";
		}
		else if(request.getParameter("short").equals("stops"))
		{
		 	sql = "select s.*,r.totalstops, ad.departuretime, ad.arrivaltime, r.traveltime, t.totalseats from RailwayDB.Schedule as s, RailwayDB.arridept as ad, RailwayDB.route as r, RailwayDB.Train as t where s.origin = '"+String.valueOf(session.getAttribute("origin"))+"' and s.destination = '"+String.valueOf(session.getAttribute("destination"))+"' and s.transitline = ad.transitline and s.rid = r.rid and s.tid = t.tid and t.totalseats > 0 order by r.totalstops"+";";
		}
		else if(request.getParameter("short").equals("stopsD"))
		{
		 	sql = "select s.*,r.totalstops, ad.departuretime, ad.arrivaltime, r.traveltime, t.totalseats from RailwayDB.Schedule as s, RailwayDB.arridept as ad, RailwayDB.route as r, RailwayDB.Train as t where s.origin = '"+String.valueOf(session.getAttribute("origin"))+"' and s.destination = '"+String.valueOf(session.getAttribute("destination"))+"' and s.transitline = ad.transitline and s.rid = r.rid and s.tid = t.tid and t.totalseats > 0 order by r.totalstops desc"+";";
		}
   		
   		ResultSet rows = stmt.executeQuery(sql);
   	 %>
   	 
<!--*******************Printing Table************************************************************************************************************************* -->
	<table class="table">
   		<tr>
   		
   		   <th> <div  class="table-header"><div align="center">Select</div></div> </th>
   		   <th align="center" >  <div  class="table-header"><div align="center"">Schedules</div></div> </th>
   		   <th>  <div  class="table-header"><div align="center">Stops</div></div> </th>
   		   
   			
   		</tr>
   		<form action = "RoundTrip2.jsp">
   	<%
   		while(rows.next())
   		{
   			%>
   			<tr>
   			  <td>
                  <input required type="radio" name="tid1" value="<%= rows.getString("tid") %>">
   			  </td>
   			  <td>
   				  
   			  <div class="table-contain">
   			  	  
   			  	  <div style="color:#1a1aff; position:absolute; right:300px; font-family: 'Lucida Console'; font-size: 18px;">Tid: <b><%=rows.getString("tid")%></b> </div>	  	 
   			  	  <div style="color:#1a1aff; position:absolute; left:280px;  font-family: 'Lucida Console'; font-size: 18px;"><b><%=rows.getString("transitline")%></b><br><br></div>
   			  	  
   		   	   	  
     	     	  <div style="color:#000099; position:relative; left:-280px; top:30px; font-family: 'Lucida Console'; font-size: 15px;"><b><%=rows.getString("departuretime")%></b></div> 
  	   		      <div style="color:#000099; position:relative; left:380px;  top:12px; font-family: 'Lucida Console'; font-size: 15px;"><b><%=rows.getString("arrivaltime")%></b></div>
			   	  <div style="color:#000099; position:relative; left:80px; top:-3px;   font-family: 'Lucida Console'; font-size: 15px;" align="center"> <b><%=rows.getString("traveltime")%></b></div><br>		
   		 	      
   		 	  	  <div style="color:#4d4d4d;  width:200px; position:relative; left:20px;   top:-20px;  font-family: 'Courier New'; font-size: 14px;"><b><%=rows.getString("origin")%></b> </div>
 	  			  <div style="color:#4d4d4d;  width:200px; position:relative; left:665px; top:-35px; font-family: 'Courier New'; font-size: 14px;"><b><%=rows.getString("destination")%></b></div>
   			      <div style="position:relative; left:75px; top:-50px" >  <hr color="#999999" style="width:400px;">  </div>
   			      
   			      <div style="color:#1a75ff;  width:0px; position:relative; left:223px;   top:-90px;  font-family: 'Courier New'; font-size: 40px;"><b>.</b> </div>
 	  			  <div style="color:#1a75ff;  width:0px; position:relative; left:627px; top:-135px; font-family: 'Courier New'; font-size: 40px;"><b>.</b></div>
   		
   			 	  <div style ="color:Black; position:relative; left:0px;  top:-128px;   font-family: 'Lucida Console';   font-size: 15px;">Total Stops:<b> <%=rows.getString("totalstops")%></b> </div><br>   			     
   			      <div style ="color:Black; position:relative; left:160px;  top:-163px; font-family: 'Lucida Consolel';  font-size: 15px;">Total Seats: <b><%=rows.getString("totalseats")%></b> </div><br>
   			      
   			  </div>
   			 
   			 </td>
   			 
   			 <td>
   			 		<div align="center" class="tableview" ><a href="RoundTrip1.jsp?idd=<%=rows.getString("rid")%>">Stops</a>	</div>			  	
   			 </td>
   			 
   		   </tr>
   		    <%
   		}
   	conn.close();
	%>
	</table>
	
<!--*******************Submitting Table************************************************************************************************************************* --> 
		<br><input type="submit"  class="submit-btn" value="Submit" name="submit1">
	</form>

<!--*******************Stops Popup************************************************************************************************************************* --> 	
    <%
			if(request.getParameter("idd")!=null)
			{	
	%>
				<table  class="table-info">
					<tr>
						<th>Station Name</th>
						<th>Arrival Time</th>
						<th>Departure Time</th>
					 </tr>
			<%
						Class.forName("com.mysql.cj.jdbc.Driver");  
						java.sql.Connection conn1 = DriverManager.getConnection(path, "admin", "Keshav100%");
						Statement stmt1 = conn1.createStatement();
						String sql1 = "select  st.name, sa.sarrivaltime, sa.sdeparturetime from RailwayDB.stopsat as sa, RailwayDB.Schedule as s, RailwayDB.Station as st where sa.rid = s.rid and sa.sid = st.sid and s.rid = "+request.getParameter("idd")+";";
						ResultSet rows1 = stmt1.executeQuery(sql1);
							
						while(rows1.next())
						{
		     %>	
						 <tr>
							<td><%= rows1.getString("name") %></td>
							<td><%= rows1.getString("sarrivaltime") %></td>
							<td><%= rows1.getString("sdeparturetime") %></td>
						 </tr>
						<%
						 	}
						%>
				</table>
				
    <%
    conn1.close();
			}			
	%>
</body>
</html>