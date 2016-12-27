package wpb.roomtable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import wpb.Restaurant;


@Entity
@Table(name = "room_table")
public class RoomTable extends Restaurant {
	
    /*@NotEmpty @NotNull @NotBlank*/ //really needed this type of validation
    //@Column(name = "number", unique = true, nullable = false)
	//private int number;
	
    @Column(name = "name", nullable=false)
    private String name;
    
    @Column(name = "room") 
    private String room;
	
    @Column(name = "seats", nullable=false)
    @Min(1)
    @Max(12)
    private int seats = 1;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "category", nullable = false)
	private CategoryType category;

	public enum CategoryType {
		lowcost, medium, highend
	};
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	public String getRoom() {
		return room;
	}

	
	public void setRoom(String room) {
		this.room = room;
	}

	
	public int getSeats() {
		return seats;
	}

	
	public void setSeats(int seats) {
		this.seats = seats;
	}

	
	public CategoryType getCategory() {
		return category;
	}

	
	public void setCategory(CategoryType category) {
		this.category = category;
	}
	
}

