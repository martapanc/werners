package wpb.test;


import org.junit.Test;
import wpb.HibernateUtil;

public class HibernateUtilTest {

	@Test
	public void testGetSessionFactory() {
		HibernateUtil.getSessionFactory();
	}
	
	@Test
    public void testGetSessionAnnotationFactory() {
        HibernateUtil.getSessionAnnotationFactory();
    }
	
	@Test
	public void testGetSessionJavaConfigFactory() {
		HibernateUtil.getSessionJavaConfigFactory();
	}
}
