package wpb.reservation;

import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "reservation")
public class Reservation {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "reservation_id")
    private Long reservationId;
	
	private Timestamp startDate;
	private Timestamp endDate;
	
	@ManyToMany(cascade=CascadeType.ALL)  
    @JoinTable(name="table_reservation", 
    joinColumns=@JoinColumn(name="reservation_id"), 
    inverseJoinColumns=@JoinColumn(name="table_id"))  
	private Set<Table> tableList;  
	
	private String comment;
	
	//user id is missing
}
