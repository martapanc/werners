package wpb.entity;

import javax.persistence.*;

@Entity
@Table(name="order_item")
public class OrderItem extends Restaurant {
	
	@Column(name = "quantity", nullable=false)
	private int quantity;
	
	@Column(name = "comment")
	private String comment;
	
	@ManyToOne(cascade = CascadeType.ALL)
	private Item item;

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String string) {
		this.comment = string;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}
	
	
}
