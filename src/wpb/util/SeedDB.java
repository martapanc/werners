package wpb.util;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import wpb.entity.FoodClass;
import wpb.entity.Item;
import wpb.entity.OrderItem;
import wpb.entity.RoomTable;
import wpb.entity.TableOrder;
import wpb.entity.TakeawayOrder;
import wpb.manager.GenericManager;

/**
 *
 * @author Werner Sperandio
 */
public class SeedDB {

	private static Connection connection = null;
	private static SessionFactory mySessionFactory = null;
	private static SessionIdentifierGenerator idgen = new SessionIdentifierGenerator();
	private static GenericManager<Item, Long> itmManager = null;
	private static GenericManager<RoomTable, Long> rtManager = null;
	private static GenericManager<FoodClass,Long> fcManager = null;
	private static GenericManager<TakeawayOrder,Long> taManager = null;

	public static void initialize(SessionFactory sf) {
		itmManager = new GenericManager<Item, Long>(Item.class, sf);
		fcManager = new GenericManager<FoodClass, Long>(FoodClass.class, sf);
		rtManager = new GenericManager<>(RoomTable.class, sf);
		taManager = new GenericManager<TakeawayOrder, Long>(TakeawayOrder.class, sf);
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

	public static void seedFoodClass() {
		
		String[] foodClasses = {"Pizza", "Burger", "Chinese", "Salad", "Dessert", "Drink"};
		
		for (String fcName : foodClasses) {
			FoodClass fc = new FoodClass();
			fc.setName(fcName);
			fcManager.add(fc);
		}
	}
	
	public static void seedItems(int count) {

		Random R = new Random();

		// creating random items
		for (int i = 1; i <= count; i++) {
			List<FoodClass> fcList = fcManager.getAll();
			FoodClass fc = fcList.get((int) Math.floor(Math.random()*fcList.size()));
			Item newItem = new Item();
			newItem.setFoodClass(fc);
			newItem.setAvailable(R.nextBoolean());
			newItem.setPrice(Math.floor(ThreadLocalRandom.current().nextDouble(0.1, 12) * 100) / 100);
			newItem.setName(idgen.nextSessionId());
			itmManager.add(newItem);
		}
	}
	
	public static void seedRoomTables(int count) {

		for (int i = 1; i <= count; i++) {
			RoomTable rt = new RoomTable();
			rt.setName("Table " + i);
			//rt.setNumber(i);
			rt.setRoom("Room " + (int) Math.floor(Math.random() * 3));
			rt.setCategory(RoomTable.CategoryType.highend);
			rt.setSeats(1 + (int) Math.floor(Math.random() * 11));
			rtManager.add(rt);
		}

	}

	public static void seedTableOrders(int count) {

		OrderItem ot = new OrderItem();
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
		taManager.add(to);
	}

}
