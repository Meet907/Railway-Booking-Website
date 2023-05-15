<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<meta name = "viewpoet" content = "width=device-width, initial-scale=1.0">	
<link rel="stylesheet" href="roundtrip.4.css">
</head>
<body>


<style>

	body{
	
		background-image:url('new.jpg');
		background-size: cover;
		}
	
	</style>

<!--******************Check If Seats Available************************************************************************************************************************** -->	
	<%
	    //if(!(Integer.parseInt(""+session.getAttribute("totalseats")) >= (Integer.parseInt(request.getParameter("totalAd")) + Integer.parseInt(request.getParameter("totalCh")) + Integer.parseInt(request.getParameter("totalDi")) + Integer.parseInt(request.getParameter("totalSe")))))
		//{
	    //	response.sendRedirect("OneWay2.jsp");
		//}
	 %>	

<!--****************1 Showing the ticket************************************************************************************************************************** -->	
		
		<div class="form-box"> 
		
		
			<div  style="color:#1a1aff;  position:relative; left:20px; top:12px; font-family: 'Lucida Console'; font-size: 22px;"><b>Travel Date: <%=session.getAttribute("onedate")%></b><br><br></div>		
   			<div  style="color:#1a1aff;  position:relative; left:600px; top:-38px; font-family: 'Lucida Console'; font-size: 22px;"><b><%=session.getAttribute("tid1")%>-<%=session.getAttribute("transitline1")%></b><br><br></div>
   			  	  
   		   	   	  
   		    <div style="color:#000099; position:relative; left:20px; top:-40px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=session.getAttribute("departuretime1")%></b></div> 
  	    	<div style="color:#000099; position:relative; left:750px;  top:-52px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=session.getAttribute("arrivaltime1")%></b></div>
			<div style="color:#000099; position:relative; left:0px; top:-78px;   font-family: 'Lucida Console'; font-size: 18px;" align="center"> <b><%=session.getAttribute("traveltime1")%></b></div><br>		
   		 	     
   			<div style="color:#4d4d4d;  width:120px; position:relative; left:20px;   top:-85px;  font-family: 'Courier New'; font-size: 17px;"><b><%=session.getAttribute("origin1")%></b> </div>
 	    	<div style="color:#4d4d4d;  width:120px; position:relative; left:750px; top:-120px; font-family: 'Courier New'; font-size: 17px;"><b><%=session.getAttribute("destination1")%></b></div>
   			<div style="position:relative; left:-11px; top:-155px" >  <hr color="#999999" style="width:550px;">  </div>
   			      
   			<div style="color:#1a75ff;  width:0px; position:relative; left:150px;   top:-195px;  font-family: 'Courier New'; font-size: 40px;"><b>.</b> </div>
 	    	<div style="color:#1a75ff;  width:0px; position:relative; left:700px; top:-240px; font-family: 'Courier New'; font-size: 40px;"><b>.</b></div>
   		
   	    	<div style ="color:Black; position:relative; left:412px;  top:-240px;   font-family: 'Lucida Console';   font-size: 15px;">Total Stops:<b> <%=session.getAttribute("totalstops1")%></b> </div><br>  
   	    	

	
<!--****************2 Showing the ticket************************************************************************************************************************** -->	
	
	        <div  style="color:#1a1aff;  position:relative; left:20px; top:-240px; font-family: 'Lucida Console'; font-size: 22px;"><b>Travel Date: <%=session.getAttribute("twodate")%></b><br><br></div>		
   			<div  style="color:#1a1aff;  position:relative; left:600px; top:-290px; font-family: 'Lucida Console'; font-size: 22px;"><b><%=session.getAttribute("tid2")%>-<%=session.getAttribute("transitline2")%></b><br><br></div>
   			  	  
   		   	   	  
   		    <div style="color:#000099; position:relative; left:20px; top:-300px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=session.getAttribute("departuretime2")%></b></div> 
  	    	<div style="color:#000099; position:relative; left:750px;  top:-315px; font-family: 'Lucida Console'; font-size: 18px;"><b><%=session.getAttribute("arrivaltime2")%></b></div>
			<div style="color:#000099; position:relative; left:0px; top:-340px;   font-family: 'Lucida Console'; font-size: 18px;" align="center"> <b><%=session.getAttribute("traveltime2")%></b></div><br>		
   		 	     
   			<div style="color:#4d4d4d;  width:120px; position:relative; left:20px;   top:-350px;  font-family: 'Courier New'; font-size: 17px;"><b><%=session.getAttribute("origin2")%></b> </div>
 	    	<div style="color:#4d4d4d;  width:120px; position:relative; left:750px; top:-385px; font-family: 'Courier New'; font-size: 17px;"><b><%=session.getAttribute("destination2")%></b></div>
   			<div style="position:relative; left:-11px; top:-417px" >  <hr color="#999999" style="width:550px;">  </div>
   			      
   			<div style="color:#1a75ff;  width:0px; position:relative; left:150px;   top:-457px;  font-family: 'Courier New'; font-size: 40px;"><b>.</b> </div>
 	    	<div style="color:#1a75ff;  width:0px; position:relative; left:700px; top:-502px; font-family: 'Courier New'; font-size: 40px;"><b>.</b></div>
   		
   	    	<div style ="color:Black; position:relative; left:412px;  top:-505px;   font-family: 'Lucida Console';   font-size: 15px;">Total Stops:<b> <%=session.getAttribute("totalstops2")%></b> </div><br>   			     
   			
   			
   		</div>
	
