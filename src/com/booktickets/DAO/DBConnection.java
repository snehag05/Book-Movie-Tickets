package com.booktickets.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
				System.out.println("login successful!");
				session.setAttribute("user_id", rs.getInt("USER_ID"));

				return true;
			} else {
				System.out.println("Incorrect username or passsword");
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
				System.out.println("Oops! something went wrong.");

			}

			String query = "INSERT INTO USER(USER_ID, USERNAME, PASSWORD, EMAIL, PHONE, INSERTED_ON) VALUES ('"
					+ (user_id + 1) + "','" + username + "','" + password + "','" + email + "','" + phone
					+ "',SYSDATE());";
			System.out.println(query);
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
			rs = stmt.executeQuery("SELECT * FROM MOVIE_DETAILS;");
			while (rs.next()) {
				arraylist.add(new MovieDetails(rs.getInt("MOVIE_ID"), rs.getString("MOVIETITLE"), rs.getString("DATE"),
						rs.getInt("SCREEN_NO"), rs.getString("SLOT"), rs.getInt("PRICE"), rs.getString("TRAILER"),
						rs.getString("IMAGE")));
				session.setAttribute("slot", rs.getString("SLOT"));
				session.setAttribute("price", rs.getInt("PRICE"));
				session.setAttribute("date", rs.getString("DATE"));
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

	public synchronized void  transaction(HttpSession session, String[] seats) {

		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT MAX(TRANSACTION_ID) FROM booking_details;");
			System.out.println("SELECT MAX(TRANSACTION_ID) FROM booking_details;");
			int transaction_id = 0;
			if (rs.next()) {
				transaction_id = rs.getInt("MAX(TRANSACTION_ID)");
			}

			for (int i = 0; i < seats.length; i++) {
				String query = "INSERT INTO `booking_details`(`TRANSACTION_ID`, `USER_ID`,  `SLOT`, "
						+ "`MOVIE_ID`, `SCREEN_NO`, `SEAT_NO`, `TOTAL`, `INSERTED_ON`) VALUES ('" + (transaction_id++) + "','"
						+ session.getAttribute("user_id") + "','" + session.getAttribute("slot") + "','"
						+ session.getAttribute("movie_id") + "','" + session.getAttribute("scrren_no") + "','"
						+ seats[i] + "','" + session.getAttribute("price") + "',SYSDATE());";
				System.out.println("UPDATE SCREEN_DETAILS SET BOOKED =1, INSERTED_ON = SYSDATE() WHERE SCREEN_NO ="+session.getAttribute("scrren_no") 
				+" AND SEAT_NO = '"+seats[i] +"' AND SLOT =  '"+session.getAttribute("slot")+"';");
				stmt.execute("UPDATE SCREEN_DETAILS SET BOOKED =1, UPDATED_ON = SYSDATE() WHERE SCREEN_NO ="+session.getAttribute("scrren_no") 
				+" AND SEAT_NO = '"+seats[i] +"' AND SLOT =  '"+session.getAttribute("slot")+"';");
				
				System.out.println(query);
				PreparedStatement preparedStmt = con.prepareStatement(query);
				preparedStmt.execute();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

	}
	
	public void getMovieName(HttpSession session)
	{
		String movie_name=null;
		try {
			stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("select MOVIETITLE from movie_details where MOVIE_ID ="+session.getAttribute("movie_id"));
			System.out.println(rs);
			System.out.println("select MOVIETITLE from movie_details where MOVIE_ID ="+session.getAttribute("movie_id"));
			
			while(rs.next())
			{
				movie_name =rs.getString("MOVIETITLE");
			}
			//String movie_name= rs.getString("MOVIETITLE");
			System.out.println(movie_name);
			session.setAttribute("movie_name", movie_name);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println(e.getMessage());
		}
		
		
	}

}
