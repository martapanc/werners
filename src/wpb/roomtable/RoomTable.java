package wpb.roomtable;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import java.lang.reflect.Field;
import javax.persistence.*;
import javax.validation.constraints.NotNull;


@Entity
@Table(name = "room_table")
public class RoomTable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "table_id")
    private Long tableId;
	
    /*@NotEmpty @NotNull @NotBlank*/ //really needed this type of validation
    @Column(name = "number", unique = true, nullable = false)
	private int number;
	
    @Column(name = "room") 
    private String room;
	
    @Column(name = "seats")
    private int seats;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "category", nullable = false)
	private CategoryType category;

	public enum CategoryType {
		lowcost, medium, highend
	};
	

	public int getNumber() {
		return number;
	}

	
	public void setNumber(int number) {
		this.number = number;
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
	
	@Override
    //<editor-fold defaultstate="collapsed" desc="toString override">
    public String toString() {
        StringBuilder result = new StringBuilder();
        String newLine = System.getProperty("line.separator");

        result.append(this.getClass().getName());
        result.append(" {");
        result.append(newLine);

        //determine fields declared in this class only (no fields of superclass)
        Field[] fields = this.getClass().getDeclaredFields();

        //print field names paired with their values
        for (Field field : fields) {
            result.append("  ");
            try {
                result.append(field.getName());
                result.append(": ");
                //requires access to private field:
                result.append(field.get(this));
            } catch (IllegalAccessException ex) {
                System.out.println(ex);
            }
            result.append(newLine);
        }
        result.append("}");

        return result.toString();
    }
}

