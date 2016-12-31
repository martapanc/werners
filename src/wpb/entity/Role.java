package wpb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class Role extends Restaurant {
    
	@Column(name = "role", nullable = false, unique = true)
	private String role;
    
    //@OneToMany(targetEntity = User.class, mappedBy = "role", fetch=FetchType.EAGER)
	//private Set<User> users = new HashSet<User>();

    public String getRole() {
        return role;
    }

    public void setRole(String type) {
        this.role = type;
    }

}
