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
		
		HttpSession session=request.getSession();
		System.out.println(session.getAttribute("movie_id"));
		response.sendRedirect(".//Select seat.html");
				}

	}

