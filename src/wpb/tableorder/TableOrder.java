package wpb.tableorder;

import javax.persistence.*;

import wpb.*;

@Entity
@Table(name = "table_order")
public class TableOrder extends Restaurant {
	
	@Column(name = "status", nullable = false)
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
