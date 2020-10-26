package com.booktickets.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import com.booktickets.DAO.DBConnection;
import com.booktickets.pojo.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	UserDetails user=new UserDetails();
	
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
		DBConnection db =new DBConnection(); 	
		System.out.println(db);
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		HttpSession session = request.getSession();
		session.setAttribute("User", user);
		//System.out.println("Username is :" + user.getUsername());
		//System.out.println("Password is :" + user.getPassword());
		if(db.login(user.getUsername(), user.getPassword(),session)==true)
		{
		ArrayList<MovieDetails> movies = db.loadMovies(session); 
		session.setAttribute("Movies", movies);
		//System.out.println(session.getAttribute("user_id"));
		//System.out.println(session.getAttribute("Movies"));
		response.sendRedirect("./Movies.jsp");
		
		}
		else
		{
			System.out.println("try again!");
		}
		
	}
}
