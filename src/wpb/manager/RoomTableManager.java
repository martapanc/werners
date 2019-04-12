package wpb.manager;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import wpb.entity.RoomTable;

public class RoomTableManager extends GenericManager<RoomTable, Long> {

	public RoomTableManager(SessionFactory sf) {
		super(RoomTable.class, sf);
	}

	public List<RoomTable> findSuitableTables(int neededSeats){
		Criterion[] c = new Criterion[] { Restrictions.ge("seats", neededSeats)};
		return findByCriteria(c, Order.asc("seats"));
	}

}
