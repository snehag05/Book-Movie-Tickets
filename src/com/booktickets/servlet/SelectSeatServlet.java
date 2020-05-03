package com.booktickets.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.booktickets.DAO.DBConnection;
import com.booktickets.pojo.ScreenDetails;

@WebServlet ("/SelectSeat")
public class SelectSeatServlet extends HttpServlet{
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
		//System.out.println("Servlet Called");
		HttpSession session = request.getSession();
		String [] seats = request.getParameterValues("selected_seats");
		
		if(seats==null) {
			
			response.sendRedirect("./SelectSeat.jsp");	
		}
		else
		{
		
		session.setAttribute("current_seats", new ScreenDetails().seatArraytoString(seats));
		session.setAttribute("number_of_seats", seats.length);
		DBConnection db=new DBConnection();
		db.transaction(session, seats);
		response.sendRedirect("./Confirmation.jsp");
		
		
		}
	}
	
}
