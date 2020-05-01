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
<%
    if(session.getAttribute("User") == null || session.getAttribute("User") == "_INVALID_")
    {
    	
        response.sendRedirect("./Login.html");
    }
%>
		
			  
        <div class=top>
    <div class="title">
    <br>
  <center>
          <img src="./css/Book-Ticket-Banner-1.png" height=103 width =100%></imag> </center>
        <div class="table1">
        <table>
        
        <tr>
        <td><p><u><%="Hello "+session.getAttribute("User")+"\t" %></u></p>
        </td>
         <td><form action="Logout" method="post">    <button class="button" type="submit">logout</button> </form></td>
         </tr>
        </table>
        </div>
        </div>
        
        </div>
        
<center>
<hr width=100%>
				<section id="seats">
<FORM ACTION="SelectSeat" METHOD="POST">
					<div class=right>
					
						<table style="margin-left: 100px">
						<tr> <img src="./css/screen.png" height=30 width=700 style="float: left;" ></tr>
						<tr/>
						<br><br>
							<%
								ArrayList<ScreenDetails> seats = (ArrayList<ScreenDetails>) session.getAttribute("Seats");

								if (seats == null) {
									out.println("Opps! Something went wrong.<br/>");
								} else {
									for (int index = 0; index < seats.size(); index++) {

										out.println("<tr>");
										//out.println("<td>"+seats.get(index)+"</td>");
										if (seats.get(index).isBooked() == true) {
							%>
							<input id="<%=seats.get(index).getSeat_no()%>"
								name="selected_seats" class="seat-select" type="checkbox"
								background-color=red value="<%=seats.get(index).getSeat_no()%>"
								disabled=true checked />
							<%
								} else {
							%>
							<input id="<%=seats.get(index).getSeat_no()%>"
								name="selected_seats" class="seat-select" type="checkbox"
								value="<%=seats.get(index).getSeat_no()%>" />
							<%
								}
							%>
							<label for="<%=seats.get(index).getSeat_no()%>" class="seat"><%=seats.get(index).getSeat_no()%></label>
							<%
								if (index == 9 || index == 19 || index == 29) {
											out.println("<br/><br/><br/><br/>");

										}
										out.println("</tr>");
									}

								}
							%>

						</table>

					</div>
				</section>
	</div>
	</center>
	<center>
		<button class="button" type="submit">Continue</button>
	</center>
	</FORM>
	</div>
	<div >
	<br><hr>
<center>
<!-- <table >

<tr>
		<td><img alt="popcorn" src="./css/popcorn.jpg" width=150px> </td>
		<td><img alt="sliders" src="./css/sliders.jpg" width=150px></td>
		<td><img alt="drinks" src="./css/drinks.jpg" width=150px></td>
</tr>
<tr>		
		<td><b>$2 popocorn</b></td>						
		<td><b>$5 slider combo</b></td>
		<td><b>$1.5 cold drink</b></td>							
</tr>					
</table>  -->
</center>
</body>
</html>