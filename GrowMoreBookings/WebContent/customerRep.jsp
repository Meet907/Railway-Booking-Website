<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.backend.Emp,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Rep. List</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/tab-style.css?<% System.currentTimeMillis(); %>" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/dash-tab func.js?<% System.currentTimeMillis(); %>"></script>
</head>
<body>
	<form id='body' action='InfoChange' method='POST'>
		<div id='funct'>
			<div class='info'>
				<label class='label'>Search:</label>
				<input class='input' id='search' placeholder='Search Name' onkeyup='Search(2)'/>
			</div>
			<button class='action-btn' id='add' name='add' value='add'>Add 🞦</button>
		</div>
		<table id = 'table'>
			<thead>
				<tr>
					<th scope='col'>SSN #</th>
					<th scope='col'>Name</th>
					<th scope='col'>Username</th>
					<th scope='col'>Password</th>
					<th scope='col'>Action</th>
				</tr>
			</thead>
			<%
				Class.forName("com.mysql.jdbc.Driver");
				    Connection con = DriverManager.getConnection("jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB","admin", "Keshav100%");
				    
				    Statement cS = con.createStatement();
				    ResultSet cR = cS.executeQuery("SELECT COUNT(*) count FROM employee e, customerRep c WHERE e.username = c.custRep_user");
				    cR.next();
				    int size = Integer.parseInt(cR.getString("count"));
				    
					Statement s = con.createStatement();
					ResultSet r = s.executeQuery("SELECT e.* FROM employee e, customerRep c WHERE e.username = c.custRep_user");
					
					Emp[] e = new Emp[size];
					
					for(int i = 0; r.next(); i++){
						Emp c = new Emp(
								r.getString("firstname"), 
								r.getString("lastname"), 
								r.getString("username"), 
								r.getString("password"), 
								Integer.parseInt(r.getString("ssn"))
								);
			%>
				<tbody>
					<tr>
						<td onclick='colorRow(this)' data-label='SSN #: '><%=c.getSsn()%></td>
						<td onclick='colorRow(this)' data-label='Name: '><%=c.getFullname()%></td>
						<td onclick='colorRow(this)' data-label='Username: '><%=c.getUsername()%></td>
						<td onclick='colorRow(this)' class='pass' data-label='Password: '><%=c.getPassword()%></td>
						<td onclick='colorRow(this)' id='action-div' data-label='Action: '>
							<div class='action'>
								<button class='action-btn' id='edit' value = 'Edit <%=i%>' name='action'>Edit</button>
								<button class='action-btn' id='delete' value = 'Delete <%=i%>' name='action'>Delete</button>
							</div>
						</td>
					</tr>
				</tbody>
			<%	
					e[i] = c;
				}
				
				session.setAttribute("employee-info", e);
				
			%>
		</table>
	</form>

</body>
</html>