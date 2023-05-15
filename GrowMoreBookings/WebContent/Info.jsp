<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.backend.Emp,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/tab-style.css?<% System.currentTimeMillis(); %>" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/dash-tab func.js?<% System.currentTimeMillis(); %>"></script>
</head>
<body>
	<%
		String type = (String) session.getAttribute("type");
	    Emp e = (Emp) session.getAttribute("employee");
	%>
	<div id='body'>
		<form id = 'form' action='InfoChange' method='POST'>
			<div id = 'acc'>
				<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUxMCA1MTAiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTIiIHhtbDpzcGFjZT0icHJlc2VydmUiIGNsYXNzPSIiPjxnPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgoJPGcgaWQ9ImFjY291bnQtY2lyY2xlIj4KCQk8cGF0aCBkPSJNMjU1LDBDMTE0Ljc1LDAsMCwxMTQuNzUsMCwyNTVzMTE0Ljc1LDI1NSwyNTUsMjU1czI1NS0xMTQuNzUsMjU1LTI1NVMzOTUuMjUsMCwyNTUsMHogTTI1NSw3Ni41ICAgIGM0My4zNSwwLDc2LjUsMzMuMTUsNzYuNSw3Ni41cy0zMy4xNSw3Ni41LTc2LjUsNzYuNWMtNDMuMzUsMC03Ni41LTMzLjE1LTc2LjUtNzYuNVMyMTEuNjUsNzYuNSwyNTUsNzYuNXogTTI1NSw0MzguNiAgICBjLTYzLjc1LDAtMTE5Ljg1LTMzLjE0OS0xNTMtODEuNmMwLTUxLDEwMi03OS4wNSwxNTMtNzkuMDVTNDA4LDMwNiw0MDgsMzU3QzM3NC44NSw0MDUuNDUsMzE4Ljc1LDQzOC42LDI1NSw0MzguNnoiIGZpbGw9IiM4MDgwODAiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIHN0eWxlPSIiIGNsYXNzPSIiPjwvcGF0aD4KCTwvZz4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8L2c+PC9zdmc+" />
				<h1> Info</h1>
				<hr>
			</div>
			<div class = 'info'>
				<label class = 'label' for = 'ssn'>SSN #</label>
				<input class = 'input' type = 'number' name = 'ssn' placeholder='SSN#' 
					value='<%=e.getSsn()%>' required/>
			</div>
			<div class = 'info'>
				<label class = 'label' for = 'first'>First Name</label>
				<input class = 'input' type = 'text' name = 'first' placeholder='First Name' 
					value='<%=e.getFirstName()%>' required/>
			</div>
			<div class = 'info'>
				<label class = 'label' for = 'last'>Last Name</label>
				<input class = 'input' type = 'text' name = 'last' placeholder='Last Name' 
					value='<%=e.getLastName()%>' required/>
			</div>
			<div class = 'info'>
				<label class = 'label' for = 'username'>Username</label>
				<input class = 'input' type = 'text' name = 'username' placeholder='Username' 
					value='<%=e.getUsername()%>' readonly/>
			</div>
			<div class = 'info'>
				<label class = 'label' for = 'password'>Password</label>
				<input class = 'input' type = 'password' name = 'password' placeholder='Password' 
					value='<%=e.getPassword()%>' readonly/>
			</div>
			<button id = 'save' value = 'save' name = 'save'>Save</button>
		</form>
	</div>
</body>
</html>