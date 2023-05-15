<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form name="myForm">
	
		<input  required type="text" name="userName"
		placeholder="UserName" > 

		<br><input required type="password" name="pass"
		placeholder="Password(Least 8 Char)">
		
        <br><input required type="text" name="firstName"
		placeholder="First Name"> 
			
	    <br><input required type="text" name="lastName"
	    placeholder="Last Name">
	
		<br><input required type="email" name="email"
	    placeholder="Email">
                
        <br><input type="submit" name = "signup" 
        value="SignUp">
	
	</form>
	
	<%@ page import="java.sql.*"%>
	
	<% 
	if(request.getParameter("signup")!= null)
		{
			try
			{
				String id = request.getParameter("userName");
			    String pass = request.getParameter("pass");
			    String firstName = request.getParameter("firstName");
			    String lastName = request.getParameter("lastName");
			    String email = request.getParameter("email");
			    
			    //Statement stmt = Connection.getStatement();
			    Class.forName("com.mysql.cj.jdbc.Driver");
		        java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB", "admin", "Keshav100%");
		        Statement stmt = conn.createStatement();
		        
		        String sql2 = "select username from RailwayDB.customer where username = '"+id+"';";
			  
		        ResultSet rows1 = stmt.executeQuery(sql2);
		        
		        if(rows1.next())
		        {
		        	%><script>alert("Username is already taken.");</script><%
		        }
		        else
		        {
		            String sql = "Insert Into RailwayDB.customer (username, password, firstname, lastname, email) values ('" +  id + "','" + pass + "','" +  firstName + "','"+ lastName+"','"+email+"');";
					int rows = stmt.executeUpdate(sql);
				    
				    if(request.getParameter("signup")!=null)
				    {
				    	session.setAttribute("signup", "signup");
				    	response.sendRedirect("LogIn.jsp");
				    }
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