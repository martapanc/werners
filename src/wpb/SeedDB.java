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
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import wpb.item.Item;
import wpb.item.ItemManager;
import wpb.reservation.Reservation;
import wpb.roomtable.RoomTable;
import wpb.roomtable.RoomTable.CategoryType;

/**
 *
 * @author Werner
 */
public class SeedDB {

	private static Connection connection = null;
	private static SessionFactory mySessionFactory = null;
	
	public static void setSessionFactory(SessionFactory sf) {
		mySessionFactory = sf;
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

	public static void seedItems(int count){
		
		ItemManager itmManager = new ItemManager(mySessionFactory);
		SessionIdentifierGenerator idgen= new SessionIdentifierGenerator();
		
		//creating random items
		for (int i = 1; i <= count; i++) {
			Item newItem = new Item();
			newItem.setAvailable(true);
			newItem.setPrice(Math.floor(ThreadLocalRandom.current().nextDouble(0.1, 12) * 100) / 100);
			newItem.setName(idgen.nextSessionId());
			itmManager.addItem(newItem);
		}
		
		System.out.println(itmManager.getTotalCount() + " new Items created");
	}
	
	public static void seedTables(int count){
		
		/*
		TabManager tableManager = new ItemManager(mySessionFactory);
		SessionIdentifierGenerator idgen= new SessionIdentifierGenerator();
		
		//creating random Tables
		for (int i = 1; i <= count; i++) {
			RoomTable newTable = new RoomTable();
			newItem.setAvailable(true);
			newItem.setPrice(Math.floor(ThreadLocalRandom.current().nextDouble(0.1, 12) * 100) / 100);
			newItem.setName(idgen.nextSessionId());
			itmManager.addItem(newItem);
		}
		
		System.out.println(itmManager.getTotalCount() + " new Items created");
		*/
	}
	
}
