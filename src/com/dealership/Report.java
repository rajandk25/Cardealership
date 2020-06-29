package com.dealership;

public class Report {
	private Car car;
	private Transaction txn;
	
	public Report(Car car, Transaction txn) {
		super();
		this.car = car;
		this.txn = txn;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public Transaction getTxn() {
		return txn;
	}

	public void setTxn(Transaction txn) {
		this.txn = txn;
	}
	
	

}
