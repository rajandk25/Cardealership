package com.dealership;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Transaction implements Comparable<Transaction>{
	public static final String DATE_FORMAT = "MM/dd/yyyy HH:mm:ss";
	
	private String transactionId;
	private Date date;
	private String userId;
	private int carId;
	
	
	
	public Transaction(int carId, String transactionId, Date date, String userId) {
		super();
		this.transactionId = transactionId;
		this.date = date;
		this.userId = userId;
		this.carId = carId;
	}


	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getCarId() {
		return carId;
	}
	public void setCarId(int carId) {
		this.carId = carId;
	}
	
	


	@Override
	public String toString() {
		// Create an instance of SimpleDateFormat used for formatting 
		// the string representation of date according to the chosen pattern
		DateFormat df = new SimpleDateFormat(DATE_FORMAT);       
		// Using DateFormat format method we can create a string 
		// representation of a date with the defined format.
		String dateString = df.format(date);
		return carId + "," + transactionId + "," + dateString + "," + userId;
	}


	@Override
	public int compareTo(Transaction o) {
		return o.getDate().compareTo(getDate());
	}
	
	

}
