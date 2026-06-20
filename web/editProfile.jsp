<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.profile.bean.ProfileBean"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
 
        body {
            font-family: Tahoma, Geneva, Verdana, sans-serif;
            background: mistyrose;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 30px 20px;
        }
 
        .nav {
            width: 95%;
            max-width: 900px;
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
            justify-content: flex-start;
        }
        .nav a {
            background: white;
            color: palevioletred;
            border: 2px solid palevioletred;
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            transition: all 0.2s;
        }
        .nav a:hover { background: palevioletred; color: white; }
 
        .card {
            background: white;
            border-radius: 16px;
            padding: 40px;
            width: 95%;
            max-width: 900px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.15);
        }
 
        .card-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .card-header .icon { font-size: 48px; margin-bottom: 10px; }
        .card-header h1 { color: palevioletred; font-size: 24px; }
        .card-header p  { color: dimgray; font-size: 13px; margin-top: 4px; }
 
        .form-group { margin-bottom: 18px; }
        .form-group label {
            display: block;
            font-weight: 600;
            color: darkslategrey;
            margin-bottom: 6px;
            font-size: 14px;
        }
        .form-group input[type=text],
        .form-group input[type=email],
        .form-group textarea {
            width: 100%;
            padding: 10px 18px;
            border: 2px solid lightgrey;
            border-radius: 8px;
            font-size: 14px;
            font-family: Tahoma, Geneva, Verdana, sans-serif;
            transition: border-color 0.3s;
        }
        .form-group input:focus,
        .form-group textarea:focus {
            border-color: palevioletred;
            outline: none;
            height: 140px;
        }
        .form-group textarea { height: 100px; resize: vertical; }
 
        .btn-row { display: flex; gap: 10px; margin-top: 10px; }
        .btn {
            flex: 1;
            padding: 13px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            border: none;
            transition: opacity 0.2s;
            text-decoration: none;
            text-align: center;
            font-family: Tahoma, Geneva, Verdana, sans-serif;
        }
        .btn:hover { opacity: 0.85; }
        .btn-save   { background: palevioletred; color: white; }
        .btn-cancel { background: white; color: palevioletred; border: 2px solid palevioletred; }
        
        .home-float {
           position: fixed;
           left: 24px;
           bottom: 24px;
           display: inline-flex;
           align-items: center;
           gap: 8px;
           background: palevioletred;
           color: white;
           padding: 12px 20px;
           border-radius: 8px;
           text-decoration: none;
           font-weight: bold;
           font-size: 14px;
           box-shadow: 0 8px 20px rgba(219,112,147,0.4);
           transition: opacity 0.2s, transform 0.2s;
           z-index: 999;
        }
        .home-float:hover {
           opacity: 0.9;
            transform: translateY(-2px);
        }
    </style>
    </head>
    <body>       
        <%
    ProfileBean profile = (ProfileBean) request.getAttribute("profile");
    if (profile == null) {
        response.sendRedirect("ProfileServlet?action=view");
        return;
    }
%>
 
    <div class="nav">
        <a href="ProfileServlet?action=view">&#8592; Back to Profiles</a>
    </div>
 
    <div class="card">
        <div class="card-header">
            <div class="icon">&#9998;</div>
            <h1>Edit Profile</h1>
            <p>Update the information below</p>
        </div>
 
        <form action="ProfileServlet?action=update" method="post">
            <!-- hidden field -->
            <input type="hidden" name="id" value="<%= profile.getId() %>">
 
            <div class="form-group">
                <label>&#127988; Student ID</label>
                <input type="text" name="studentID" value="<%= profile.getStudentID() %>" required>
            </div>
 
            <div class="form-group">
                <label>&#128100; Full Name</label>
                <input type="text" name="name" value="<%= profile.getName() %>" required>
            </div>
 
            <div class="form-group">
                <label>&#127979; Programme</label>
                <input type="text" name="programme" value="<%= profile.getProgramme() %>" required>
            </div>
 
            <div class="form-group">
                <label>&#128140; Email</label>
                <input type="email" name="email" value="<%= profile.getEmail() %>" required>
            </div>
 
            <div class="form-group">
                <label>&#127928; Hobbies</label>
                <input type="text" name="hobbies" value="<%= profile.getHobbies() %>">
            </div>
 
            <div class="form-group">
                <label>&#128221; Short Self-Introduction</label>
                <textarea name="introduction"><%= profile.getIntroduction() %></textarea>
            </div>
 
            <div class="btn-row">
                <button type="submit" class="btn btn-save">&#10003; Save Changes</button>
                <a href="ProfileServlet?action=view" class="btn btn-cancel">&#10005; Cancel</a>
            </div>
        </form>
    </div>
    </body>
</html>
