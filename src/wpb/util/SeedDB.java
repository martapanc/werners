package wpb.util;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import wpb.entity.AccessControlList;
import wpb.entity.FoodClass;
import wpb.entity.Item;
import wpb.entity.OrderItem;
import wpb.entity.Role;
import wpb.entity.RoomTable;
import wpb.entity.TableOrder;
import wpb.entity.TakeawayOrder;
import wpb.entity.User;
import wpb.enums.Section;
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
	private static GenericManager<TakeawayOrder,Long> taManager;
    private static Role roleWaiter, roleAdmin, roleDBManager, roleCustomer;
    private static GenericManager<User,Long> userManager;
    private static GenericManager<Role,Long> roleManager;
	private static GenericManager<AccessControlList, Long> aclManager;
	private static String[] foodClasses = {"Pizza", "Burger", "Chinese", "Salad", "Dessert", "Drink"};

	public static void main(String[] args) {
		SeedDB.initialize(HibernateUtil.getSessionJavaConfigFactory());
		SeedDB.seedRoles();
		SeedDB.seedUsers();
		SeedDB.seedACL();
        SeedDB.seedRoomTables(30);
        SeedDB.seedFoodClasses();
        SeedDB.seedItems();
        //SeedDB.seedTableOrders(1);
        //SeedDB.seedTakeawayOrders(10);
	}
	
	public static void initialize(SessionFactory sf) {
		mySessionFactory = sf;
		itmManager = new GenericManager<Item, Long>(Item.class, mySessionFactory);
		fcManager = new FoodClassManager(mySessionFactory);
		rtManager = new GenericManager<>(RoomTable.class, mySessionFactory);
		taManager = new GenericManager<TakeawayOrder, Long>(TakeawayOrder.class, mySessionFactory);
		userManager = new GenericManager<User, Long>(User.class, mySessionFactory);
		roleManager = new GenericManager<Role, Long>(Role.class, mySessionFactory);
		aclManager = new GenericManager<AccessControlList, Long>(AccessControlList.class, mySessionFactory);
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

	public static void seedRoles() {
		roleAdmin = saveRole("Administrator");
		roleWaiter = saveRole("Waiter");
		roleDBManager = saveRole("DBManager");
		roleCustomer = saveRole("Customer");
	}
    
	public static void seedUsers() {
        saveUser("admin@wpb.it", roleAdmin, "admin", "I am God");
        saveUser("marta@wpb.it", roleDBManager, "marta", "Marta Pancaldi");
        saveUser("werner@wpb.it", roleWaiter, "werner", "Werner Sperandio");
        saveUser("giulia@wpb.it", roleCustomer, "giulia", "Giulia");
    }
	
    private static Role saveRole(String role) {
        Role newRole = new Role();
        newRole.setRole(role);

        roleManager.add(newRole);

        return newRole;
    }

    private static void saveUser(String email, Role role, String password, String fullname) {
        User user = new User();
        user.setEmail(email);
        user.setRole(role);
        user.setFullName(fullname);
        user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));

        userManager.add(user);
    }
    
	public static void seedACL() {

		// List<Role> rolesList = roleManager.getAll();
		Section[] sections = Section.values();
		for (Section section : sections) {

			// admin has no restrictions
			saveACL(section, roleAdmin, true, true, true, true);

			// waiter has access only to scheduler
			if (section == Section.SCHEDULER) {
				saveACL(section, roleWaiter, true, true, true, true);
			} else {
				saveACL(section, roleWaiter, false, false, false, false);
			}

			// customer has access only to takeaway order and online reservation
			if (section == Section.CUSTOMER_TAKEAWAY || section == Section.CUSTOMER_TAKEAWAY ) {
				saveACL(section, roleCustomer, true, true, true, true);
			} else {
				saveACL(section, roleCustomer, false, false, false, false);
			}

			// DBManager has no restrictions except cancelling DB entries and modifying itself
			if (section == Section.ACL ) {
				saveACL(section, roleDBManager, false, false, false, false);
			} else {
				saveACL(section, roleDBManager, true, true, true, false);
			}
		}
	}		

    private static void saveItem(String name, FoodClass fc, double price, boolean available) {
    	Item itm = new Item();
    	itm.setName(name);
    	itm.setFoodClass(fc);
    	itm.setPrice(price);
    	itm.setAvailable(available);
    	
    	itmManager.add(itm);
    }
    
	private static void saveACL(Section section, Role role, boolean viewable, boolean insertable, boolean updateable, boolean deleteable) {
		
		AccessControlList acl = new AccessControlList();
		acl.setSection(section);
		acl.setRole(role);
		acl.setViewPermission(viewable);
		acl.setInsertPermission(insertable);
		acl.setUpdatePermission(updateable);
		acl.setDeletePermission(deleteable);

		aclManager.add(acl);
	}
   
}
