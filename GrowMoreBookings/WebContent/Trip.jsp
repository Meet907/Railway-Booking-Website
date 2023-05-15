<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action = "Home.jsp">
	
	Trip: <select name = "Trip">
		 
				<option disabled selected value => RoundTrip </option> 
				<option value = "OneWay" > One-Way  </option>
				
			
			</select>
			
			<input type = "Submit" value = "Go" > 
			
			</form>
			<br>
			
	<b>Origin:</b>
 		<%=request.getParameter("origin") %>
 		
 		<br>
 		<br>
 		
 		<b>Destination:</b>
 		<%=request.getParameter("destination") %>
 		
 		
 		<br>
 		<br>
 		<b>Date (One Way):</b>
 		<%=request.getParameter("oneWay") %>
 		
 		<br>
 		<br>
 		
 		<b>Date (Round Trip):</b>
 		<%=request.getParameter("roundtrip") %>
	
	
	
	
	</body>
</html>