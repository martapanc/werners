package wpb.manager;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import wpb.entity.Reservation;
import wpb.entity.RoomTable;
import wpb.util.TimestampUtils;

public class RoomTableManager extends GenericManager<RoomTable, Long> {

	public RoomTableManager(SessionFactory sf) {
		super(RoomTable.class, sf);
	}

	public List<RoomTable> findSuitableTables(int neededSeats){
		Criterion[] c = new Criterion[] { Restrictions.ge("seats", neededSeats)};
		return findByCriteria(c, Order.asc("seats"));
	}
	
	@SuppressWarnings("deprecation")
	public List<RoomTable> findFreeRoomTables(int neededSeats, Timestamp startDate, Timestamp endDate) {
		
		List<RoomTable> suitableTablesList = null;
		List<Reservation> overLapReservations = null;
		
		// find all tables with eq or greater seats
		Transaction tx = sf.getCurrentSession().beginTransaction();
		Criteria crit1 = sf.getCurrentSession().createCriteria(RoomTable.class);
		crit1.add(Restrictions.ge("seats", neededSeats));
		crit1.addOrder(Order.asc("seats"));
		suitableTablesList = crit1.list();
		
		//Map<Long,RoomTable> map = new HashMap<Long,RoomTable>();
		//for (RoomTable rt : suitableTablesList) map.put(rt.getId(), rt);
		
		// find all overlaping reservations
		Criteria crit2 = sf.getCurrentSession().createCriteria(Reservation.class);
		crit2.add(Restrictions.between("startDate", startDate, endDate));
		crit2.add(Restrictions.between("endDate", startDate, endDate));
		
		overLapReservations = crit2.list();

		tx.commit();
		
		if(!overLapReservations.isEmpty()) {
			// if overlaping reservations remove their tables
			// from suitableTableList
			for(Reservation res : overLapReservations) {
				suitableTablesList.remove(res.getRoomTable());
			}
		}
			return suitableTablesList;
	}
}
