package wpb.entity;

import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "reservation")
public class Reservation extends Restaurant {
	
    @Column(name = "start_date")
	private Timestamp startDate;
	
    @Column(name = "end_date")
    private Timestamp endDate;
	
    @ManyToOne(cascade = CascadeType.REFRESH)
    @NotNull
    private RoomTable roomTable;
	
	@Column(name = "comment")
	private String comment;
    
	@ManyToOne(cascade = CascadeType.ALL)
    private User user;

	@Column(name = "customer_name")
	private String customerName; 
	
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

	public void setRoomTable(RoomTable rt) {
		this.roomTable = rt;
	}

	public RoomTable getRoomTable() {
		return roomTable;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public void setCustomerName(String name) {
		this.customerName = name;
	}
	
	public String getCustomerName() {
		return customerName;
	}
	
}
