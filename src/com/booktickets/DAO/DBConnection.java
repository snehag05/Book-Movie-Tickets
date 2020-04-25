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
	public DBConnection()
	{
		try {
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movietheater", "root",null);
			 System.out.println("Database connection established");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void login(String username, String password)
	{
		//Statement stmt;
		try {
			stmt = con.createStatement();
			rs	= stmt.executeQuery("SELECT * FROM LOGININFO WHERE USERNAME ='"+username+"'AND PASSWORD='"+password+"';");
			if(rs.next()!=false)
			{
				System.out.println("login successful!");
			}
			else {
				System.out.println("Incorrect username or passsword");	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		public void signUp(String username, String password, String email, Long phone)
		{
			
			try {
				
				String query = "INSERT INTO LOGININFO(USERNAME, PASSWORD, EMAIL, PHONE, INSERTED_ON) VALUES ('"+
						username+"','"+password+"','"+email+"','"+phone+"',SYSDATE());";
				System.out.println(query);
				PreparedStatement preparedStmt = con.prepareStatement(query);
				preparedStmt.execute();
				}
				 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

		public ArrayList<MovieDetails> loadMovies(HttpSession session) {
		
			ArrayList<MovieDetails> arraylist= new ArrayList<MovieDetails>();
			
			try
			{
				stmt = con.createStatement();
				rs	= stmt.executeQuery("SELECT * FROM MOVIE_DETAILS;");
				while(rs.next()){
					arraylist.add(new MovieDetails(rs.getInt("MOVIE_ID"),rs.getString("MOVIETITLE"),
							rs.getInt("SCREEN_NO"),rs.getInt("PRICE"),rs.getString("TRAILER"),rs.getString("IMAGE")));
				}
				
				session.setAttribute("Movies",arraylist);	
				
				
			}
			catch(Exception e)
			{
				System.err.println(e.getMessage());
			}
			return arraylist;
			
			
		}
	
	
	
	
}
