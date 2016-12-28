package wpb.entity;

import java.util.Set;

import javax.persistence.*;

import wpb.*;

@Entity
@Table(name = "table_order")
public class TableOrder extends Restaurant {
    
	
	@Column(name = "status", nullable = false)
	private String status;

	@ManyToMany(cascade=CascadeType.ALL)  
    @JoinTable(name="order_item__table_order", 
    joinColumns=@JoinColumn(name="table_order_id"), 
    inverseJoinColumns=@JoinColumn(name="order_item_id"))  
	private Set<OrderItem> orderItemList;
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	public Set<OrderItem> getOrderItemList() {
		return orderItemList;
	}

	
	public void setOrderItemList(Set<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}
	
}
