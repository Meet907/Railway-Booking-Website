<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma","no-cache");
    	String msg;
    	if(session.getAttribute("user") == null){
    		msg = "<h1>403: You are logged out!!</h1><br>" + 
    	"<button class = 'btn' onclick=\"window.location.href='logout.jsp';\">Please Login</button>";
    	}
    	else{
    		msg = "<h1>Welcome " + session.getAttribute("user") + "</h1><br>" + 
    				"<button class = 'btn' onclick=\"window.location.href='logout.jsp';\">Log out</button>";
    	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Success</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/success.css?<% System.currentTimeMillis(); %>" />
</head>
<body>
	<div id = 'success'>
		<%=msg%>
	</div>
</body>
</html>