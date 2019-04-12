package wpb.util;

import java.sql.Timestamp;
import java.util.*;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.type.EnumType;

import wpb.entity.FoodClass;
import wpb.entity.Item;
import wpb.entity.OrderItem;
import wpb.entity.Reservation;
import wpb.entity.Role;
import wpb.entity.Role.RoleEnum;
import wpb.entity.RoomTable;
import wpb.entity.RoomTable.CategoryType;
import wpb.entity.TableOrder;
import wpb.entity.TakeawayOrder;
import wpb.entity.User;
import wpb.manager.FoodClassManager;
import wpb.manager.GenericManager;

/**
 *
 * @author Werner Sperandio
 */
public class SeedDB {

	private static SessionFactory mySessionFactory = null;
	private static GenericManager<Item, Long> itmManager;
	private static GenericManager<RoomTable, Long> rtManager;
	private static FoodClassManager fcManager;
	private static GenericManager<TakeawayOrder, Long> taManager;
	private static Role roleWaiter, roleAdmin, roleDBManager, roleCustomer, roleOverlord;
	private static GenericManager<User, Long> userManager;
	private static GenericManager<Role, Long> roleManager;
	private static GenericManager<Reservation, Long> resManager;
	private static String[] foodClasses = { "Pizza", "Burger", "Chinese", "Salad", "Dessert", "Drink" };

	private static SessionFactory factory;

	public static void main(String[] args) {

		try {
			factory = new Configuration ().configure ().buildSessionFactory ();
		} catch (Throwable ex) {
			System.err.println ( "Failed to create sessionFactory object." + ex );
			throw new ExceptionInInitializerError ( ex );
		}

		listBooks ();

//		SeedDB.initialize(HibernateUtil.getSessionFactory ());
//		SeedDB.seedRoles();
//		SeedDB.seedUsers();
//		SeedDB.seedRoomTables(30);
//		SeedDB.seedFoodClasses();
//		SeedDB.seedItems();
//		SeedDB.seedTableOrders(1);
//		SeedDB.seedTakeawayOrders(10);
//
//		SeedDB.seedReservation(10);
	}


	public static void listBooks() {
		Transaction tx = null;

		try (Session session = factory.openSession ()) {
			tx = session.beginTransaction ();
			List books = session.createQuery ( "FROM Item " ).list ();
			for (Object b : books) {
				Item book = (Item) b;
				System.out.println ( book );
			}
			tx.commit ();
		} catch (HibernateException e) {
			if (tx != null) tx.rollback ();
			e.printStackTrace ();
		}
	}

	public static void initialize(SessionFactory sf) {
		mySessionFactory = sf;
		itmManager = new GenericManager<Item, Long>(Item.class, mySessionFactory);
		fcManager = new FoodClassManager(mySessionFactory);
		rtManager = new GenericManager<>(RoomTable.class, mySessionFactory);
		taManager = new GenericManager<TakeawayOrder, Long>(TakeawayOrder.class, mySessionFactory);
		userManager = new GenericManager<User, Long>(User.class, mySessionFactory);
		roleManager = new GenericManager<Role, Long>(Role.class, mySessionFactory);
		resManager = new GenericManager<Reservation, Long>(Reservation.class, mySessionFactory);
	}

	public static void seedFoodClasses() {

		for (String fcName : foodClasses) {
			FoodClass fc = new FoodClass();
			fc.setName(fcName);
			fcManager.add(fc);
		}
	}

	public static void seedItems() {

		saveItem("Margherita", fcManager.getByName(foodClasses[0]), 5.5, true);
		saveItem("Marescialla", fcManager.getByName(foodClasses[0]), 5.5, true);
		saveItem("Quattro stagioni", fcManager.getByName(foodClasses[0]), 7, true);
		saveItem("Tonno Cipolla", fcManager.getByName(foodClasses[0]), 6, false);
		saveItem("San Daniele", fcManager.getByName(foodClasses[0]), 9, true);
		saveItem("Primavera", fcManager.getByName(foodClasses[0]), 6.7, false);
		saveItem("Capricciosa", fcManager.getByName(foodClasses[0]), 7.5, true);

		saveItem("Hot Dog", fcManager.getByName(foodClasses[1]), 3.5, true);
		saveItem("Chicken Burger", fcManager.getByName(foodClasses[1]), 3.7, true);
		saveItem("Double Cheeseburger", fcManager.getByName(foodClasses[1]), 5.5, false);
		saveItem("McChicken", fcManager.getByName(foodClasses[1]), 4.8, true);
		saveItem("Burger Royal", fcManager.getByName(foodClasses[1]), 5.5, true);
		saveItem("Hawaiian Toast", fcManager.getByName(foodClasses[1]), 5.0, false);
		saveItem("BauernToast", fcManager.getByName(foodClasses[1]), 4.3, true);

		saveItem("Chinese noodles", fcManager.getByName(foodClasses[2]), 5.5, true);
		saveItem("Zhajiangmian", fcManager.getByName(foodClasses[2]), 6.7, false);
		saveItem("Fried Rice", fcManager.getByName(foodClasses[2]), 3.5, false);
		saveItem("Kung Pao chicken", fcManager.getByName(foodClasses[2]), 7.8, false);
		saveItem("Wonton", fcManager.getByName(foodClasses[2]), 6, true);
		saveItem("Zongzi", fcManager.getByName(foodClasses[2]), 6.7, false);
		saveItem("Peking Duck", fcManager.getByName(foodClasses[2]), 8, true);

		saveItem("Cesar Salad", fcManager.getByName(foodClasses[3]), 4.5, true);
		saveItem("Chicken Salad", fcManager.getByName(foodClasses[3]), 6.7, true);
		saveItem("Russian Salad", fcManager.getByName(foodClasses[3]), 5.5, false);
		saveItem("Tomato Salad", fcManager.getByName(foodClasses[3]), 6.8, false);
		saveItem("Potatoe Salad", fcManager.getByName(foodClasses[3]), 4.4, true);
		saveItem("Fresh Salad", fcManager.getByName(foodClasses[3]), 6.7, true);
		saveItem("Rice Salad", fcManager.getByName(foodClasses[3]), 4.2, false);

		saveItem("Brownies", fcManager.getByName(foodClasses[4]), 4.5, true);
		saveItem("Ice Cream", fcManager.getByName(foodClasses[4]), 6.7, true);
		saveItem("Surprise", fcManager.getByName(foodClasses[4]), 12, false);
		saveItem("Mousse", fcManager.getByName(foodClasses[4]), 6.8, false);
		saveItem("Sacher", fcManager.getByName(foodClasses[4]), 4.4, true);
		saveItem("Marshmallows", fcManager.getByName(foodClasses[4]), 6.7, true);
		saveItem("Affogato", fcManager.getByName(foodClasses[4]), 4.2, false);

		saveItem("Green Tea", fcManager.getByName(foodClasses[5]), 1.5, true);
		saveItem("Lemon Soda", fcManager.getByName(foodClasses[5]), 2.7, true);
		saveItem("Fizzy Water", fcManager.getByName(foodClasses[5]), 1.5, false);
		saveItem("Beer", fcManager.getByName(foodClasses[5]), 2.8, false);
		saveItem("Red Wine", fcManager.getByName(foodClasses[5]), 4.4, true);
		saveItem("White Wine", fcManager.getByName(foodClasses[5]), 3.7, true);
		saveItem("Sprite", fcManager.getByName(foodClasses[5]), 1.2, true);

	}

