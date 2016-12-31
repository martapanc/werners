package wpb.manager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;

import wpb.entity.User;
import wpb.util.BCrypt;

public class UserManager extends GenericManager<User, Long> {

	public UserManager(SessionFactory sf) {
		super(User.class, sf);
		// TODO Auto-generated constructor stub
	}
	
	public User getByEmailPassword(String email, String password)
	{
		Session session = sf.openSession();
		Transaction tx = null;
		User exampleEntity = new User();
		exampleEntity.setEmail(email);
		
		tx = session.beginTransaction();
		Criteria criteria = session.createCriteria(User.class).add(Example.create(exampleEntity));
	    User user = (User) criteria.uniqueResult();

	    tx.commit();
		
	    if(user != null && BCrypt.checkpw(password, user.getPassword())) {
	    	return user;
	    }
	    else return null;
	    		
	}

}
