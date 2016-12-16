package wpb;

import java.io.Serializable;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;

public class GenericManager<T, PK extends Serializable> implements GenericDao<T, PK> {

	// use of JPA entityManager recommended
	protected SessionFactory sf;
	private Class<T> persistentClass;

	public GenericManager(Class<T> persistentClass, SessionFactory sf) {
		this.sf = sf;
		this.persistentClass = persistentClass;
	}

	@SuppressWarnings("unchecked")
	public Class<T> getPersistentClass() {
		return persistentClass;
	}

	@SuppressWarnings("unchecked")
	@Override
	public PK add(T newInstance) {
		Session session = sf.openSession();
		Transaction tx = null;
		Serializable key = null;
		try {
			tx = session.beginTransaction();
			key = session.save(newInstance);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return (PK) key;
	}

	@Override
	public T find(PK id, boolean lock) {
		Session session = sf.openSession();
		Transaction tx = null;
		T foundObject = null;
		try {
			tx = session.beginTransaction();
			foundObject = session.get(getPersistentClass(), id);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return foundObject;
	}

	@Override
	public List<T> getAll() {
		List<T> objList = null;
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<T> criteria = builder.createQuery(getPersistentClass());
			criteria.from(getPersistentClass());
			objList = session.createQuery(criteria).getResultList();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return objList;
	}

	@Override
	public List<T> getPartial(int offset, int limit) {
		List<T> objList = null;
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<T> criteria = builder.createQuery(getPersistentClass());
			criteria.from(getPersistentClass());
			objList = session.createQuery(criteria).setFirstResult(offset).setMaxResults(limit).getResultList();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return objList;
	}

	@Override
	public void update(T transientObject) {
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.saveOrUpdate(transientObject);
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
	public void delete(T persistentObject) {
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(persistentObject);
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
	public long getTotalCount() {
		long totalCount = 0;
		Session session = sf.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Long> criteria = builder.createQuery(Long.class);
			criteria.select(builder.count((criteria.from((getPersistentClass())))));
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

	/**
	 * Use this inside subclasses as a convenience method.
	 */
	@SuppressWarnings("unchecked")
	protected List<T> findByCriteria(Criterion... criterion) {
		Criteria crit = sf.getCurrentSession().createCriteria(getPersistentClass());
		for (Criterion c : criterion) {
			crit.add(c);
		}
		return crit.list();
	}

}
