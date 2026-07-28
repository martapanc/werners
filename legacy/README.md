# Werner's Panini & Burgers — original Java project (2016–17)

This is the project as it was originally submitted for "Internet & Mobile
Services" at [UniBZ](https://www.unibz.it/en/faculties/computer-science/bachelor-computer-science/):
Java servlets, JSP, Hibernate and MySQL, deployed on Tomcat.

It is kept here unchanged for reference. The modern rebuild lives at the repo
root — see [`../README.md`](../README.md).

Team members:

- **Werner** S.
- M. **Pan**caldi
- G. **Burg**io

## Setup

**JDK**: Java 11

**IDE**

- The app was originally developed in Eclipse, but was also tested successfully
  in IntelliJ IDEA (CE or Ultimate), which we recommend.
- Open this `legacy/` directory as the project root in IntelliJ.
- Run `mvn clean install` to set up the dependencies.

**Database**

- A local MySQL instance must be running, with a database named `wpbdb`.
- Update the access credentials in `src/main/java/wpb/util/HibernateUtil.java`
  (~ line 85).
- Running `SeedDB.java` creates the tables and inserts sample data.
- Historical dumps are in `WebContent/WEB-INF/sqldump/`.

**Local server**

- Make sure Tomcat 8 is installed.
- Run `mvn compile war:exploded`.
- Create a new Tomcat local server configuration.
- In the Deployment tab, choose "Add Artifact" → `restaurantProject war:exploded`.
- Change the Application Context to `/`.
- Save the configuration and hit 'Run Tomcat'.
