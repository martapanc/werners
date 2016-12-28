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
		//exampleEntity.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
		
		tx = session.beginTransaction();
		Criteria criteria = session.createCriteria(User.class).add(Example.create(exampleEntity));
	    User user = (User) criteria.uniqueResult();

	    tx.commit();
		
	    if(user != null && BCrypt.checkpw(password, user.getPassword())) {
	    	return user;
	    }
	    else return null;
	    		
	    //System.out.println("getCompanyEntityByExample: companyEntityList=" + user);

	    //return user;
	}
	
	/*
	public User getByUsernamePassword(String username, String password) throws Exception {
		
		String tableName = "User";
		String hql = "FROM :tablename WHERE :attribute = :string";
		 
		Query query = ((Session) sf).createQuery(hql);
		query.setParameter("tablename", "User");
		query.setParameter("attribute", "email");
		query.setParameter("string", "username");
		
		 
		//return  query.uniqueResult();
		
		/*
		return null;
		
		StringBuffer query = new StringBuffer("from User u where ");
        query.append("u.username = '" + username + "' and ");
        query.append("u.password = '" + DigestUtils.md5Hex(password) + "'");

        User user = (User) HibernateUtil.getSessionFactory()).createQuery(query.toString()).uniqueResult();

        return user;
    }*/
}
