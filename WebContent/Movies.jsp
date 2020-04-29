<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.booktickets.pojo.*"%>
 
        <HTML>

        <HEAD>
            <TITLE>Now showing</TITLE>
            <META NAME="keywords" CONTENT="JSP,expressions,JavaServer Pages,servlets">
            <META NAME="description" CONTENT="A quick example of JSP expressions.">
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" type="text/css" href="./css/headers.css">
            <LINK REL=STYLESHEET HREF="JSP-Styles.css" TYPE="text/css">
        </HEAD>
		
        <BODY>
           <center>
        <div class=top>
    <div class="title">
          <h1>This week on screen</h1>
        <p ><%="Hello "+session.getAttribute("User") %></p>
        </div>
        <hr>
        </div>
            <form action=MoviesServlet METHOD="POST">
             
                                      
                    <table cellpadding="10">
                        <div class="gallery">
<%
ArrayList<MovieDetails> movies = (ArrayList<MovieDetails>)session.getAttribute("Movies");

if(movies == null){
    out.println("Opps! Something went wrong.<br/>");
}   
else{
	out.println( "<tr><th>Movie Name</th><th><b></b></th><th><b>Price</b></th><th>Trailer</th><th></th><tr>");
    for(int index = 0; index < movies.size(); index ++){
    	out.println( "<tr>");
        out.println("<td>"+movies.get(index).getMovieTitle()+"</td>");
%>
<td><img src="<%=movies.get(index).getImage()%>" width="250" /></td>
    	
  <%  	
    
            out.println("<td>$"+movies.get(index).getPrice()+"</td>"); 
%>
  
  <td><iframe width="200" height="100"  src="<%=movies.get(index).getTrailer() %>
           " frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
  <td><button class="button" type="submit" name ="book" value="<%=movies.get(index).getMovie_id()%>">Book ticket</button></td>          
  
<%
    }
}
      
%>
      
                        </div>
                    </table>
                </center>
            </form>
        </BODY>

        </HTML>