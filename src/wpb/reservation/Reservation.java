package wpb.reservation;

import java.lang.reflect.Field;
import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.*;

import wpb.roomtable.RoomTable;
import wpb.user.User;

@Entity
@Table(name = "reservation")
public class Reservation {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "reservation_id")
    private Long reservationId;
	
    @Column(name = "start_date")
	private Timestamp startDate;
	
    @Column(name = "end_date")
    private Timestamp endDate;
	
	@ManyToMany(cascade=CascadeType.ALL)  
    @JoinTable(name="table_reservation", 
    joinColumns=@JoinColumn(name="reservation_id"), 
    inverseJoinColumns=@JoinColumn(name="table_id"))  
	private Set<RoomTable> tableList;  
	
	@Column(name = "comment")
	private String comment;
    
	@ManyToOne(cascade = CascadeType.ALL)
    private User Guest;

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public Set<RoomTable> getTableList() {
		return tableList;
	}

	public void setTableList(Set<RoomTable> tableList) {
		this.tableList = tableList;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public User getGuest() {
		return Guest;
	}

	public void setGuest(User guest) {
		Guest = guest;
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