	public static void seedRoomTables(int count) {

		for (int i = 1; i <= count; i++) {
			RoomTable rt = new RoomTable();
			rt.setName("Table " + i);
			// rt.setNumber(i);
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
		
		OrderItem ot2 = new OrderItem();
		ot2.setComment("sample comment");
		ot2.setQuantity(7);

		TakeawayOrder to = new TakeawayOrder();
		Set<OrderItem> items = new HashSet<OrderItem>();
		items.add(ot);
		items.add(ot2);
		to.setOrderItemList(items);
		to.setStatus("PRONTO");
		to.setAddress("Piazza Domenicani, Design Faculty");
		to.setCost(3.50);
		taManager.add(to);
		
		TakeawayOrder to2 = new TakeawayOrder();
		to2.setOrderItemList(items);
		to2.setStatus("pronto");
		to2.setAddress("221B Baker St");
		to2.setCost(17.90);
		taManager.add(to2);
	}

	public static void seedReservation(int count) {

		for (int i = 0; i < count; i++) {
			Reservation res = new Reservation();
			Date date = new Date();

			res.setStartDate(new Timestamp(date.getTime()));
			res.setEndDate(new Timestamp(date.getTime() + 3600 * 1000));
			res.setUser(userManager.get((long) 6, false));
			
			//Set<RoomTable> tableList = new HashSet<RoomTable>();
			//tableList.add(rtManager.get((long) 12, false));
			//res.setTableList(tableList);
			RoomTable rt = new RoomTable();
			rt.setName("Reservation test");
			rt.setRoom("1");
			rt.setSeats(3);
			rt.setCategory(CategoryType.highend);
			res.setRoomTable(rtManager.get((long) 12, false));
			res.setComment("I'm a comment");

			resManager.add(res);
		}
	}

	public static void seedRoles() {
		roleAdmin = saveRole(Role.RoleEnum.ADMIN);
		roleWaiter = saveRole(Role.RoleEnum.WAITER);
		roleDBManager = saveRole(Role.RoleEnum.DBMANAGER);
		roleCustomer = saveRole(Role.RoleEnum.CUSTOMER);

		roleOverlord = saveRole(Role.RoleEnum.OVERLORD);
	}

	public static void seedUsers() {
		saveUser("overlord@wpb.it", roleOverlord, "overlord", "Chuck Norris");
		saveUser("admin@wpb.it", roleAdmin, "admin", "I am God");
		saveUser("marta@wpb.it", roleDBManager, "marta", "Marta Pancaldi");
		saveUser("werner@wpb.it", roleWaiter, "werner", "Werner Sperandio");
		saveUser("giulia@wpb.it", roleCustomer, "giulia", "Giulia");

	}

	private static Role saveRole(RoleEnum name) {
		Role role = new Role();
		role.setName(name);
		roleManager.add(role);
		return role;
	}

	private static void saveUser(String email, Role role, String password, String fullname) {
		User user = new User();
		user.setEmail(email);
		user.setRole(role);
		user.setFullName(fullname);
		user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
		
		//create Timestamp
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		Timestamp ts = new Timestamp(cal.getTime().getTime());
		
		user.setCreationDate(ts);
		user.setAvatar("dist/img/gusteau160x160.jpg");
		userManager.add(user);
	}

	private static void saveItem(String name, FoodClass fc, double price, boolean available) {
		Item itm = new Item();
		itm.setName(name);
		itm.setFoodClass(fc);
		itm.setPrice(price);
		itm.setAvailable(available);

		itmManager.add(itm);
	}

}
