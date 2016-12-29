package wpb.entity;

import javax.persistence.*;
import java.util.List;
import java.util.ArrayList;

@Entity
@Table(name = "role")
public class Role extends Restaurant {
    
	@Basic
    @Column(name = "role")
    private String role;
    
    @OneToMany(targetEntity = User.class, mappedBy = "role")
	private List<User> users = new ArrayList<User>();

    public String getRole() {
        return role;
    }

    public void setRole(String type) {
        this.role = type;
    }


    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

}
