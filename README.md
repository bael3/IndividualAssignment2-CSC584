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

6. SCREENSHOTS

📸 6.1 Landing Page
<img width="1863" height="879" alt="image" src="https://github.com/user-attachments/assets/dff9ba91-5065-489b-be91-04d2755b5f48" />


📸 6.2 Profile Form
<img width="1862" height="881" alt="image" src="https://github.com/user-attachments/assets/1d0c74a2-68a1-4718-95d0-0d1a5ea4f624" />


📸 6.3 Profile Saved
<img width="1860" height="878" alt="image" src="https://github.com/user-attachments/assets/6a057f3e-ebc3-46da-922d-ef400d87f6d7" />


📸 6.4 View All Profiles
<img width="1839" height="879" alt="image" src="https://github.com/user-attachments/assets/f9b25a97-f53a-4cff-bed6-ff6b1e4585e7" />


📸 6.5 Search Results
<img width="1856" height="878" alt="image" src="https://github.com/user-attachments/assets/ef2259ce-5549-4fd6-98f7-2d2624d6153e" />


📸 6.6 Edit Profile
<img width="1863" height="880" alt="image" src="https://github.com/user-attachments/assets/15387d32-dff1-4110-aad7-64643084c17a" />

