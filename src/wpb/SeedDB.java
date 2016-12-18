package wpb;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import src.wpb.foodclass.FoodClass;
import src.wpb.takeawayorder.TakeawayOrder;
import wpb.item.Item;
import wpb.orderitem.OrderItem;
import wpb.roomtable.RoomTable;
import wpb.tableorder.TableOrder;

/**
 *
 * @author Werner Sperandio
 */
public class SeedDB {

	private static Connection connection = null;
	private static SessionFactory mySessionFactory = null;
	private static SessionIdentifierGenerator idgen = new SessionIdentifierGenerator();
	private static GenericManager<Item, Long> itmManager = null;
	private static GenericManager<RoomTable, Long> toManager = null;

	public static void initialize(SessionFactory sf) {
		mySessionFactory = sf;
		itmManager = new GenericManager<Item, Long>(Item.class, mySessionFactory);
		toManager = new GenericManager<RoomTable, Long>(RoomTable.class, mySessionFactory);
	}

	@Deprecated
	public static void testDBConnection() {
		try {
			if (connection == null) {
				// jdbc:postgresql://qdjjtnkv.db.elephantsql.com:5432/nqjahvby
				String host = "localhost";
				String database = "RAIBZ";
				String username = "raitest";
				String password = "raitest";
				String url = "jdbc:postgresql://" + host + "/" + database;
				String driverJDBC = "org.postgresql.Driver";
				Class.forName(driverJDBC);
				connection = DriverManager.getConnection(url, username, password);
				// line firing the class not found exception

			} else if (connection.isClosed()) {
				connection = null;
				// connect();
			}
		} catch (SQLException e) {
			e.printStackTrace(System.err);
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}

	public static void seedFoodClass(int count) {
		
		String name = "class";
		
		for (int i = 1; i <= count; i++) {
			FoodClass fc = new FoodClass();
			Set<OrderItem> items = new HashSet<OrderItem>();
			items.add(fc);
			fc.setName(name + i);

			Session session = mySessionFactory.openSession();
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				session.save(fc);
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
	
	public static void seedItems(int count) {

		GenericManager<Item, Long> itmManager = new GenericManager<>(Item.class, mySessionFactory);
		Random R = new Random();

		// creating random items
		for (int i = 1; i <= count; i++) {
			Item newItem = new Item();
			newItem.setAvailable(R.nextBoolean());
			newItem.setPrice(Math.floor(ThreadLocalRandom.current().nextDouble(0.1, 12) * 100) / 100);
			newItem.setName(idgen.nextSessionId());
			itmManager.add(newItem);
		}

		System.out.println(itmManager.getTotalCount() + " new Items created");
		System.out.println(itmManager.getAll());
		Item x = itmManager.find((long) 5, true);
		x.setName("new Item name");
		itmManager.update(x);
	}

	public static void seedTableOrders(int count) {

		OrderItem ot = new OrderItem();
		// ot.setItem(itmManager.find(new Long(5), true));
		ot.setComment("this is item with id 5 and qty 10");
		ot.setQuantity(10);

		TableOrder to = new TableOrder();
		Set<OrderItem> items = new HashSet<OrderItem>();
		items.add(ot);
		to.setOrderItemList(items);
		to.setStatus("PRONTO");

		Session session = mySessionFactory.openSession();
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

		/*
		 * //creating random items for (int i = 1; i <= count; i++) { TableOrder
		 * newItem = new TableOrder(); newItem.setStatus(idgen.nextSessionId());
		 * toManager.addTableOrder(newItem); }
		 * 
		 * System.out.println(toManager.getTotalCount() + " new Items created");
		 */
	}
	
	public static void seedTakeawayOrders(int count) {

		OrderItem ot = new OrderItem();
		ot.setComment("this is item with id 5 and qty 10");
		ot.setQuantity(10);

		TakeawayOrder to = new TakeawayOrder();
		Set<OrderItem> items = new HashSet<OrderItem>();
		items.add(ot);
		to.setOrderItemList(items);
		to.setStatus("PRONTO");
		to.setAddress("Piazza Domenicani, Design Faculty");
		to.setCost(3.50);

		Session session = mySessionFactory.openSession();
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

	public static void seedRoomTables(int count) {

		/*
		 * TabManager tableManager = new ItemManager(mySessionFactory);
		 * SessionIdentifierGenerator idgen= new SessionIdentifierGenerator();
		 * 
		 * //creating random Tables for (int i = 1; i <= count; i++) { RoomTable
		 * newTable = new RoomTable(); newItem.setAvailable(true);
		 * newItem.setPrice(Math.floor(ThreadLocalRandom.current().nextDouble(0.
		 * 1, 12) * 100) / 100); newItem.setName(idgen.nextSessionId());
		 * itmManager.addItem(newItem); }
		 * 
		 * System.out.println(itmManager.getTotalCount() + " new Items created"
		 * );
		 */
	}

}
