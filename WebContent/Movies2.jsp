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

			response.sendRedirect("./Login.html");
		}
	%>
	<center>
		<div class="top">
			<div class="title">
				<br> <img src="./css/Book-Ticket-Banner-1.png" height=100
					width=100%></img>
	</center>
	<br>
	<div class="table1">
		<table>

			<tr>
				<td><p><u><%="Hello "+session.getAttribute("User")+"\t" %></u></p>
				<td><form action="Logout" method="post">
						<button class="button" type="submit">logout</button>
					</form></td>
					<td><form action="History" method="post">
						<button class="button" type="submit">History</button>
					</form></td>
			</tr>
		</table>

	</div>
</div>
</div>

	<form action=MoviesServlet METHOD="POST">
		<div class="gallery">
<center>

		<table cellpadding="10" border=1 width=60% cellspacing=7>
		
		
	<hr width=100%>
	
				<%
					ArrayList<MovieDetails> movies = (ArrayList<MovieDetails>) session.getAttribute("Movies");

					if (movies == null) {
						out.println("Opps! Something went wrong.<br/>");
					} else {
						out.println("<tr>");
						
							
						for (int index = 0; index < movies.size(); index++) {
							out.println("<tr>");
				
				%>

				 <td rowspan="3" ><img src="<%=movies.get(index).getImage()%>" width="300" height="180"  /></td>
				<td><iframe width="200" height="100"
						src="<%=movies.get(index).getTrailer()%>"
						frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe></td></tr>	
				<%
				out.println("<tr><td>" + movies.get(index).getMovieTitle() + " $" + movies.get(index).getPrice() + "</td></tr>");
					
				%>
	<tr><td><button class="button" type="submit" name="book"
						value="<%=movies.get(index).getMovie_id()%>">Book ticket</button></td>
						</tr><tr height=30 ></tr> 
				

				<%
					}
					}
				%>
				
		</tr>	
		</table>
		</center>
	</div>
		
	</form>
</center>
</BODY>

</HTML>