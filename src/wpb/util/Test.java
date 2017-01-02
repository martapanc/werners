package wpb.util;

import wpb.entity.FoodClass;
import wpb.entity.User;
import wpb.manager.FoodClassManager;
import wpb.manager.UserManager;

public class Test {

	public static void main(String[] args) {
		
		FoodClassManager fcManager = new FoodClassManager(HibernateUtil.getSessionJavaConfigFactory());
		FoodClass c = fcManager.getByName("Pizza");
		
		System.out.println(c);
		
		UserManager userManager = new UserManager(HibernateUtil.getSessionJavaConfigFactory());
		User user = userManager.getByEmailPassword("marta@wpb.it", "marta");
		
		System.out.println(user);
	}

}
