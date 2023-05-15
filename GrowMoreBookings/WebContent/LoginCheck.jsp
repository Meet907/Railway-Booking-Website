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
	<%@ page import="javax.servlet.http.HttpSession"%> 
	<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
	   response.setHeader("Pragma","no-cache");
	   response.setHeader("Expires","0");
	 %>

	<% 
	String path = "jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB";
	if(request.getParameter("login")!= null)
		{
			String id = request.getParameter("id");
		    String pass = request.getParameter("pass");
		    
		    //Statement stmt = Connection.getStatement();
		   try
        	{
           		Class.forName("com.mysql.cj.jdbc.Driver");
            	java.sql.Connection conn = DriverManager.getConnection(path, "admin", "Keshav100%");
            	Statement stmt = conn.createStatement();
            	
            	String sql = "select * from RailwayDB.customer where username = '" + id + "' and password = '" + pass + "'";
    		    String sql1 = "select * from RailwayDB.admin where username = '" + id + "' and password = '" + pass + "'";
            	String sql2 = "select * from RailwayDB.customerRep where custRep_user = '"+id+"' and custRep_pass = '"+pass+"'";
    		    session.setAttribute("flag",null);
            	
    		    ResultSet rows = stmt.executeQuery(sql);
    		    
    		    Statement stmt1 = conn.createStatement();
    		    ResultSet rows1 = stmt1.executeQuery(sql1);
    		    
    		    Statement stmt2= conn.createStatement();
    		    ResultSet rows2 = stmt2.executeQuery(sql2);
    		    
    		    if(rows.next())
    		    {
    		        session.setAttribute("Id", id);
    		    	
    		    	response.sendRedirect("Home1.jsp");
    		    }
    		    else if(rows1.next())
    		    {
    		    	response.sendRedirect("dashboard.jsp");
    		    }
    		    else if(rows2.next())
    		    {
    		    	response.sendRedirect("cp.jsp");
    		    }
    		    else
    		    {
    		    	session.setAttribute("flag","true");
    		    	response.sendRedirect("LogIn.jsp");	
    		    }
    		    conn.close();
        	}
		    catch (Exception ex)
            {
				System.out.println("Error: " + ex.getMessage());
			}
		} 
	 %>
</body>
</html>