package wpb.item;

import java.lang.reflect.Field;

import javax.persistence.*;

import wpb.Restaurant;

@Entity
@Table(name = "item")
public class Item extends Restaurant {
   
	@Column(name = "name", nullable = false)
	private String name;
	
	@Column(name = "price")
	private double price;
	
	@Column(name = "available", nullable=false)
	private boolean available;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}
	
}

