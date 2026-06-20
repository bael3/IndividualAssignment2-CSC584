🧑‍💻 PROFILE MANAGEMENT SYSTEM

CSC584 - Enterprise Programming
Individual Assignment 2


1. STUDENT INFORMATION

Name        : Balqis binti Abd Aziz

Student ID  : 2024267904



2. PROJECT DESCRIPTION

The Profile Management System is a Java web application that enhances a simple Profile Application from Assignment 1 into a full featured system for storing and managing student profile records using a database.

The application demonstrates the integration of HTML Forms, Java Servlets, JavaBeans, JDBC, and JSP with a relational database, following the MVC (Model-View-Controller) architecture:

    ProfileBean        - Model
    JSP Pages          - View
    ProfileServlet     - Controller

When a user submits the profile form, the servlet captures the data, wraps it in a ProfileBean object, and saves it to the Profile table in the StudentProfilesDB database using JDBC. Users can then view, search, edit, and delete profile records through a consistent, styled interface.


3. IMPLEMENTED FEATURES

✅ 1. Create Profile
   Submit student details through an HTML form. Data is validated and saved to the database using a JDBC insert statement.

✅ 2. View All Profiles
   Displays all saved profile records in a clean card and table layout.

✅ 3. Search Profile
   Search records by Student ID or Name.

✅ 4. Edit Profile
   Update an existing profile's information.

✅ 5. Delete Profile
   Remove a profile record from the database.

✅ 6. Consistent UI
   Custom CSS styling using a pink and mistyrose theme across all pages, including a dedicated landing page and a floating home navigation button.


4. TECHNOLOGY STACK

    ☕ Java Servlets, JSP, and JavaBeans
    🔌 JDBC
    🗄️ Apache Derby (Java DB)
    🎨 HTML5 and CSS3
    🛠️ NetBeans IDE


5. HOW TO RUN

    1. Clone this repository.
    2. Open the project in NetBeans.
    3. Start the Java DB (Derby) Network Server.
    4. Run database.sql to create the StudentProfilesDB database and the Profile table.
    5. Check that the connection settings in DBConnection.java match your local database credentials.
    6. Clean and build the project.
    7. Deploy and run the project on the application server (e.g. GlassFish).
    8. Open index.html in the browser to get started.
