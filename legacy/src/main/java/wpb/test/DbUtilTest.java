package wpb.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.After;
import org.junit.Test;

/**
 * Simply tests for local database connection.
 *
 * @author Werner Sperandio
 */
public class DbUtilTest {

	private Connection connection = null;

	@Test
	public void testDBConnection() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		if (connection == null) {
			String host = "localhost";
			String database = "wpbdb";
			String username = "werner";
			String password = "}#rN8nB3";
			String url = "jdbc:mysql://" + host + "/" + database;
			String driverJDBC = "com.mysql.jdbc.Driver";
			
			Class.forName (driverJDBC).newInstance();
				connection = DriverManager.getConnection(url, username, password);
		}
	}
	
	@After
	public void closeConnection() throws SQLException{
		if(connection != null && connection.isClosed()==false)
				connection.close();
	}
	
}