<!--******************Calculating Fare************************************************************************************************************************** -->
	<%float f = (Float)session.getAttribute("price");%>
	
	<%int totalPassenger = Integer.parseInt(request.getParameter("totalAd")) + Integer.parseInt(request.getParameter("totalCh")) + Integer.parseInt(request.getParameter("totalDi")) + Integer.parseInt(request.getParameter("totalSe"));%>
	
	<%float totalAdultFare    =  f * Integer.parseInt(request.getParameter("totalAd"));%>
	<%float totalChildronFare =  Integer.parseInt(request.getParameter("totalCh")) * (f - ((f * 25)/100));%>
	<%float totalDisabledFare =  Integer.parseInt(request.getParameter("totalDi")) * (f - ((f * 50)/100));%>
	<%float totalSeniorFare   =  Integer.parseInt(request.getParameter("totalSe")) * (f - ((f * 35)/100));%>
	
	<%float totalFare         =  totalAdultFare + totalSeniorFare + totalChildronFare + totalDisabledFare;%>


<!--******************Same Showing the ticket************************************************************************************************************************** -->

<div class="discount-price"> <h1>Discounted Price for Children, Disable, Senior.</h1> </div>
	
	<table class="table">
	  
		<tr>
			<th></th>
			<th>Adults</th>
			<th>Children</th>
			<th>Disable</th>
			<th>Senior</th>
			<th>Total</th>	
		</tr>
		
		<tr>
			<td>Tickets</td>
			<td><%=request.getParameter("totalAd")%></td>
			<td><%=request.getParameter("totalCh")%></td>
			<td><%=request.getParameter("totalDi")%></td>
			<td><%=request.getParameter("totalSe")%></td>
			<td><%=totalPassenger%></td>	
		</tr>
		
		<tr>
			<td>Fare</td>
			<td><%=totalAdultFare%></td>
			<td><%=totalChildronFare%></td>
			<td><%=totalDisabledFare%></td>
			<td><%=totalSeniorFare%></td>
			<td>$ <%=totalFare%></td>	
		</tr>
		
		<tr>
			<td>Grand</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>$ <%=totalFare%></td>
		</tr>
	
	
	
	</table>



<!--******************Set All New Data in Session************************************************************************************************************************** -->
	<%session.setAttribute("totalAdultFare",(totalAdultFare/2));%>
	<%session.setAttribute("totalChildronFare",(totalChildronFare/2));%>
	<%session.setAttribute("totalDisabledFare",(totalDisabledFare/2));%>
	<%session.setAttribute("totalSeniorFare",(totalSeniorFare/2));%>
	
	<%session.setAttribute("totalFare",totalFare/2);%>
	<%session.setAttribute("totalPassenger",totalPassenger);%>
	
	<%session.setAttribute("totalAd",request.getParameter("totalAd"));%>
	<%session.setAttribute("totalCh",request.getParameter("totalCh"));%>
	<%session.setAttribute("totalDi",request.getParameter("totalDi"));%>
	<%session.setAttribute("totalSe",request.getParameter("totalSe"));%>
	
<!--******************Conforming the ticket************************************************************************************************************************** -->
	<form action = "RoundTrip5.jsp">
		<input type="submit" class="submit-btn" name = "confirm" value = "Confirm">
	</form>
  
</body>
</html>