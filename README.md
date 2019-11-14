# Werner's Panini & Burgers 

Restaurant Webapp for taking online reservations and takeaway orders, created as a final project for the course "Internet & Mobile Services" @ [UniBZ](https://www.unibz.it/en/faculties/computer-science/bachelor-computer-science/).

Team members:
- Werner Sperandio
- Marta Pancaldi
- Giulia Burgio

## Setup
**JDK**: Java 11

**IDE**:

- The app was originally developed in Eclipse, but was recently tested successfully in IntelliJ IDEA (CE or Ultimate), which we recommend.
- Clone the project and open it in IntelliJ
- Run `mvn clean install` to setup the dependencies 

**Database**: 

- To run the app locally, a local instance of MySQL must be running, with a database named `wpbdb`
- update the access credentials in class `src/wpb/util/HibernateUtil.java` ~ line 85
- Running the class `SeedDB.java` will setup the database with the tables needed for the webapp and will insert some sample data.

**Local Server**:

- Make sure Tomcat 8 is installed 
- 