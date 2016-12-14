package wpb.item;

import java.util.List;

import javax.persistence.criteria.*;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;

public class ItemManager implements ItemDao {

	SessionFactory sf;

	public ItemManager(SessionFactory sf) {
		this.sf = sf;
	}

	@Override
	public void addItem(Item itm) {
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(itm);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	@Override
	public List<Item> listItems() {
		List<Item> itmList = null;
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Item> criteria = builder.createQuery(Item.class);
			criteria.from(Item.class);
			itmList = session.createQuery(criteria).getResultList();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return itmList;
	}
	
	@Override
	public List<Item> listItems(int offset, int limit) {
		List<Item> itmList = null;
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Item> criteria = builder.createQuery(Item.class);
			criteria.from(Item.class);
			itmList = session.createQuery(criteria).
					setFirstResult(offset).
					setMaxResults(limit).
					getResultList();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return itmList;
	}
	
	@Override
	public long getTotalCount() {
		long totalCount = 0;
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Long> criteria = builder.createQuery(Long.class);
			criteria.select(builder.count((criteria.from(Item.class))));
			totalCount = session.createQuery(criteria).getSingleResult();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return totalCount;
	}
	
	@Override
	public Item getItemById(long id) {
		Session session = sf.openSession();
		Transaction tx = null;
		Item itm = null;
		try {
			tx = session.beginTransaction();
			itm = (Item) session.get(Item.class, id);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return itm;
	}

	@Override
	public void updateItem(long id, String name, double price, boolean available) {
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Item itm = (Item) session.get(Item.class, id);
			itm.setName(name);
			itm.setPrice(price);
			itm.setAvailable(available);
			session.update(itm);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@Override
	public void deleteItem(long id) {
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Item itm = (Item) session.get(Item.class, id);
			session.delete(itm);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}

	}


}
