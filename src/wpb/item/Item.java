package wpb.item;

import java.lang.reflect.Field;

import javax.persistence.*;

@Entity
@Table(name = "item")
public class Item {
   
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "item_id")
    private Long itemId;
	
	@Column(name = "name", nullable = false)
	String name;
	
	@Column(name = "price")
	double price;
	
	@Column(name = "available", nullable=false)
	boolean available;


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

