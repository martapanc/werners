package wpb.table;

import java.lang.reflect.Field;
import javax.persistence.*;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "table")
public class Table {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "table_id")
    private Long tableId;
	
    @NotBlank
    @Column(name = "number", unique = true, nullable = false)
	int number;
	
    @Column(name = "room") 
    String room;
	
    @Column(name = "seats")
    int seats;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "category", nullable = false)
	private CategoryType category;

	public enum CategoryType {
		lowcost, medium, highend
	};
	
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

