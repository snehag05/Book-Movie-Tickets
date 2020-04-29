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
<div class=main>
<FORM ACTION="SelectSeat" METHOD="POST">
<center>
<div class=top>
    <div class="title">
        <h1>Select your seats</h1>
        <p ><%="Hello "+session.getAttribute("User") %></p>
        </div>
        <hr>
        </div>
        
        <div class=left border=1>
        <table cellpadding="20" rowspan="20">
        <tr>
        <img alt="popcorn" src="./css/popcorn.jpg" width =100%>
        </tr>
        <tr><b><span style="text-decoration: blink">$2 popocorn</b></span></tr>
        <br>
        <br>
        <tr>
        <img alt="sliders" src="./css/sliders.jpg" width =100%>
        </tr>
        <tr><b>$5 slider combo</b></tr>
        <br>
        <br>
        <tr>
        <img alt="drinks" src="./css/drinks.jpg" width =100%>
        </tr>
        <tr><b>$1.5 cold drink</b></tr>
        </table>
        <vl>
		</div>
              <section id="seats">
              
              <div class=right>
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
	if(seats.get(index).isBooked()==true)
	{
	%>
	<input id="<%=seats.get(index).getSeat_no() %>" name="selected_seats" class="seat-select" type="checkbox"  background-color=red value="<%=seats.get(index).getSeat_no() %>" disabled = true  checked />
	<%}
	else{
		%>
	<input id="<%=seats.get(index).getSeat_no() %>" name="selected_seats" class="seat-select" type="checkbox" value="<%=seats.get(index).getSeat_no() %>"  />
	<%} %>
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
			<input type="submit" value="Submit">	  	  
			</div>
              </section>
    </div>
</center>
</FORM>
</div>
</body>
</html>