package wpb.reservation;

import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.*;

import wpb.Restaurant;
import wpb.roomtable.RoomTable;
import wpb.user.User;

@Entity
@Table(name = "reservation")
public class Reservation extends Restaurant {
	
    @Column(name = "start_date")
	private Timestamp startDate;
	
    @Column(name = "end_date")
    private Timestamp endDate;
	
	@ManyToMany(cascade=CascadeType.ALL)  
    @JoinTable(name="room_table__reservation", 
    joinColumns=@JoinColumn(name="reservation_id"), 
    inverseJoinColumns=@JoinColumn(name="room_table_id"))  
	private Set<RoomTable> tableList;  
	
	@Column(name = "comment")
	private String comment;
    
	@ManyToOne(cascade = CascadeType.ALL)
    private User guest;

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
		return guest;
	}

	public void setGuest(User guest) {
		this.guest = guest;
	}
	
}
