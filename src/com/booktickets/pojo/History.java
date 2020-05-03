package com.booktickets.pojo;

public class History {

	int user_id =0;
	int transaction_id =0;
	String user_name = null;
	String movie_date =null;
	String slot =null;
	String movie_title =null;
	String screen_no =null;
	String seat_no =null;
	int total=0;
	String inserted_on =null;
	
	public History(int user_id, int transaction_id, String user_name, String movie_date, String slot,
			String movie_title, String screen_no, String seat_no, int total, String inserted_on) {
		super();
		this.user_id = user_id;
		this.transaction_id = transaction_id;
		this.user_name = user_name;
		this.movie_date = movie_date;
		this.slot = slot;
		this.movie_title = movie_title;
		this.screen_no = screen_no;
		this.seat_no = seat_no;
		this.total = total;
		this.inserted_on = inserted_on;
	}
	
	
	
	
	
	public int getUser_id() {
		return user_id;
	}





	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}





	public int getTransaction_id() {
		return transaction_id;
	}





	public void setTransaction_id(int transaction_id) {
		this.transaction_id = transaction_id;
	}





	public String getUser_name() {
		return user_name;
	}





	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}





	public String getMovie_date() {
		return movie_date;
	}





	public void setMovie_date(String movie_date) {
		this.movie_date = movie_date;
	}





	public String getSlot() {
		return slot;
	}





	public void setSlot(String slot) {
		this.slot = slot;
	}





	public String getMovie_title() {
		return movie_title;
	}





	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}





	public String getScreen_no() {
		return screen_no;
	}





	public void setScreen_no(String screen_no) {
		this.screen_no = screen_no;
	}





	public String getSeat_no() {
		return seat_no;
	}





	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}





	public int getTotal() {
		return total;
	}





	public void setTotal(int total) {
		this.total = total;
	}





	public String getInserted_on() {
		return inserted_on;
	}





	public void setInserted_on(String inserted_on) {
		this.inserted_on = inserted_on;
	}





	@Override
	public String toString() {
		return "History [user_id=" + user_id + ", transaction_id=" + transaction_id + ", user_name=" + user_name
				+ ", movie_date=" + movie_date + ", slot=" + slot + ", movie_title=" + movie_title + ", screen_no="
				+ screen_no + ", seat_no=" + seat_no + ", total=" + total + ", inserted_on=" + inserted_on + "]\n";
	}
	
	
}
