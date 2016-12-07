package wpb;

/*
 * Hibernate, Relational Persistence for Idiomatic Java
 *
 * Copyright (c) 2010, Red Hat Inc. or third-party contributors as
 * indicated by the @author tags or express copyright attribution
 * statements applied by the authors.  All third-party contributions are
 * distributed under license by Red Hat Inc.
 *
 * This copyrighted material is made available to anyone wishing to use, modify,
 * copy, or redistribute it subject to the terms and conditions of the GNU
 * Lesser General Public License, as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License
 * for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this distribution; if not, write to:
 * Free Software Foundation, Inc.
 * 51 Franklin Street, Fifth Floor
 * Boston, MA  02110-1301  USA
 */

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.*;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import wpb.item.*;

import junit.framework.TestCase;

/**
 * Simply tests for the database connection.
 *
 * @author Werner Sperandio
 */
public class HibernateSessionTest extends TestCase {
	
	private SessionFactory sessionFactory;
	private ServiceRegistry serviceRegistry;

	protected void setUp() throws Exception {
		// A SessionFactory is set up once for an application!
        try {
            Configuration configuration = new Configuration().configure();
            configuration.addAnnotatedClass(wpb.item.Item.class);
            serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        } catch (Throwable ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
	

    //@Override
    protected void tearDown() throws Exception {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }

    public void testBasicUsage() {
        

        // create a couple of events...
        Session session = sessionFactory.openSession();
        
    	for(int a = 1;a<=5000; a++){
            Item i = new Item();
            i.setAvailable(true);
            i.setPrice(1.2);
            i.setName("Coca Cola");
            session.beginTransaction();
            session.save(i);
            session.getTransaction().commit();
        	}
        session.close();

        // now lets pull events from the database and list them
        session = sessionFactory.openSession();
        session.beginTransaction();
        List result = session.createQuery("from Item").getResultList();
        for (Item it : (List<Item>) result) {
            System.out.println("***Item inserted:\n" + it);
        }
        session.getTransaction().commit();
        session.close();
    } 
}
