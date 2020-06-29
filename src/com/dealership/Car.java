package com.dealership;

import java.io.Serializable;

public class Car implements Serializable {

	private Integer id;
	private String manufactureName;
	private String model;
	private String yearBuild;
	private String milesRan;
	private Double price;
	private Integer numberOfDaysOnLot;
	private String description;
	private boolean isBiddable;
	private String image;
	private String available;
	
	
	public Car() {
		
	}

	public Integer getNumberOfDaysOnLot() {
		return numberOfDaysOnLot;
	}

	public void setNumberOfDaysOnLot(Integer numberOfDaysOnLot) {
		this.numberOfDaysOnLot = numberOfDaysOnLot;
	}

	public String getManufactureName() {
		return manufactureName;
	}

	public void setManufactureName(String manufactureName) {
		this.manufactureName = manufactureName;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getMilesRan() {
		return milesRan;
	}

	public void setMilesRan(String milesRan) {
		this.milesRan = milesRan;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
	public String getYearBuild() {
		return yearBuild;
	}

	public void setYearBuild(String yearBuild) {
		this.yearBuild = yearBuild;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isBiddable() {
		return isBiddable;
	}

	public void setBiddable(boolean isBiddable) {
		this.isBiddable = isBiddable;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((manufactureName == null) ? 0 : manufactureName.hashCode());
		result = prime * result + ((milesRan == null) ? 0 : milesRan.hashCode());
		result = prime * result + ((model == null) ? 0 : model.hashCode());
		result = prime * result + ((yearBuild == null) ? 0 : yearBuild.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Car other = (Car) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (manufactureName == null) {
			if (other.manufactureName != null)
				return false;
		} else if (!manufactureName.equals(other.manufactureName))
			return false;
		if (milesRan == null) {
			if (other.milesRan != null)
				return false;
		} else if (!milesRan.equals(other.milesRan))
			return false;
		if (model == null) {
			if (other.model != null)
				return false;
		} else if (!model.equals(other.model))
			return false;
		if (yearBuild == null) {
			if (other.yearBuild != null)
				return false;
		} else if (!yearBuild.equals(other.yearBuild))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return id + "," + manufactureName + "," + model + "," + yearBuild + "," + milesRan + "," + price + ","
				+ numberOfDaysOnLot + "," + available;
	}
	
}
