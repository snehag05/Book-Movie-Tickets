<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.booktickets.pojo.*"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="./css/headers.css">
<title>Confirmation</title>
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
		<form name="ticket" METHOD="POST">
			<center>

				<div>

					<h1 style="text-align: Center;">Ticket Confirmation</h1>

					<table style="background-color: #a21a00; cellpadding: 2px;">
						<tbody>
							<tr>
								<td><p style="text-align: left;">Booking ID:</td>
								</p>
								<td colspan="2"><%=session.getAttribute("transaction_id")%></td>
							</tr>
							<tr>
								<td rowspan="3"><p>
										<img src="<%=session.getAttribute("movie_poster")%>"
											width="300" height="200" />
									</p></td>
							</tr>
							<tr>
								<td colspan="2"></td>
							</tr>
							<tr>

								<td><h2><%=session.getAttribute("movie_name")%></h2> <br>
									<%=session.getAttribute("date")%><br> at: <%=session.getAttribute("slot")%>
								</td>

								<td></td>
							</tr>

							<tr>
								<td><p style="text-align: left;">Screen:</p></td>
								<td colspan="2"><%=session.getAttribute("scrren_no")%></td>
							</tr>
							<tr>
								<td>
									<p style="text-align: left;">Seat Number:</p>
								</td>
								<td colspan="2"><%=session.getAttribute("current_seats")%></td>
							</tr>
							<tr></tr>
							<tr>
								<td style="text-align: left;"><h2>Summary</h2></td>
							</tr>
							<tr>
								<td><p style="text-align: left;">Cost per ticket:</p></td>
								<td colspan="2"><%=session.getAttribute("price")%></td>
							</tr>
							<tr>
								<td><p style="text-align: left;">Number of seats:</p></td>
								<td colspan="2"><%=session.getAttribute("number_of_seats")%></td>
							</tr>
							<tr>
								<td><p style="text-align: left;">Total:</p></td>
								<td colspan="2"><%=(int) session.getAttribute("number_of_seats") * (int) session.getAttribute("price")%></td>
							</tr>
							<!--     <button type="button" class="button" name="Print"><i class="fa fa-print mr-2"></i> Print</button>-->

						</tbody>
					</table>

					<footer>
						<p style="text-align: Center;">
						<h2>Thank you!</h2>
						</p>
					</footer>
				</div>
		</form>
		</center>
	</div>
</body>
</html>