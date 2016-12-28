package wpb.entity;

import javax.persistence.*;
import java.util.List;
import java.util.ArrayList;

@Entity
@Table(name = "user_type")
public class UserType extends Restaurant {
    
	@Basic
    @Column(name = "type")
    private String type;
    
    @OneToMany(targetEntity = User.class, mappedBy = "userType")
	private List<User> users = new ArrayList<User>();

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

}
