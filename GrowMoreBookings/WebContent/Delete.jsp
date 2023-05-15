<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*"%>
<% String path = "jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB"; %>

	<%=request.getParameter("idd")%>
<!--******************Search For Reservation Via Reservation Number******************************************************************************************************** -->	
	<% 
		Class.forName("com.mysql.cj.jdbc.Driver");
		java.sql.Connection conn = DriverManager.getConnection(path, "admin", "Keshav100%");
		Statement stmt1 = conn.createStatement();
		
		String sql2 = "delete from RailwayDB.for_res where resID = "+request.getParameter("idd")+";";
   		int update2 = stmt1.executeUpdate(sql2);
		
		String sql3 = "delete from RailwayDB.books where resID = "+request.getParameter("idd")+";";
   		int update3 = stmt1.executeUpdate(sql3);
   		
   		String sql1 = "delete from RailwayDB.Reservation where resID = "+request.getParameter("idd")+";";
   		int update1 = stmt1.executeUpdate(sql1);
   		
   		String sql4 = "delete from RailwayDB.Reservation where resID = "+request.getParameter("idd")+";";
   		int update4 = stmt1.executeUpdate(sql1);
   		

   		response.sendRedirect("ViewReservations.jsp");
	%>
	
	
</body>
</html>