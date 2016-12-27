package wpb;

import javax.servlet.ServletContextEvent;  
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.hibernate.SessionFactory;

@WebListener
public class WebAppListener implements ServletContextListener {

	
	    @Override
	    public void contextInitialized(ServletContextEvent servletContextEvent) {
	        
	    	System.out.println("Start up!");
	    	SessionFactory mySessionFactory = HibernateUtil.getSessionJavaConfigFactory();
	        //SeedDB.initialize(mySessionFactory);
	        //SeedDB.seedRoomTables(30);
	        //SeedDB.seedFoodClass();
	        //SeedDB.seedItems(40);
	        //SeedDB.seedTableOrders(1);
	        //SeedDB.seedTakeawayOrders(10);
	    }

	    @Override
	    public void contextDestroyed(ServletContextEvent servletContextEvent) {
	        System.out.println("Shutting down!");
	    }
	}

