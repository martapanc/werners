package wpb.manager;

import org.hibernate.SessionFactory;

import wpb.entity.User;
import wpb.util.BCrypt;

public class UserManager extends GenericManager<User, Long> {

	public UserManager(SessionFactory sf) {
		super(User.class, sf);
	}
	
	public User getByEmailPassword(String email, String password)
	{
		
		User exampleEntity = new User();
		exampleEntity.setEmail(email);
				
	    User user = this.getByExample(exampleEntity);
	    
		if(user != null && BCrypt.checkpw(password, user.getPassword())) {
	    	return user;
	    }
	    else return null;
	    		
	}

}
