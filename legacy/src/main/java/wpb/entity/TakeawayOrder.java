package wpb.entity;

import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "takeaway_order")
public class TakeawayOrder extends Restaurant {
	
	
	@Column(name = "status", nullable = false)
	private String status;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)  
    @JoinTable(name="order_item__takeaway_order", 
    joinColumns=@JoinColumn(name="takeaway_order_id"), 
    inverseJoinColumns=@JoinColumn(name="order_item_id"))  
	private Set<OrderItem> orderItemList;
	
	@Column(name = "order_date")
	private Timestamp orderDate;
	
	@Column(name = "address", nullable = false)
	private String address;
	
	@Column(name = "cost", nullable = false)
	private double cost;
	
	@Column(name = "comment")
	private String comment;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@ManyToOne(cascade = CascadeType.ALL)
    private User guest;
	
	public Set<OrderItem> getOrderItemList() {
		return orderItemList;
	}
	
	public void setOrderItemList(Set<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}
	
	@Column(name = "customer_name")
	private String customerName; 
	
	@Column(name = "phone_number")
	private String phoneNumber; 
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	
	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public User getGuest() {
		return guest;
	}

	public void setGuest(User guest) {
		this.guest = guest;
	}
	
	public String getComment() {
		return comment;
	}
	
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public void setCustomerName(String name) {
		this.customerName = name;
	}
	
	public void setPhoneNumber(String phone) {
		this.phoneNumber = phone;
	}
	
}
