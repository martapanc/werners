package wpb.foodclass;

import javax.persistence.*;

import wpb.Restaurant;

@Entity
@Table(name = "food_class")
public class FoodClass extends Restaurant {
   
	@Column(name = "name", nullable = false)
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}

