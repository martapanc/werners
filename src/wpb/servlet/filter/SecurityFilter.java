package wpb.servlet.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "SecurityFilter", urlPatterns = {"/*"})
public class SecurityFilter implements Filter {

	private static final Set<String> ALLOWED_PATHS = Collections.unmodifiableSet(new HashSet<>(
	        Arrays.asList("/register", "", "/login", "/logout", "/registerForm.jsp", "/homepage.html", "/item", "/reservation",
	        		"/pages/home/table-reservation.jsp", "/pages/home/reservation-invoice.jsp","/pages/home/takeaway-order.jsp")));
	
	private static final String ALLOWED_REGEX = ".*(css|jpg|png|gif|js)$|/(bootstrap|dist|plugins)/.*";
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws ServletException, IOException {

		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session = request.getSession(false);

		System.out.println("[SecurityFilter] ServletPath : " + request.getServletPath());

		String path = request.getRequestURI().substring(request.getContextPath().length()).replaceAll("[/]+$", "");
		System.out.println("[SecurityFilter] ServletPath : " + request.getServletPath());
		System.out.println("[SecurityFilter] path : " + path);
		boolean loggedIn = (session != null && session.getAttribute("userSession") != null);
		boolean allowedPath = isAllowedPath(path);
		
		if (loggedIn || allowedPath) {
			
			//System.out.println("[SecurityFilter] session : " + session);
			//System.out.println("[SecurityFilter] userSession : " + session.getAttribute("userSession"));
			chain.doFilter(req, resp);
		} else {
			//request.setAttribute("message", "Please login first!");
			request.getRequestDispatcher("/loginForm.jsp").forward(request, response);
		}
		
		/*
		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession(false);
        
        String path = request.getRequestURI().substring(request.getContextPath().length()).replaceAll("[/]+$", "");
        
        System.out.println("[SecurityFilter] ServletPath : " + request.getServletPath());
        if(!isAllowedPath(path)) {
            System.out.println("[SecurityFilter] session : " + session);
            if(session != null) {
                UserSession userSession = (UserSession) session.getAttribute("userSession");

                if(userSession == null) {
                    System.out.println("[SecurityFilter] userSession : " + userSession);
                    //response.sendRedirect("/loginForm.jsp?message=Please login first!");
                    request.setAttribute("message", "Please login first!");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                    return;
                }
            } else {
                request.setAttribute("message", "Please login!");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }
        }

        chain.doFilter(req, resp);*/
    }
	
    private static boolean isAllowedPath(String path){
    	return (path.matches(ALLOWED_REGEX) || ALLOWED_PATHS.contains(path));
    }

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}
}
