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

import com.booktickets.DAO.DBConnection;
import com.booktickets.pojo.UserDetails;

@WebServlet("/MoviesServlet2")
public class MoviesServlet2 extends HttpServlet{
	
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
		int movie_id = Integer.parseInt(request.getParameter("book"));
		System.out.println(request.getParameter("book"));
		session.setAttribute("movie_id",movie_id);
		DBConnection db= new DBConnection();
		System.out.println(db.loadScreens(session));
		db.getMovieName( session);
		System.out.println(session.getAttribute("movie_name"));
		//session.setAttribute("movie_name",movie_name);
		//session.setAttribute("seats",db.loadScreens(session));
		response.sendRedirect("./SelectSeat.jsp");
		
				}

	}

