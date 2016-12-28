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

import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import wpb.entity.*;
import wpb.manager.GenericManager;

/**
 *
 * @author Werner Sperandio
 */
public class SeedDB {

	private static SessionFactory mySessionFactory = null;
	private static SessionIdentifierGenerator idgen = new SessionIdentifierGenerator();
	private static GenericManager<Item, Long> itmManager;
	private static GenericManager<RoomTable, Long> rtManager;
	private static GenericManager<FoodClass,Long> fcManager;
	private static GenericManager<TakeawayOrder,Long> taManager;
    private static UserType userTypeSA, userTypeAdmin, userTypeDE;
    private static GenericManager<User,Long> userManager;
    private static GenericManager<UserType,Long> userTypeManager;
    //private static final AccessControlListManager accessControlListManager;

	public static void main(String[] args) {
		SeedDB.initialize(HibernateUtil.getSessionJavaConfigFactory());
		SeedDB.seedUserTypes();
		SeedDB.seedUsers();
        SeedDB.seedRoomTables(30);
        SeedDB.seedFoodClasses();
        SeedDB.seedItems(40);
        SeedDB.seedTableOrders(1);
        SeedDB.seedTakeawayOrders(10);
	}
	
	public static void initialize(SessionFactory sf) {
		mySessionFactory = sf;
		itmManager = new GenericManager<Item, Long>(Item.class, mySessionFactory);
		fcManager = new GenericManager<FoodClass, Long>(FoodClass.class, mySessionFactory);
		rtManager = new GenericManager<>(RoomTable.class, mySessionFactory);
		taManager = new GenericManager<TakeawayOrder, Long>(TakeawayOrder.class, mySessionFactory);
		userManager = new GenericManager<User, Long>(User.class, mySessionFactory);
		userTypeManager = new GenericManager<UserType, Long>(UserType.class, mySessionFactory);
	}

	public static void seedFoodClasses() {
		
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

	public static void seedUserTypes() {
		userTypeSA = saveUserType("SuperAdministrator");
		userTypeAdmin = saveUserType("Administrator");
		userTypeDE = saveUserType("DataEntry");
	}
    
	public static void seedUsers() {
        saveUser("admin", userTypeSA, "admin");
        saveUser("marta", userTypeAdmin, "marta");
        saveUser("werner", userTypeDE, "werner");
        saveUser("giulia", userTypeAdmin, "giulia");
    }
	
    private static UserType saveUserType(String type) {
        UserType userType = new UserType();
        userType.setType(type);

        userTypeManager.add(userType);

        return userType;
    }

    private static void saveUser(String email, UserType userType, String password) {
        User user = new User();
        user.setEmail(email);
        user.setUserType(userType);
        user.setPassword(DigestUtils.md5Hex(password));

        userManager.add(user);
    }
   
}
