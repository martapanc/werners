package wpb.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;


/**
 * Hibernate Utility class with convenient methods to get Session Factory
 * object.
 *
 * @author Werner Sperandio
 */

public class HibernateUtil {

	private static Connection connection = null;
	
    //XML based configuration
    private static SessionFactory sessionFactory;

    //Annotation based configuration
    private static SessionFactory sessionAnnotationFactory;

    //Property based configuration
    private static SessionFactory sessionJavaConfigFactory;

    private static SessionFactory buildSessionFactory() {
        try {
            // Create the SessionFactory from hibernate.cfg.xml
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");
            System.out.println("Hibernate Configuration loaded");

            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            System.out.println("Hibernate serviceRegistry created");

            SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);

            return sessionFactory;
        }
        catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    private static SessionFactory buildSessionAnnotationFactory() {
        try {
            // Create the SessionFactory from hibernate.cfg.xml
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");
            System.out.println("Hibernate Annotation Configuration loaded");

            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            System.out.println("Hibernate Annotation serviceRegistry created");

            SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);

            return sessionFactory;
        }
        catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    private static SessionFactory buildSessionJavaConfigFactory() {
        try {
            Configuration configuration = new Configuration();

            //Create Properties, can be read from property files too
            Properties props = new Properties();
            
            //connection properties
            /*GearHost DB*/
            /*
            props.put("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
            props.put("hibernate.connection.url", "jdbc:mysql://mysql2.gear.host/wpbdb");
            props.put("hibernate.connection.username", "giuliaburgio");
            props.put("hibernate.connection.password", "NpoS&45af");
            */
            
            /*Marta's localhost*/
            
            props.put("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
            props.put("hibernate.connection.url", "jdbc:mysql://ec2-35-167-62-207.us-west-2.compute.amazonaws.com:3306/wpbdb");
            props.put("hibernate.connection.username", "root");
            props.put("hibernate.connection.password", "restaurant");
            
            
            /*Werner's localhost*/
            /*
            props.put("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
            props.put("hibernate.connection.url", "jdbc:mysql://localhost:3306/wpbdb");
            props.put("hibernate.connection.username", "root");
            props.put("hibernate.connection.password", "1234");
            */
            
            //advanced and debug settings
            props.put("hibernate.show_sql", "true");
            props.put("hibernate.current_session_context_class", "thread");
            props.put("hibernate.query.factory_class", "org.hibernate.hql.internal.classic.ClassicQueryTranslatorFactory");
            props.put("hibernate.hbm2ddl.auto", "update");
            
            //pool properties
            props.put("hibernate.c3p0.min_size", "5"); 
            props.put("hibernate.c3p0.max_size", "20");
            props.put("hibernate.c3p0.timeout","300"); 		
            props.put("hibernate.c3p0.max_statements","50"); 	
            props.put("hibernate.c3p0.idle_test_period", "3000");
            
            configuration.setProperties(props);
            
            //we can set mapping file or class with annotation
            //addClass(Employee1.class) will look for resource
            // com/journaldev/hibernate/model/Employee1.hbm.xml (not good)
            configuration.addAnnotatedClass(wpb.entity.Restaurant.class);
            configuration.addAnnotatedClass(wpb.entity.FoodClass.class);
            configuration.addAnnotatedClass(wpb.entity.Item.class);
            configuration.addAnnotatedClass(wpb.entity.OrderItem.class);
            configuration.addAnnotatedClass(wpb.entity.TakeawayOrder.class);
            configuration.addAnnotatedClass(wpb.entity.TableOrder.class);
            configuration.addAnnotatedClass(wpb.entity.RoomTable.class);
            configuration.addAnnotatedClass(wpb.entity.Reservation.class);
            configuration.addAnnotatedClass(wpb.entity.User.class);
            configuration.addAnnotatedClass(wpb.entity.Role.class);

            
            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            System.out.println("Hibernate Java Config serviceRegistry created");

            SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);

            return sessionFactory;
        }
        catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    /**
     * creates/gets a SessionFactory from XML based configuration
     * @return	a SessionFactory object
     */
    public static SessionFactory getSessionFactory() {
        if(sessionFactory == null) sessionFactory = buildSessionFactory();
        return sessionFactory;
    }

    /**
     * creates/gets a SessionFactory from annotation based configuration
     * @return a SessionFactory object
     */
    public static SessionFactory getSessionAnnotationFactory() {
        if(sessionAnnotationFactory == null) sessionAnnotationFactory = buildSessionAnnotationFactory();
        return sessionAnnotationFactory;
    }

    /**
     * creates/gets a SessionFactory from property based configuration
     * @return a SessionFactory object
     */
    public static SessionFactory getSessionJavaConfigFactory() {
        if(sessionJavaConfigFactory == null) sessionJavaConfigFactory = buildSessionJavaConfigFactory();
        return sessionJavaConfigFactory;
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

}
