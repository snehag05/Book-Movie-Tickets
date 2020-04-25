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

@WebServlet("/MoviesServlet2")
public class MoviesServlet2 extends HttpServlet {

	//Movie movie = new Movie();

	public void init() {
		
	}
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
		
try {
	System.out.println();
			} catch (Exception e) {

				System.err.println(e.getMessage());
			}
		

	}
	
}
