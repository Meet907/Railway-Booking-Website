<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Transit Lines</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/tab-style.css?<% System.currentTimeMillis(); %>" />
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/dash-tab func.js?<% System.currentTimeMillis(); %>"></script>
</head>
<body>
	<div id='body'>
		<table id = 'table'>
			<tr>
				<th>TransitLines</th>
				<th>Seats</th>
			</tr>
			<%				
				Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB","admin", "Keshav100%");
				Statement s = con.createStatement();
				ResultSet r = s.executeQuery("SELECT s.transitLine, MAX(t.totalseats) seats FROM follows s, Train t GROUP BY s.transitLine, t.totalseats ORDER BY s.transitLine, t.totalseats desc LIMIT 5");
				for(int i = 1; r.next(); i++){%>
					<tr>
						<td onclick='colorRow(this)'><%=r.getString("transitLine")%></td>
						<td onclick='colorRow(this)'><%=r.getString("seats")%></td>
					</tr>
			<%	}			
			%>
		</table>
	</div>
	
</body>
</html>