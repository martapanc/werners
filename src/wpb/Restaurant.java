package wpb;

import java.lang.reflect.Field;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.*;

public class Restaurant {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id")
    private Long itemId;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date")
	private Date createDate;
	
	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_date")
	private Date updateDate;
	
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
