package com.booktickets.pojo;

public class MovieDetails {
	int movie_id;
	String movieTitle;
	int screen_no;
	int price;
	String image;
	String trailer;
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTrailer() {
		return trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	

//default constructor
	public MovieDetails() {

	}

//parameterized constructor
	public MovieDetails(int movie_id, String movieTitle, int screen_no, int price, String trailer, String image) {
		this.movie_id = movie_id;
		this.movieTitle = movieTitle;
		this.screen_no = screen_no;
		this.price = price;
		this.trailer =trailer;
		this.image=image;
	}
//get() method for all variables

	public int getMovie_id() {
		return this.movie_id;
	}

	public String getMovieTitle() {
		return this.movieTitle;
	}

	public int getScreen_no() {
		return this.screen_no;
	}
	
	public int getPrice() {
		return this.price;
	}

//set() method for all variables
	
	public void ssetMovie_id(int movie_id) {
		 this.movie_id=movie_id;
	}

	public void setMovieTitle(String movieTitle) {
		 this.movieTitle=movieTitle;
	}

	public void setScreen_no(int screen_no) {
		this.screen_no=screen_no;
	}
	
	public void setPrice(int price) {
		 this.price=price;
	}
	
	//overriding toString() method
	
	public String toString()
	{
		return "Movie title is "+this.movieTitle+", movie ID is:"+this.movie_id+" , playing on screen: "+this.screen_no+" , cost per seat is: "+this.price
				+ this.trailer;
	}
}
