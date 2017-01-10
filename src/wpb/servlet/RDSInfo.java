package wpb.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RDSInfo", urlPatterns = "/rdsinfo", loadOnStartup = 1)
public class RDSInfo extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * RDS_HOSTNAME – The hostname of the DB instance.
		 * 
		 * RDS_DB_NAME – The database name, ebdb.
		 * 
		 * RDS_USERNAME – The username that you configured for your database.
		 * 
		 * RDS_PASSWORD – The password that you configured for your database.
		 * 
		 * RDS_PORT – The port on which the DB instance accepts connections. The
		 * default value varies between DB engines.
		 */
		
		final String hostname = System.getProperty("RDS_HOSTNAME");
		final String dbname = System.getProperty("RDS_DB_NAME");
		final String username = System.getProperty("RDS_USERNAME");
		final String pw = System.getProperty("RDS_PASSWORD");
		final String port = System.getProperty("RDS_PORT");
		final String java = System.getProperty("RDS_PORT");
		
		// Set response content type
		response.setContentType("text/html");

		// Actual logic goes here.
		PrintWriter out = response.getWriter();
		out.println("<h1>" + hostname + "</h1>");
		out.println("<h1>" + dbname + "</h1>");
		out.println("<h1>" + username + "</h1>");
		out.println("<h1>" + pw + "</h1>");
		out.println("<h1>" + port + "</h1>");
		out.println("<h1>" + System.getProperties() + "</h1>");
	}

}
