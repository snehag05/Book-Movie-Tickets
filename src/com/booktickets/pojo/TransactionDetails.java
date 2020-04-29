package com.booktickets.pojo;

import java.util.Date;

public class TransactionDetails {

	int transactionID;
	int user_id;
	int screen_no;
	int seat_no;
	boolean booked;
	Date date;
	 
	public TransactionDetails()
	{}
	public TransactionDetails(int transactionID, int user_id, int screen_no, int seat_no, boolean booked, Date date) {
		super();
		this.transactionID = transactionID;
		this.user_id = user_id;
		this.screen_no = screen_no;
		this.seat_no = seat_no;
		this.booked = booked;
		this.date = date;
	}
	public int getTransactionID() {
		return transactionID;
	}
	public void setTransactionID(int transactionID) {
		this.transactionID = transactionID;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getScreen_no() {
		return screen_no;
	}
	public void setScreen_no(int screen_no) {
		this.screen_no = screen_no;
	}
	public int getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}
	public boolean isBooked() {
		return booked;
	}
	public void setBooked(boolean booked) {
		this.booked = booked;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
