package wpb.manager;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;

import wpb.entity.AccessControlList;
import wpb.entity.Role;
import wpb.entity.User;
import wpb.entity.UserSession;
import wpb.enums.Section;

public class AcessControlListManager extends GenericManager<AccessControlList, Long> {

	public AcessControlListManager(SessionFactory sf) {
		super(AccessControlList.class, sf);

	}

	public AccessControlList getByRoleAndSection(Role role, Section section) {

		AccessControlList acl = new AccessControlList();
		acl.setSection(section);
		acl.setRole(role);

		return this.getByExample(acl);

	}

	public boolean isViewAllowed(Role role, Section section) {
		return this.getByRoleAndSection(role, section).hasViewPermission();
	}

	public boolean isInsertAllowed(Role role, Section section) {
		return this.getByRoleAndSection(role, section).hasInsertPermission();
	}

	public boolean isUpdateAllowed(Role role, Section section) {
		return this.getByRoleAndSection(role, section).hasUpdatePermission();
	}

	public boolean isDeleteAllowed(Role role, Section section) {
		return this.getByRoleAndSection(role, section).hasDeletePermission();
	}

	public boolean isViewAllowed(HttpSession session, Section section) {
		User user = ((UserSession) session.getAttribute("userSession")).getUser();
		return this.isViewAllowed(user.getRole(), section);
	}

	public boolean allowInsert(HttpSession session, Section section) {
		User user = ((UserSession) session.getAttribute("userSession")).getUser();
		return this.isInsertAllowed(user.getRole(), section);
	}

	public boolean allowUpdate(HttpSession session, Section section) {
		User user = ((UserSession) session.getAttribute("userSession")).getUser();
		return this.isUpdateAllowed(user.getRole(), section);
	}

	public boolean allowDelete(HttpSession session, Section section) {
		User user = ((UserSession) session.getAttribute("userSession")).getUser();
		return this.isDeleteAllowed(user.getRole(), section);
	}
}
