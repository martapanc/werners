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
	        SeedDB.setSessionFactory(mySessionFactory);
	        SeedDB.seedItems(200);

	    }

	    @Override
	    public void contextDestroyed(ServletContextEvent servletContextEvent) {
	        System.out.println("Shutting down!");
	    }
	}

