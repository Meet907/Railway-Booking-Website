<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Revenue by Customers Reservations </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/tab-style.css?<% System.currentTimeMillis(); %>" />
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/dash-tab func.js?<% System.currentTimeMillis(); %>"></script>
</head>
<body>
	<div id='body'>
		<table id = 'table'>
			<thead>
				<tr>
					<th scope='col'>Last Name</th>
					<th scope='col'>First Name</th>
					<th scope='col'>Username</th>
					<th scope='col'>Total Revenue</th>
				</tr>
			</thead>
			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB","admin", "Keshav100%");
				Statement s = con.createStatement();
				ResultSet r = s.executeQuery("select c.firstname, c.lastname,c.username, sum(totalfare) as TotalRevenue from customer c inner join books b on b.username = c.username inner join Reservation r on b.resID = r.resID group by c.username order by c.lastname asc");
				
				for(int i = 1; r.next(); i++){%>
				<tbody>
					<tr>
						<td onclick='colorRow(this)' data-label='Last Name '><%=r.getString("lastname")%></td>
						<td onclick='colorRow(this)' data-label='First Name '><%=r.getString("firstname")%></td>
						<td onclick='colorRow(this)' data-label='Username: '><%=r.getString("username")%></td>
						<td onclick='colorRow(this)' data-label='Total Revenue: '>$<%=String.format("%.2f", Double.parseDouble(r.getString("TotalRevenue")))%></td>
					</tr>
				</tbody>
		<%	}	
				
			%>
		</table>
	</div>
</head>
<body>

</body>
</html>