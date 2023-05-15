<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Reservations By Transit Lines</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/tab-style.css?<% System.currentTimeMillis(); %>" />
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/dash-tab func.js?<% System.currentTimeMillis(); %>"></script>
</head>
<body>
	<div id='body'>
		<table id = 'table'>
			<thead>
				<tr>
					<th scope='col'>Reservation ID</th>
					<th scope='col'>Transit Lines</th>
					<th scope='col'>Train #</th>
					<th scope='col'> Date </th>
					<th scope='col'>Time</th>
				</tr>
			</thead>
			<%				
				Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB","admin", "Keshav100%");
				Statement s = con.createStatement();
				ResultSet r = s.executeQuery("SELECT  f.transitLine,f.tid,r.date,r.time,r.resID FROM  Reservation r, for_res f WHERE f.resID = r.resID GROUP BY f.transitLine,r.date,r.time,r.resID,f.tid ORDER BY f.transitLine,r.date,r.time,r.resID,f.tid asc");
				for(int i = 1; r.next(); i++){%>
					<tbody>
						<tr>
							<td onclick='colorRow(this)' data-label='Reservation Id: '><%=r.getString("resID")%></td>
							<td onclick='colorRow(this)' data-label='Transit Lines: '><%=r.getString("transitLine")%></td>
							<td onclick='colorRow(this)' data-label='Train #: '><%=r.getString("tid")%></td>
							<td onclick='colorRow(this)' data-label='Date: '><%=r.getString("date")%></td>
							<td onclick='colorRow(this)' data-label='Time: '><%=r.getString("time")%></td>
						</tr>
					</tbody>
			<%}%>
		</table>
	</div>

</body>
</html>