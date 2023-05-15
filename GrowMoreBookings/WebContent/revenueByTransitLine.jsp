<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Revenue by Transit Line</title>
<title>List of Reservations made by Customers</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/tab-style.css?<% System.currentTimeMillis(); %>" />
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/dash-tab func.js?<% System.currentTimeMillis(); %>"></script>
</head>
<body>
	<div id='body'>
		<table id = 'table'>
			<thead>
				<tr>
					<th>Transit Line</th>
					<th>Train #</th>
					<th>Total Revenue</th>
				</tr>
			</thead>
			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB","admin", "Keshav100%");
				Statement s = con.createStatement();
				ResultSet r = s.executeQuery("SELECT  s.transitline,f.tid,sum(r.totalfare) TotalRevenue FROM  for_res f,Reservation r, books b, Schedule s WHERE  s.transitline = f.transitLine AND f.resID = r.resID AND b.resID = r.resID GROUP BY  s.transitline, f.tid ORDER BY s.transitline, f.tid asc;");
				
				for(int i = 1; r.next(); i++){%>
				<tbody>
					<tr>
						<td onclick='colorRow(this)' data-label='Transit Line: '><%=r.getString("transitline")%></td>
						<td onclick='colorRow(this)' data-label='Train #: '><%=r.getString("tid")%></td>
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