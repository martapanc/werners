package wpb.item;

import javax.persistence.*;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.Cascade;
import org.hibernate.validator.constraints.NotEmpty;

import wpb.foodclass.FoodClass;
import wpb.Restaurant;

@Entity
@Table(name = "item")
public class Item extends Restaurant {
   
	@Column(name = "name", nullable = false)
	@NotEmpty
	private String name;
	
	@ManyToOne(cascade = CascadeType.REFRESH)
	private FoodClass foodClass;
	
	@Column(name = "price")
	private double price;
	
	@Column(name = "available", nullable=false)
	private boolean available;

	public String getName() {
		return name;
	}

	public FoodClass getFoodClass() {
		return foodClass;
	}

	public void setFoodClass(FoodClass foodClass) {
		this.foodClass = foodClass;
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

