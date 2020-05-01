<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.booktickets.pojo.*"%>

<HTML>

<HEAD>
<TITLE>Now showing</TITLE>
<META NAME="keywords"
	CONTENT="JSP,expressions,JavaServer Pages,servlets">
<META NAME="description" CONTENT="A quick example of JSP expressions.">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="./css/headers.css">
<LINK REL=STYLESHEET HREF="JSP-Styles.css" TYPE="text/css">
</HEAD>

<BODY>

	<%
		if (session.getAttribute("User") == null || session.getAttribute("User") == "_INVALID_") {

			response.sendRedirect("/Login.html");
		}
	%>
	<center>
		<div class="top">
			<div class="title">
				<br> <img src="./css/BookTickets-Logo_S.png" height=100
					width=300></img>
	</center>
	<div class="table1">
		<table>

			<tr>
				<td><p><u><%="Hello "+session.getAttribute("User")+"\t" %></u></p>
				<td><form action="Logout" method="post">
						<button class="button" type="submit">logout</button>
					</form></td>
			</tr>
		</table>

	</div>
</div>
</div>

	<form action=MoviesServlet2 METHOD="POST">


		<table cellpadding="10">
			<div class="gallery">
	<hr width=100%>
	
				<%
					ArrayList<MovieDetails> movies = (ArrayList<MovieDetails>) session.getAttribute("Movies");

					if (movies == null) {
						out.println("Opps! Something went wrong.<br/>");
					} else {

						//out.println(
							//	"<tr></tr><tr><th>Movie Name</th><th><b></b></th><th><b>Price</b></th><th>Trailer</th><th></th><tr>");
						for (int index = 0; index < movies.size(); index++) {
							out.println("<tr>");
				
				%>

				<td rowspan="2"><img src="<%=movies.get(index).getImage()%>" width="250" /></td>

				<%
				out.println("<tr><td>" + movies.get(index).getMovieTitle() + " $" + movies.get(index).getPrice() + "</td>");
					
				%>
	<td><button class="button" type="submit" name="book"
						value="<%=movies.get(index).getMovie_id()%>">Book ticket</button></td>
				<td><iframe width="300" height="100"
						src="<%=movies.get(index).getTrailer()%>"
						frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe></td>
				

				<%
					}
					}
				%>
			
		</table>
		</center>
		</div>
	</form>

</BODY>

</HTML>