package wpb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class Role extends Restaurant {
    
	public enum RoleEnum {
		ADMIN, DBMANAGER, WAITER, CUSTOMER
	}
	
	@Column(name = "name", nullable = false, unique = true)
	private RoleEnum name;
            
    public RoleEnum getName() {
        return name;
    }

    public void setName(RoleEnum name) {
        this.name = name;
    }
    
}
