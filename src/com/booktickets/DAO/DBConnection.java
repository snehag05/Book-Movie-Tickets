package com.booktickets.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import com.booktickets.pojo.*;

public class DBConnection {
	static Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	static ResultSet rs;

	public DBConnection() {
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movietheater", "root", null);
			System.out.println("Database connection established");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean login(String username, String password, HttpSession session) {
		// Statement stmt;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(
					"SELECT * FROM USER WHERE USERNAME ='" + username + "'AND PASSWORD='" + password + "';");
			if (rs.next() != false) {
				//System.out.println("login successful!");
				session.setAttribute("user_id", rs.getInt("USER_ID"));

				return true;
			} else {
				//System.out.println("Incorrect username or passsword");
				return false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public void signUp(String username, String password, String email, Long phone) {

		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT MAX(USER_ID) FROM USER;");
			System.out.println("SELECT MAX(USER_ID) FROM USER;");
			int user_id = 0;
			if (rs.next() != false) {
				user_id = rs.getInt("MAX(USER_ID)");
			} else {
				//System.out.println("Oops! something went wrong.");

			}

			String query = "INSERT INTO USER(USER_ID, USERNAME, PASSWORD, EMAIL, PHONE, INSERTED_ON) VALUES ('"
					+ (user_id + 1) + "','" + username + "','" + password + "','" + email + "','" + phone
					+ "',SYSDATE());";
			// System.out.println(query);
			PreparedStatement preparedStmt = con.prepareStatement(query);
			preparedStmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<MovieDetails> loadMovies(HttpSession session) {

		ArrayList<MovieDetails> arraylist = new ArrayList<MovieDetails>();

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT * FROM MOVIE_DETAILS ORDER BY 1 DESC;");
			while (rs.next()) {
				
				String movie_date = rs.getString("DATE");
				DateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
				Date date = (Date) parser.parse(movie_date);
				DateFormat formatter = new SimpleDateFormat("MMM-dd-yyyy");
				movie_date = formatter.format(date);
				// System.out.println(movie_date);
				session.setAttribute("slot", rs.getString("SLOT"));
				session.setAttribute("price", rs.getInt("PRICE"));
				session.setAttribute("date", movie_date);
				arraylist.add(new MovieDetails(rs.getInt("MOVIE_ID"), rs.getString("MOVIETITLE"), movie_date,
						rs.getInt("SCREEN_NO"), rs.getString("SLOT"), rs.getInt("PRICE"), rs.getString("TRAILER"),
						rs.getString("IMAGE")));
			}

			session.setAttribute("Movies", arraylist);

		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return arraylist;

	}

	public ArrayList<ScreenDetails> loadScreens(HttpSession session) {

		ArrayList<ScreenDetails> arraylist = new ArrayList<ScreenDetails>();

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT * FROM SCREEN_DETAILS WHERE SCREEN_NO IN "
					+ "(SELECT SCREEN_NO FROM MOVIE_DETAILS WHERE MOVIE_ID =" + session.getAttribute("movie_id")
					+ ");");
			System.out.println("SELECT * FROM SCREEN_DETAILS WHERE SCREEN_NO IN "
					+ "(SELECT SCREEN_NO FROM MOVIE_DETAILS WHERE MOVIE_ID =" + session.getAttribute("movie_id")
					+ ");");
			while (rs.next()) {
				arraylist.add(new ScreenDetails(rs.getInt("screen_no"), rs.getInt("seat_no"), rs.getBoolean("booked")));
				session.setAttribute("scrren_no", rs.getInt("screen_no"));
			}

			session.setAttribute("Seats", arraylist);

		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return arraylist;

	}

	public synchronized void transaction(HttpSession session, String[] seats) {

		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT MAX(TRANSACTION_ID) FROM booking_details;");
			//System.out.println("SELECT MAX(TRANSACTION_ID) FROM booking_details;");
			int transaction_id = 0;
			if (rs.next()) {
				transaction_id = rs.getInt("MAX(TRANSACTION_ID)");
				transaction_id = transaction_id + 1;
			}
			int i ;
			for ( i = 0; i < seats.length; i++) {

				/*System.out.println("UPDATE SCREEN_DETAILS SET BOOKED =1, INSERTED_ON = SYSDATE() WHERE SCREEN_NO ="
						+ session.getAttribute("scrren_no") + " AND SEAT_NO = '" + seats[i] + "';");*/
				stmt.execute("UPDATE SCREEN_DETAILS SET BOOKED =1, UPDATED_ON = SYSDATE() WHERE SCREEN_NO ="
						+ session.getAttribute("scrren_no") + " AND SEAT_NO = '" + seats[i] + "';");

				// System.out.println(query);

				session.setAttribute("transaction_id", transaction_id);
			}
			String query = "INSERT INTO `booking_details`(`TRANSACTION_ID`, `USER_ID`,  `SLOT`, `DATE`, "
					+ "`MOVIE_ID`, `SCREEN_NO`, `SEAT_NO`, `TOTAL`, `INSERTED_ON`) VALUES ('" + (transaction_id) + "','"
					+ session.getAttribute("user_id") + "','" + session.getAttribute("slot") + "','"
					+ session.getAttribute("m_date") + "','" + session.getAttribute("movie_id") + "','"
					+ session.getAttribute("scrren_no") + "','" + (new ScreenDetails().seatArraytoString(seats)) + "','"
					+ (int)session.getAttribute("price")* (int) session.getAttribute("number_of_seats") + "',SYSDATE());";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			preparedStmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void getMovieName(HttpSession session) {
		String movie_name = null;
		String movie_poster = null;
		String m_date = null;
		try {
			stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery("select MOVIETITLE,IMAGE,DATE from movie_details where MOVIE_ID ="
					+ session.getAttribute("movie_id"));
			//System.out.println(rs);
			//System.out.println("select MOVIETITLE,IMAGE,DATE from movie_details where MOVIE_ID ="
				//	+ session.getAttribute("movie_id"));

			while (rs.next()) {
				movie_name = rs.getString("MOVIETITLE");
				movie_poster = rs.getString("IMAGE");
				m_date = rs.getString("DATE");
			}
			// String movie_name= rs.getString("MOVIETITLE");
			//System.out.println(movie_name);
			session.setAttribute("movie_poster", movie_poster);
			session.setAttribute("movie_name", movie_name);
			session.setAttribute("m_date", m_date);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println(e.getMessage());
		}

	}

	public ArrayList<History> history(HttpSession session) {
		int user_id = 0;
		int transaction_id = 0;
		String user_name = null;
		String movie_date = null;
		String slot = null;
		String movie_title = null;
		String screen_no = null;
		String seat_no = null;
		int total = 0;
		String inserted_on = null;
		ArrayList<History> arraylist = new ArrayList<History>();
		//System.out.println(session.getAttribute("user_id"));
		try {
			stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery(
					"select bd.* , u.USERNAME username, md.MOVIETITLE movietitle from booking_details bd join user u "
							+ " on bd.USER_ID =u.USER_ID join movie_details md on " + " bd.MOVIE_ID =md.MOVIE_ID "
							+ " where bd.USER_ID =" + session.getAttribute("user_id"));
			// ResultSet transaction_no =stmt.executeQuery("select count(distinct
			// TRANSACTION_ID) from booking_details where USER_ID = "+user_id1);

			while (rs.next()) {
				transaction_id = rs.getInt("transaction_id");
				user_id = rs.getInt("user_id");
				movie_date = rs.getString("date");
				slot = rs.getString("slot");
				movie_title = rs.getString("movietitle");
				screen_no = rs.getString("screen_no");
				seat_no = rs.getString("seat_no") + " ";
				total += rs.getInt("total");
				inserted_on = rs.getString("inserted_on");
				DateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
				Date date = (Date) parser.parse(movie_date);
				DateFormat formatter = new SimpleDateFormat("MMM-dd-yyyy");
				movie_date = formatter.format(date);
				user_name = rs.getString("username");
				arraylist.add(new History(user_id, transaction_id, user_name, movie_date, slot, movie_title, screen_no,
						seat_no, total, inserted_on));
			}

			
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return arraylist;
	}

	public ArrayList<History> history(int user_id1) {
		int user_id = 0;
		int transaction_id = 0;
		String user_name = null;
		String movie_date = null;
		String slot = null;
		String movie_title = null;
		String screen_no = null;
		String seat_no = null;
		int total = 0;
		String inserted_on = null;
		ArrayList<History> arraylist = new ArrayList<History>();

		try {
			stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery(
					"select bd.* , u.USERNAME username, md.MOVIETITLE movietitle from booking_details bd join user u "
							+ " on bd.USER_ID =u.USER_ID join movie_details md on " + " bd.MOVIE_ID =md.MOVIE_ID "
							+ " where bd.USER_ID =" + user_id1);
			// ResultSet transaction_no =stmt.executeQuery("select count(distinct
			// TRANSACTION_ID) from booking_details where USER_ID = "+user_id1);

			while (rs.next()) {
				transaction_id = rs.getInt("transaction_id");
				user_id = rs.getInt("user_id");
				movie_date = rs.getString("date");
				slot = rs.getString("slot");
				movie_title = rs.getString("movietitle");
				movie_title = rs.getString("screen_no");
				screen_no = rs.getString("seat_no") + " ";
				total += rs.getInt("total");
				inserted_on = rs.getString("inserted_on");
				DateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
				Date date = (Date) parser.parse(movie_date);
				DateFormat formatter = new SimpleDateFormat("MMM-dd-yyyy");
				movie_date = formatter.format(date);
				user_name = rs.getString("username");

			}

			arraylist.add(new History(user_id, transaction_id, user_name, movie_date, slot, movie_title, screen_no,
					seat_no, total, inserted_on));

		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return arraylist;
	}

}