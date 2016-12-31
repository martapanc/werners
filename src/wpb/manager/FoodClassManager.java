package wpb.manager;


import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;

import wpb.entity.FoodClass;
import wpb.entity.User;

public class FoodClassManager extends GenericManager<FoodClass, Long> {

	public FoodClassManager(SessionFactory sf) {
		super(FoodClass.class, sf);
	}
	
	public FoodClass getByName(String fcName) {

		Session session = sf.openSession();
		Transaction tx = null;
		FoodClass exampleEntity = new FoodClass();
		exampleEntity.setName(fcName);

		tx = session.beginTransaction();
		Criteria criteria = session.createCriteria(FoodClass.class).add(Example.create(exampleEntity));
		FoodClass fc = (FoodClass) criteria.uniqueResult();

		tx.commit();
		
		return fc;

	}
}
