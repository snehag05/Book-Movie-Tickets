<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.booktickets.pojo.*"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="./css/headers2.css">
<meta charset="ISO-8859-1">



<title>Thank you!</title>
</head>
<body>
<center>
<div class=top>
    <div class="title">
        <h1>Done!</h1>
        <p ><%="Hello "+session.getAttribute("User") %></p>
        </div>
        <hr>
        </div>
        <br><br>
<table id="table23">
<tr>
<td class=tdleft>User Name:</td>
<td><%=session.getAttribute("User") %></td>
</tr>

<tr>
<td>Movie Name:</td>
<td><%=session.getAttribute("movie_name") %></td>
</tr>

<tr>
<td>Date:</td>
<td><%=session.getAttribute("date") %></td>
</tr>

<tr>
<td>Slot:</td>
<td><%=session.getAttribute("slot") %></td>
</tr>

<tr>
<td>Seat Number:</td>
<td align="right"><%=session.getAttribute("current_seats") %></td>
</tr>

<tr>
<td> Cost per ticket:</td>
<td><%= session.getAttribute("price")%></td>
</tr>

<tr>
<td> Total:</td>
<td><%= (int) session.getAttribute("number_of_seats")* (int) session.getAttribute("price")%></td>
</tr>


</table>


<a href="#" onclick="HTMLtoPDF()">Download PDF</a>

<script src="js/jspdf.js"></script>
<script src="js/jquery-2.1.3.js"></script>
<script src="js/pdfFromHTML.js"></script>
</center>
</body>
</html>