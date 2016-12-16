package wpb;

import java.lang.reflect.Field;


import javax.persistence.*;

@Entity
@Table(name = "restaurant")
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class Restaurant {
	
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE)
    @Column(name = "id")
    private Long itemId;
	
	
	@Version
	@Column(name="version_number")
	private int versionNumber;
	
	public String toString() {
	        StringBuilder result = new StringBuilder();
	        String newLine = System.getProperty("line.separator");

	        result.append(this.getClass().getName());
	        result.append(" {");
	        result.append(newLine);

	        //determine fields declared in this class only
	        Field[] superfields = this.getClass().getSuperclass().getDeclaredFields();
	        Field[] fields = this.getClass().getDeclaredFields();
	        
	        //print field names paired with their values
	        for (Field field : superfields) {
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
	        
	        
	        for (Field field : fields) {
	            result.append("  ");
	            try {
	                result.append(field.getName());
	                result.append(": ");
	                //requires access to private field:
	            	field.setAccessible(true);
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
