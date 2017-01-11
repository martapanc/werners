package wpb.manager;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import wpb.entity.RoomTable;

public class RoomTableManager extends GenericManager<RoomTable, Long> {

	public RoomTableManager(SessionFactory sf) {
		super(RoomTable.class, sf);
	}

	public List<RoomTable> findSuitableTables(int neededSeats){
		return findByCriteria(Restrictions.ge("seats", neededSeats));
	}
}
