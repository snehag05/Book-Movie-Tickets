<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.booktickets.pojo.*"%>
<HTML>
<HEAD>
<TITLE>JSP Expressions</TITLE>
<META NAME="keywords"
	CONTENT="JSP,expressions,JavaServer Pages,servlets">
<META NAME="description" CONTENT="A quick example of JSP expressions.">
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="./css/headers.css">
<LINK REL=STYLESHEET HREF="JSP-Styles.css" TYPE="text/css">
</HEAD>
<BODY>
<center>
	  <div class="title">
        <h1>This week on screen</h1>
    </div>
    <hr>
	<table cellpadding="10">
	<div class="gallery">
<%
ArrayList<MovieDetails> movies = (ArrayList<MovieDetails>)session.getAttribute("Movies");
if(movies == null){
    out.println("Please enter a hobby before clicking add! Dummy.<br/>");
}   
else{
	out.println( "<tr><td>Movie Name</td><td>Price</td><tr>");
    for(int index = 0; index < movies.size(); index ++){
    	
    	out.println( "<tr>");
            out.println("<td>"+movies.get(index).getMovieTitle()+"</td>");
            out.println("<td>$"+movies.get(index).getPrice()+"</td>");
            //out.println("<td><button class='button' type='submit' name='Trailer' height='50'><a href="+movies.get(index).getTrailer()+"</input></td>");
            out.println("<td> <button value = trailer> <a href="+movies.get(index).getTrailer()+"></button></td>");
            out.println( "</tr>");
    }   
}      
      %>
      </div>
</table>
</center>	
</BODY>
</HTML>