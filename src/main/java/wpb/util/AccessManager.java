package wpb.util;

import java.util.HashMap;
import java.util.HashSet;

import javax.servlet.http.HttpSession;

import wpb.entity.Role.RoleEnum;
import wpb.entity.User;
import wpb.entity.UserSession;
import wpb.enums.Section;

public class AccessManager {

	private HashMap<RoleEnum, HashSet<Section>> permissions = new HashMap<>();

	public AccessManager() {
		
		// initialize permissions
		HashSet<Section> adminSections = new HashSet<Section>();
		adminSections.add(Section.TABLES);
		adminSections.add(Section.SCHEDULER);
		adminSections.add(Section.DASHBOARD);
		
		HashSet<Section> customerSections = new HashSet<Section>();
		customerSections.add(Section.CUSTOMER);
		
		HashSet<Section> waiterSections = new HashSet<Section>();
		waiterSections.add(Section.SCHEDULER);
		waiterSections.add(Section.DASHBOARD);
		
		HashSet<Section> dbManagerSections = new HashSet<Section>();
		dbManagerSections.add(Section.TABLES);
		dbManagerSections.add(Section.DASHBOARD);

		permissions.put(RoleEnum.ADMIN, adminSections);
		permissions.put(RoleEnum.CUSTOMER, customerSections);
		permissions.put(RoleEnum.WAITER, waiterSections);
		permissions.put(RoleEnum.DBMANAGER, dbManagerSections);
		
		HashSet<Section> overlordSections = new HashSet<Section>();
		overlordSections.add(Section.TABLES);
		overlordSections.add(Section.SCHEDULER);
		overlordSections.add(Section.CUSTOMER);
		overlordSections.add(Section.CALENDAR);
		overlordSections.add(Section.DASHBOARD);
		permissions.put(RoleEnum.OVERLORD, overlordSections);

	}

	public boolean isAllowed(HttpSession session, Section section) {

		User user = ((UserSession) session.getAttribute("userSession")).getUser();
		RoleEnum roleName = user.getRole().getName();
		return permissions.get(roleName).contains(section);

	}

}
