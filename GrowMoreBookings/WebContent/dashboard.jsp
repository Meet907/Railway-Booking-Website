<%@ page language="java" contentType="text/html;  charset=UTF-8" pageEncoding="UTF-8" import="com.backend.Emp,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
			response.setDateHeader("Expires", 0);
			response.setHeader("Pragma","no-cache");
		
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB","admin", "Keshav100%");
		    
		    request.setAttribute("connection", con); 
			
			//Admin a = (Admin) session.getAttribute("admin");
			Emp a = new Emp("Preyash", "Patel", "prey2510", "Preyash2510", 12353646);
			String name = a.getFirstName() + ' ' + a.getLastName();
			String user = a.getUsername();
	%>
	<title>Admin Dashboard</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/dashboard.css?<% System.currentTimeMillis(); %>" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/dash-tab func.js?<% System.currentTimeMillis(); %>"></script>
	<script type="text/javascript">
	</script>
</head>
<body>
	<div id = 'bars' onclick = 'showMain()'>
			<div id='t-bars'>&#9776;</div>
			<div id='cross'>⤫</div>
	</div>
	<div id = 'body'>
		<nav id = 'nav'>
			<div id = 'admin'>
				<img src="data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMnB0IiB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgd2lkdGg9IjUxMnB0IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Im01MTIgMjU2YzAtMTQxLjQ4ODI4MS0xMTQuNDk2MDk0LTI1Ni0yNTYtMjU2LTE0MS40ODgyODEgMC0yNTYgMTE0LjQ5NjA5NC0yNTYgMjU2IDAgMTQwLjIzNDM3NSAxMTMuNTM5MDYyIDI1NiAyNTYgMjU2IDE0MS44NzUgMCAyNTYtMTE1LjEyMTA5NCAyNTYtMjU2em0tMjU2LTIyNmMxMjQuNjE3MTg4IDAgMjI2IDEwMS4zODI4MTIgMjI2IDIyNiAwIDQ1LjU4NTkzOC0xMy41NTg1OTQgODkuNDAyMzQ0LTM4LjcwMzEyNSAxMjYuNTE1NjI1LTEwMC45Njg3NS0xMDguNjA5Mzc1LTI3My40NDE0MDYtMTA4LjgwNDY4Ny0zNzQuNTkzNzUgMC0yNS4xNDQ1MzEtMzcuMTEzMjgxLTM4LjcwMzEyNS04MC45Mjk2ODctMzguNzAzMTI1LTEyNi41MTU2MjUgMC0xMjQuNjE3MTg4IDEwMS4zODI4MTItMjI2IDIyNi0yMjZ6bS0xNjguNTg1OTM4IDM3Ni41Yzg5Ljc3MzQzOC0xMDAuNjk1MzEyIDI0Ny40MjE4NzYtMTAwLjY3MTg3NSAzMzcuMTY3OTY5IDAtOTAuMDc0MjE5IDEwMC43NzM0MzgtMjQ3LjA1NDY4NyAxMDAuODA0Njg4LTMzNy4xNjc5NjkgMHptMCAwIi8+PHBhdGggZD0ibTI1NiAyNzFjNDkuNjI1IDAgOTAtNDAuMzc1IDkwLTkwdi0zMGMwLTQ5LjYyNS00MC4zNzUtOTAtOTAtOTBzLTkwIDQwLjM3NS05MCA5MHYzMGMwIDQ5LjYyNSA0MC4zNzUgOTAgOTAgOTB6bS02MC0xMjBjMC0zMy4wODU5MzggMjYuOTE0MDYyLTYwIDYwLTYwczYwIDI2LjkxNDA2MiA2MCA2MHYzMGMwIDMzLjA4NTkzOC0yNi45MTQwNjIgNjAtNjAgNjBzLTYwLTI2LjkxNDA2Mi02MC02MHptMCAwIi8+PC9zdmc+" />
				<div id = 'info'>
					<div class = 'acc-info'><strong><%=name%></strong></div>
					<div class = 'acc-info'><%=user%></div>
				</div>
			</div>
			<hr id='separate'>
			<div class = 'menu'>
				<div class='option' onclick = "change('Home.jsp')">Home</div>
				<div class='option' onclick = "change('monthlySalesReport.jsp')">Sales Report</div>
				<div class='dropdown'>
					<div class='main-option'>
						<div class='option'>Reservations<p class='arrow'>&#x25BC;</p></div>
					</div>
					<div class='down' id='reserve'>
						<div class='option' onclick = "change('reservationByTransitLine.jsp')">Transit Line Reservation</div>
						<div class='option' onclick = "change('reservationByCustName.jsp')">Customer Reservation</div>
					</div>
				</div>
				<div class='dropdown'>
					<div class='main-option'>
						<div class='option'>Revenue<p class='arrow'>&#x25BC;</p></div>
					</div>
					<div class='down' id='reserve'>
						<div class='option' onclick = "change('revenueByTransitLine.jsp')">Transit Line Revenue</div>
						<div class='option' onclick = "change('revenueByCustName.jsp')">Customer Revenue</div>
					</div>
				</div>
				<div class='option' onclick = "change('activelines.jsp')">Active Transit Lines</div>
				<div class='option' onclick = "change('customerRep.jsp')">Customer Rep. Info</div>
				<div class='option' onclick = "change('bestCustomer.jsp')">Top 5 Customer</div>
				<div class='option' onclick="location.href = 'logout.jsp'">Sign-out 🡆</div>
			</div>
		</nav>
		<iframe id = 'frame' src = 'Home.jsp' onload="document.title = document.getElementById('frame').contentDocument.title"></iframe>
	</div>
</body>
</html>