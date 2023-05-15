
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sales Reports</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/tab-style.css?<% System.currentTimeMillis(); %>" />
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/dash-tab func.js?<% System.currentTimeMillis(); %>"></script>
</head>
	<div id='body'>
		<table id = 'table'>
			<thead>
				<tr>
					<th scope='col'>Transit Line</th>
					<th scope='col'>Month</th>
					<th scope='col'>Total Revenue</th>
				</tr>
			</thead>
			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB","admin", "Keshav100%");
				Statement s = con.createStatement();
				ResultSet r = s.executeQuery("select MONTH(r.date) Month ,sum(r.totalfare) TotalRevenue, f.transitLine from Reservation r, for_res f where r.resID = f.resID  group by MONTH(r.date) ORDER BY MONTH(r.date), TotalRevenue asc;");
				
				for(int i = 1; r.next(); i++){%>
				<tbody>
					<tr>
						<td onclick='colorRow(this)' data-label='Transit Line '><%=r.getString("transitline")%></td>
						<td onclick='colorRow(this)' data-label='Month '><%=r.getString("Month")%></td>
						<td onclick='colorRow(this)' data-label='Total Revenue: '>$<%=String.format("%.2f", Double.parseDouble(r.getString("TotalRevenue")))%></td>
					</tr>
				</tbody>
		<%	}	
				
			%>
		</table>
	</div>
<script>

</script>
</body>
</html>