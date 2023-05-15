<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Customer Rep. Profile</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/tab-style.css?<% System.currentTimeMillis(); %>" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/JS/dash-tab func.js?<% System.currentTimeMillis(); %>"></script>
</head>
<body>
	<div id='body'>
		<h1>Add Customer Representative</h1>
		<form id = 'form' action='InfoChange' method='POST'>
			<div id = 'acc'>
				<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUxMCA1MTAiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTIiIHhtbDpzcGFjZT0icHJlc2VydmUiIGNsYXNzPSIiPjxnPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgoJPGcgaWQ9ImFjY291bnQtY2lyY2xlIj4KCQk8cGF0aCBkPSJNMjU1LDBDMTE0Ljc1LDAsMCwxMTQuNzUsMCwyNTVzMTE0Ljc1LDI1NSwyNTUsMjU1czI1NS0xMTQuNzUsMjU1LTI1NVMzOTUuMjUsMCwyNTUsMHogTTI1NSw3Ni41ICAgIGM0My4zNSwwLDc2LjUsMzMuMTUsNzYuNSw3Ni41cy0zMy4xNSw3Ni41LTc2LjUsNzYuNWMtNDMuMzUsMC03Ni41LTMzLjE1LTc2LjUtNzYuNVMyMTEuNjUsNzYuNSwyNTUsNzYuNXogTTI1NSw0MzguNiAgICBjLTYzLjc1LDAtMTE5Ljg1LTMzLjE0OS0xNTMtODEuNmMwLTUxLDEwMi03OS4wNSwxNTMtNzkuMDVTNDA4LDMwNiw0MDgsMzU3QzM3NC44NSw0MDUuNDUsMzE4Ljc1LDQzOC42LDI1NSw0MzguNnoiIGZpbGw9IiM4MDgwODAiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIHN0eWxlPSIiIGNsYXNzPSIiPjwvcGF0aD4KCTwvZz4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8L2c+PC9zdmc+" />
			</div>
			<div class = 'info'>
				<label class = 'label' for = 'ssn'>SSN #</label>
				<input class = 'input' type = 'number' name = 'ssn' placeholder='SSN#' maxlength = '10' required/>
			</div>
			<div class = 'info'>
				<label class = 'label' for = 'first'>First Name</label>
				<input class = 'input' type = 'text' name = 'first' placeholder='First Name' required/>
			</div>
			<div class = 'info'>
				<label class = 'label' for = 'last'>Last Name</label>
				<input class = 'input' type = 'text' name = 'last' placeholder='Last Name' required/>
			</div>
			<div class = 'info'>
				<label class = 'label' for = 'username'>Username</label>
				<input class = 'input' type = 'text' name = 'username' placeholder='Username' required/>
			</div>
			<div class = 'info'>
				<label class = 'label' for = 'password'>Password</label>
				<input class = 'input' type = 'password' name = 'password' placeholder='Password' required/>
			</div>
			<button id = 'save' value = 'addinto' name = 'add'>Add</button>
		</form>
	</div>
</body>
</html>