package wpb.tableorder;

import java.util.List;

import javax.persistence.criteria.*;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;

public class TableOrderManager implements TableDao {

	SessionFactory sf;

	public TableOrderManager(SessionFactory sf) {
		this.sf = sf;
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
			criteria.select(builder.count((criteria.from(TableOrder.class))));
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
	public void updateTableOrder(long id, String name, double price, boolean available) {
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			TableOrder to = (TableOrder) session.get(TableOrder.class, id);
			to.setStatus("pronto");
			session.update(to);
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
	public void deleteTableOrder(long id) {
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			TableOrder to = (TableOrder) session.get(TableOrder.class, id);
			session.delete(to);
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
	public TableOrder getTableOrderById(long id) {
		Session session = sf.openSession();
		Transaction tx = null;
		TableOrder itm = null;
		try {
			tx = session.beginTransaction();
			itm = (TableOrder) session.get(TableOrder.class, id);
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
	public void addTableOrder(TableOrder to) {
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(to);
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
	public List<TableOrder> listTableOrders() {
		List<TableOrder> itmList = null;
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<TableOrder> criteria = builder.createQuery(TableOrder.class);
			criteria.from(TableOrder.class);
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
	public List<TableOrder> listTableOrders(int offset, int limit) {
		List<TableOrder> itmList = null;
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<TableOrder> criteria = builder.createQuery(TableOrder.class);
			criteria.from(TableOrder.class);
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


}
