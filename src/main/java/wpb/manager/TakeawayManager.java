package wpb.manager;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.*;

import wpb.entity.*;

public class TakeawayManager extends GenericManager<TakeawayOrder, Long> {

	public TakeawayManager(SessionFactory sf) {
		super(TakeawayOrder.class, sf);
	}
	
	public long findOrderCount() {
		
		//String m = (month <= 10 ? "0" + month : "" + month);
		Date d = new Date();
		
		//AggregateProjection[] p = new AggregateProjection[] {Projections.sum("cost")};
		Criterion[] c = new Criterion[] { (Criterion) Projections.sum("cost") };
		List<TakeawayOrder> list = findByCriteria(c);
		return (long) list.size();
	}

	/*public List<Reservation> findSuitableTables(int neededSeats){
		Criterion[] c = new Criterion[] { Restrictions.ge("seats", neededSeats)};
		
		return findByCriteria(c, Order.asc("seats"));
	}*/

}
