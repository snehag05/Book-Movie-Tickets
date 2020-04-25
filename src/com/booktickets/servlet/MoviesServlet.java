package com.booktickets.servlet;

import java.awt.event.ActionListener;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.booktickets.pojo.UserDetails;

@WebServlet("/MoviesServlet")
public class MoviesServlet extends HttpServlet{
	
	//Movie movie=new Movie();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doCommon(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doCommon(request, response);
	}

	protected void doCommon(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println(request.getParameter("Book2"));
		
		if (request.getParameter("Book1")!=null) {

			try {
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8080/movietheater", "root",null);
				Statement stmt = con.createStatement();
				ResultSet rs	= stmt.executeQuery("SELECT * FROM MOVIE_DETAILS WHERE MOVIE_ID ='001';");
				System.out.println(rs.toString());
				response.sendRedirect(".//Select seat.html");
			
			} catch (Exception e) {

				System.err.println(e.getMessage());
			}
		}
		
		else if (request.getParameter("Book2")!=null) {
			
			try {
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8080/movietheater", "root",null);
				Statement stmt = con.createStatement();
				ResultSet rs	= stmt.executeQuery("SELECT * FROM MOVIE_DETAILS WHERE MOVIE_ID ='002';");
				System.out.println(rs.toString());
				response.sendRedirect(".//Select seat.html");
			
			} catch (Exception e) {

				System.err.println(e.getMessage());
			}
		}

	}
}
