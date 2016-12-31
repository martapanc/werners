package wpb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name = "food_class")
public class FoodClass extends Restaurant {
	

    //@OneToMany(targetEntity = Item.class, mappedBy = "foodClass", fetch=FetchType.EAGER)
    //private Set<Item> items= new HashSet<Item>();
   
	@Column(name = "name", nullable = false, unique = true)
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}

