package wpb;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.archive.scan.spi.ClassDescriptor.Categorization;

import wpb.item.Item;
import wpb.orderitem.OrderItem;
import wpb.roomtable.RoomTable;
import wpb.roomtable.RoomTable.CategoryType;

/**
 *
 * @author Werner
 */
public class SeedDB {

    private static Connection connection = null;

    public static void testDBConnection() {
        try {
            if (connection == null) {
                //jdbc:postgresql://qdjjtnkv.db.elephantsql.com:5432/nqjahvby
                String host = "localhost";
                String database = "RAIBZ";
                String username = "raitest";
                String password = "raitest";
                String url = "jdbc:postgresql://" + host + "/" + database;
                String driverJDBC = "org.postgresql.Driver";
                Class.forName(driverJDBC);
                connection = DriverManager.getConnection(url, username,
                        password); //line firing the class not found exception

            } else if (connection.isClosed()) {
                connection = null;
                //connect();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }

    
    public static void main(String[] args) {
    	
    SessionFactory sessionFactory = HibernateUtil.getSessionJavaConfigFactory();
    
    //create a new sesson
    Session session = sessionFactory.openSession();
    
    Item newItem = new Item();
    newItem.setAvailable(true);
    newItem.setPrice(1.2);
    newItem.setName("Coca Cola");
    session.beginTransaction();
    session.save(newItem);
    session.getTransaction().commit();
    
    RoomTable vipTable = new RoomTable();
    vipTable.setCategory(CategoryType.highend);
    vipTable.setSeats(5);
    vipTable.setRoom("left door behind picture");
    vipTable.setNumber(1);
    session.beginTransaction();
    session.save(vipTable);
    session.getTransaction().commit();
    
    }
    
    /*
    public static void main(String[] args) throws FileNotFoundException {

        HibernateUtil.createSessionFactory();
        DepartmentManager dm = new DepartmentManager(HibernateUtil.getSessionFactory());
        EmployeeManager em = new EmployeeManager(HibernateUtil.getSessionFactory());
        RoleManager rm = new RoleManager(HibernateUtil.getSessionFactory());

        Employee e = new Employee();
//        e.setGender(Employee.GenderType.female);
//        em.updateEmployee("p883050", e);

        //em.updateEmployeeGender(pMatricola, GenderType.male);
        Department d1 = new Department("PRODTV", "produzione televisiva");
        Department d2 = new Department("PRODRF", "produzione radiofonica");
        Department d3 = new Department("ADMIN", "amministrazione");
        Department d4 = new Department("TGRBZ", "redazione TGR Bolzano");
        Department d5 = new Department("TGTBZ", "redazione TGR Bolzano");
        Department d6 = new Department("TGLBZ", "redazione TGR Bolzano");
        Department d7 = new Department("MAINTENANCE", "reparto manutenzione");
        Department d8 = new Department("EST1", "esterna 1");
        
        dm.addDepartment(d1);
        dm.addDepartment(d2);
        dm.addDepartment(d3);
        dm.addDepartment(d4);
        dm.addDepartment(d5);
        dm.addDepartment(d6);
        dm.addDepartment(d7);
        dm.addDepartment(d8);
        
        Role r1 = new Role("Redattore", "semplice giornalista");
        Role r2 = new Role("caporedattore", "president");
        Role r3 = new Role("vicecaporedattore", "vice president");
        Role r4 = new Role("tecnico", "soldato semplice");
        Role r5 = new Role("capotecnico", "tecnico figo");
        Role r6 = new Role("capoproduzione", "capo della produzione");
        
        rm.addRole(r1);
        rm.addRole(r2);
        rm.addRole(r3);
        rm.addRole(r4);
        rm.addRole(r5);
        rm.addRole(r6);
        

//        Employee e = null;
//        Scanner sc = new Scanner(new FileReader("D://test.txt"));
//        while (sc.hasNextLine()) {
//            System.out.println(sc.next());
//            e = new Employee();
//            e.setMatriculationNumber("R883050");
//            e.setFirstName("Ennio");
//            e.setLastName("Morricone");
//            e.setGender(Employee.GenderType.female);
//            e.setEmploymentDate(parseDate("2014-05-01"));
//            e.setDepartment(d1);
//        }
        
        Map m = new HashMap<>();
        m.put("matriculationNumber","p883050");
        m.put("active", true);
        m.put("firstName", "Werner");
        m.put("lastName", "Sperandio");
        m.put("gender",Employee.GenderType.male);
        m.put("email", "werner.sperandio@rai.it");
        m.put("birthDate", HibernateUtil.parseDate("2014-01-01"));
        m.put("employmentDate", HibernateUtil.parseDate("2014-01-01"));
        m.put("department", d1);
        m.put("role",r1);

        Random randomGenerator = new Random();
        for (int idx = 1; idx <= 50; ++idx) {
            int randomInt = randomGenerator.nextInt(999998);
            String mat = String.format("p%06d", randomInt);
            m.replace("matriculationNumber", mat);
            System.out.println(randomInt);
            e = new Employee(m);
            em.addEmployee(e);
        }

        System.out.println(em.listEmployee());

    }*/
}
