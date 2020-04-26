<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.booktickets.pojo.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="./css/headers.css">
    <title>Select your seats</title>
</head>
<body>
<FORM ACTION="SelectSeat" METHOD="POST">
<center>
    <div class="title">
        <h1>Select your seats</h1>
        <p><%="Hello "+session.getAttribute("User") %></p>
              <section id="seats">
              <hr>
              <table style=margin-left:100px>
              
              <%
ArrayList<ScreenDetails> seats = (ArrayList<ScreenDetails>)session.getAttribute("Seats");

if(seats == null){
    out.println("Opps! Something went wrong.<br/>");
}   
else{
    for(int index = 0; index < seats.size(); index ++){
    out.println("<tr>");	
	//out.println("<td>"+seats.get(index)+"</td>");
	%>
	
	<input id="<%=seats.get(index).getSeat_no() %>" name="selected_seats" class="seat-select" type="checkbox" value="<%=seats.get(index).getSeat_no() %>" name="seat[]"  />
	<label for="<%=seats.get(index).getSeat_no() %>" class="seat"><%=seats.get(index).getSeat_no() %></label>
	
	<%
	if(index==9 || index ==19 || index==29  )
	{
		out.println("<br/><br/><br/><br/>");
	
	
	}
	out.println("</tr>");
	   }
	
	
    }

      
%>
              
			</table>	  	  
              </section>
    </div>
</center>
</FORM>
</body>
</html>