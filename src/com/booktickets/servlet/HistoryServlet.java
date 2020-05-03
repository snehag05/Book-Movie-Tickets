package com.booktickets.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.booktickets.DAO.DBConnection;
import com.booktickets.pojo.History;

@WebServlet("/History")
public class HistoryServlet extends HttpServlet{

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
		
		DBConnection db=new DBConnection();
		HttpSession session =request.getSession();
		
		ArrayList<History> old_bookings=db.history(session);
		session.setAttribute("old_bookings", old_bookings);
		System.out.println(old_bookings);
		response.sendRedirect("./BookingHistory.jsp");
	}

}
