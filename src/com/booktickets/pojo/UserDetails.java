package com.booktickets.pojo;

public class UserDetails {

	String username;
	String password;
	String email;
	long phone;
	//default constructor
	public UserDetails()
	{
		
	}
	//parameterized constructor
	public UserDetails(String username,	String password, String email,	long phone)
	{
		
		this.username=username;
		this.password=password;
		this.email=email;
		this.phone=phone;
	}
	
	//get() method for all variables
	public String getUsername()
	{
		return this.username;
	}
	
	public String getPassword()
	{
		return this.password;
	}
	
	public String getEmail()
	{
		return this.email;
	}
	
	public long getPhone()
	{
		return this.phone;
	}
	
	//set() method for all variables
	
	public void setUsername(String username)
	{
		this.username=username;
	}
	
	public void setEmail(String email)
	{
		this.email=email;
	}
	
	public void setPassword(String password)
	{
		this.password=password;
	}
	
	public void setPhone(long phone)
	{
		this.phone=phone;
	}
	
		//overriding toString() method
	public String toString()
	{
		return username;
	}
	
}
