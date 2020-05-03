package com.booktickets.pojo;

import java.util.Date;

public class ScreenDetails {

	int screen_no;
	int seat_no;
	boolean booked;
	Date date;
	public ScreenDetails() {}
	public ScreenDetails(int screen_no, int seat_no, boolean booked) {
		super();
		this.screen_no = screen_no;
		this.seat_no = seat_no;
		this.booked = booked;
		this.date = date;
		this.slot = slot;
	}
	String slot;
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
	public String getSlot() {
		return slot;
	}
	public void setSlot(String slot) {
		this.slot = slot;
	}
	@Override
	public String toString() {
		return "ScreenDetails [screen_no=" + screen_no + ", seat_no=" + seat_no + ", booked=" + booked ;
	}
	
	public String seatArraytoString(String [] seats)
	{
		String seat_list="";
		for(int i=0;i<seats.length;i++)
		{
			if(i==(seats.length-1))
			{
			seat_list=seat_list+seats[i]+"";
			}
			else {
				seat_list=seat_list+seats[i]+", ";
			}
		}
		
		return seat_list;
	}
	
}
