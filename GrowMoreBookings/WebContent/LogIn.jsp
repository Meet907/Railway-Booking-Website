<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<meta name = "viewpoet" content = "width=device-width, initial-scale=1.0">	
	<link rel="stylesheet" href="login1.css">
	
</head>

<body>
<!-- ********************Form box***************** -->

<img class = "img-train" src="login.jpg" alt="train" >


<div class="wrapper">

	<text type="text" class="growmorebooking"> Grow More Bookings </text>
	<text type="text" class="time">Since 1992</text>
	
</div>


<div class="wrapper">
	
	<div class="form-box">
	
		<div class="button-box">
			<div id="btn"></div>
			<button type="button" class="toggle-btn" onclick="login()"> Log In</button>
			<button type="button" class="toggle-btn" onclick="register()">  Register</button>
		</div>

<!--******************Password Check************************************************************************************************************************************************************************************************ -->	
	<%if(session.getAttribute("flag")!=null)
		{
			%><script>alert("incorrect Id/Padssword.");</script><%
			session.setAttribute("flag",null);
		}
		if(session.getAttribute("signup")!=null)
		{
			%><script>alert("you have signed-up successfully. Try to login now.");</script><%
			session.setAttribute("signup",null);
		}
	%>
	
<!--******************User ID, Password************************************************************************************************************************************************************************************************ -->
		
	
	
	<form action = "LoginCheck.jsp" id = "login" class="input-group" >
		User ID: <br> <input type="text"  class="input-field" name="id" placeholder="Enter your UserName"> <br> 
			
        Password: <br> <input type="password"  class="input-field"  name="pass" placeholder="Enter your Password"> 
        <br> 
        <br>
        <br>
        
        <input type="submit"  class="submit-btn" value="Log In" name="login">
			

	</form>
	
	
<!--******************Register (Sign up)************************************************************************************************************************************************************************************************ -->
	
	
	
	
	<form name="myForm"  id="register" class="input-group">
	
		<input  required type="text" class= "input-field" name="userName"
		placeholder="UserName" > 

		<br><input required type="password"  class= "input-field"  name="pass"
		placeholder="Password(Least 8 Char)">
		
        <br><input required type="text" class= "input-field" name="firstName"
		placeholder="First Name"> 
			
	    <br><input required type="text" class= "input-field"  name="lastName"
	    placeholder="Last Name">
	
		<br><input required type="email"class= "input-field" name="email"
	    placeholder="Email">
                
        <br><input type="submit" class="submit-btn" name = "signup" 
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
	
	</div>
		
</div>

<script>

	var x= document.getElementById("login");
	var y= document.getElementById("register");
	var z= document.getElementById("btn");
	
	function register(){
		x.style.left = "-400px";
		y.style.left = "50px";
		z.style.left=  "110px";
	}
	
	function login(){
		x.style.left = "50px";
		y.style.left = "450px";
		z.style.left=  "0px";
	}


</script>	
	
	
</body>
</html>