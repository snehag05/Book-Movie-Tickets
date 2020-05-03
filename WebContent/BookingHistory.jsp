<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.booktickets.pojo.*"%>
<%@ page import="com.booktickets.DAO.*"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="./css/headers.css">
<title>Booking History</title>
</head>
<body>
	<%
		if (session.getAttribute("User") == null || session.getAttribute("User") == "_INVALID_") {

			response.sendRedirect("./Login.html");
		}
	%>
	<div class=top>
		<div class="title">
			<br>
			<center>
				<img src="./css/Book-Ticket-Banner-1.png" height=103 width=100%>
				</imag>
			</center>
			<div class="table1">
				<table>

					<tr>
						<td>
							<button class="button" type="submit">
								<a style="text-decoration: none; color: white;"
									href="./Movies.jsp">Movies</a>
							</button>
						</td>
						<td><form action="History" method="post">
								<button class="button" type="submit">History</button>
							</form></td>
						<td><form action="Logout" method="post">
								<button class="button" type="submit">logout</button>
							</form></td>
						<td><p>
								<i><%="Hello " + session.getAttribute("User") + " !\t"%></i>
							</p></td>
					</tr>
				</table>
			</div>
		</div>

	</div>
	<hr width=100%>
	<div>
		<form name="tickethistory" METHOD="POST">
			<center>

				<div>
					<br>
					<h2 style="text-align: Center;">Booking History</h2>
					<br>
					<table style="background-color: #a21a00; cellpadding: 2px; " border=1 >
					<tr>
					<th>Transaction ID</th>
					<!-- <th>User</th> -->
					<th>Movie Title</th>
					<th>on Date</th>
					<th>Screen</th>
					<th>Slot</th>
					<th>Seats</th>
					<th>Total</th>
					<th>Booked on</th>
									
					</tr>
					<%
		
					
						ArrayList<History> history = (ArrayList<History>) session.getAttribute("old_bookings");

						if (history == null) {
							out.println("Opps! Something went wrong.<br/>");
						} else {
							out.println("<tr>");

							for (int index = 0; index < history.size(); index++) {
								out.println("<tr>");
					%>

					<td><%=history.get(index).getTransaction_id()%></td>
					<!-- <td><%=history.get(index).getUser_name()%></td> -->
					<td><%=history.get(index).getMovie_title()%></td>
					<td><%=history.get(index).getMovie_date()%></td>
					<td><%=history.get(index).getScreen_no()%></td>
					<td><%=history.get(index).getSlot()%></td>
					<td><%=history.get(index).getSeat_no()%></td>
					<td><%=history.get(index).getTotal()%></td>
					<td><%=history.get(index).getInserted_on()%></td>
					
					<%
						}
						}
					%>

					</tr>
					
					</table>

					<footer>
									</footer>
				</div>
		</form>
		</center>
	</div>
</body>
</html>