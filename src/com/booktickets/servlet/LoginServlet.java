package com.booktickets.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.booktickets.pojo.UserDetails;

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
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		HttpSession session = request.getSession();
		System.out.println("Username is :" + user.getUsername());
		System.out.println("Password is :" + user.getPassword());

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movietheater", "root",null);
			Statement stmt = con.createStatement();
			ResultSet rs	= stmt.executeQuery("SELECT * FROM LOGININFO WHERE USERNAME ='"+user.getUsername()+"'AND PASSWORD='"+user.getPassword()+"';");
			System.out.println(rs.toString());
			System.out.println("Login Successful!");
			//response.sendRedirect(".//SelectMovie.html");
			
		} catch (Exception e) {

			System.err.println(e.getMessage());
		}

	}
}
