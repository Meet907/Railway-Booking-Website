<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Reservations made by Customers</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/tab-style.css?<% System.currentTimeMillis(); %>" />
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/dash-tab func.js?<% System.currentTimeMillis(); %>"></script>
</head>
<body>
	<div id='body'>
		<table id = 'table'>
		<thead>
			<tr>
				<th scope='col'>Name</th>
				<th scope='col'>Reservation ID</th>
				<th scope='col'>Date</th>
				<th scope='col'>Time</th>
				<th scope='col'>Fare</th>
				<th scope='col'>No. of Adults</th>
				<th scope='col'>No. of Children</th>
				<th scope='col'>No. of Disable</th>
			</tr>
		</thead>
			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB","admin", "Keshav100%");
				Statement s = con.createStatement();
				ResultSet r = s.executeQuery("SELECT c.firstName,c.lastName,r.* FROM Reservation r, books b, customer c WHERE b.resID = r.resID AND	c.username = b.username GROUP BY  c.firstName,c.lastName, r.resID ORDER BY c.firstName,c.lastName,r.resID  asc");
				
				for(int i = 1; r.next(); i++){%>
				<tr>
					<td onclick='colorRow(this)' data-label='Name: '><%=r.getString("firstName") + ' ' + r.getString("lastName")%></td>
					<td onclick='colorRow(this)' data-label='Reservation ID: '><%=r.getString("resID")%></td>
					<td onclick='colorRow(this)' data-label='Date: '><%=r.getString("date")%></td>
					<td onclick='colorRow(this)' data-label='Time: '><%=r.getString("time")%></td>
					<td onclick='colorRow(this)' data-label='Fare: '><%=r.getString("totalfare") %></td>
					<td onclick='colorRow(this)' data-label='No. of Adults: '><%=r.getString("adult") %></td>
					<td onclick='colorRow(this)' data-label='No. of Children: '><%=r.getString("child") %></td>
					<td onclick='colorRow(this)' data-label='No. of Disable: '><%=r.getString("disable") %></td>
		
				</tr>
		<%	}	
				
			%>
		</table>
	</div>

</body>
</html>