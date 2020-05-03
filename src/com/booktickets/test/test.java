package com.booktickets.test;



import com.booktickets.DAO.DBConnection;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		DBConnection con = new DBConnection();
		
		System.out.println(con.history(1));
		
	}

}
