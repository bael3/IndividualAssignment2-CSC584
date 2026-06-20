<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.profile.bean.ProfileBean"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <%
        ProfileBean profile = (ProfileBean) request.getAttribute("profile");
        String displayName = (profile != null) ? profile.getName() : "Profile";
        %>
    <title>Profile - <%= displayName %></title>
         <style>
        * { 
            box-sizing: border-box; margin: 0; padding: 0; }
  
        body {
            font-family: Tahoma, Geneva, Verdana, sans-serif;
            background: mistyrose;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 30px 20px;
        }
        
        .banner {
            background: #d4edda;
            border: 1px solid #a8d5b5;
            color: #2d6a4f;
            border-radius: 10px;
            padding: 12px 20px;
            margin-bottom: 20px;
            width:fit-content;
            max-width: 600px;
            font-size: 14px;
            font-weight: 600;
            text-align: center;
        }
        
        .profile-card {
            background: white;
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 800px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.15);
        }
        .profile-header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 3px solid lightpink;
        }
        
        .profile-header h1 {
            color: palevioletred;
            font-size: 28px;
            margin: 5px 0;
        }
        .profile-header p {
            color: dimgray;
            font-size: 14px;
            margin: 0;
        }
        .info-row {
            display: flex;
            align-items: flex-start;
            padding: 14px 0;
            border-bottom: 1px solid whitesmoke;
        }
        .info-row:last-child { 
            border-bottom: none; }
        
        .info-label {
            font-weight: 700;
            color: rosybrown;
            font-size: 13px;
            width: 130px;
            flex-shrink: 0;
        }
        .info-value {
            color: dimgray;
            font-size: 15px;
            flex: 1;
        }
        
        .info-icon {
            font-size: 22px;
            width: 40px;
            flex-shrink: 0;
        }

        .intro-box {
            background: seashell;
            border-left: 4px solid palevioletred;
            padding: 15px;
            border-radius: 0 8px 8px 0;
            color: dimgray;
            line-height: 1.6;
            
        }
        .btn-row {
            display: flex;
            gap: 10px;
            margin-top: 30px;
            flex-wrap: wrap;
        }
        .btn {
            flex: 1;
            padding: 12px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
            text-align: center;
            border: none;
            cursor: pointer;
            transition: opacity 0.2s;
            font-family: Tahoma, Geneva, Verdana, sans-serif;
        }
        .btn:hover { 
            opacity: 0.85; }
        .btn-back   { 
            background: palevioletred; color: white; }
        .btn-view   { 
            background: white; color: palevioletred; border: 2px solid palevioletred; }
        
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
        String msg = (String) request.getAttribute("message");
        if (msg != null && !msg.isEmpty()) {
    %>
    <div class="banner">&#10004; <%= msg %></div>
    <% } %>
 
    <div class="profile-card">
        <div class="profile-header">
            <div class="avatar">&#128100;</div>
            <h1><%= profile != null ? profile.getName() : "" %></h1>
            <p>Student Profile</p>
        </div>
 
        <div class="info-row">
            <div class="info-icon">&#127988;</div>
            <div class="info-label">Student ID</div>
            <div class="info-value"><%= profile != null ? profile.getStudentID() : "" %></div>
        </div>
 
        <div class="info-row">
            <div class="info-icon">&#127979;</div>
            <div class="info-label">Programme</div>
            <div class="info-value"><%= profile != null ? profile.getProgramme() : "" %></div>
        </div>
 
        <div class="info-row">
            <div class="info-icon">&#128140;</div>
            <div class="info-label">Email</div>
            <div class="info-value"><%= profile != null ? profile.getEmail() : "" %></div>
        </div>
 
        <div class="info-row">
            <div class="info-icon">&#127928;</div>
            <div class="info-label">Hobbies</div>
            <div class="info-value"><%= profile != null ? profile.getHobbies() : "" %></div>
        </div>
 
        <div class="info-row">
            <div class="info-icon">&#128221;</div>
            <div class="info-label">Introduction</div>
            <div class="info-value">
                <div class="intro-box"><%= profile != null ? profile.getIntroduction() : "" %></div>
            </div>
        </div>
 
        <div class="btn-row">
            <a href="profileForm.html" class="btn btn-back">&#43; Add New Profile</a>
            <a href="ProfileServlet?action=view" class="btn btn-view">&#128101; View All Profiles</a>
            <a href="index.html" class="home-float">&#8592; Home</a>
        </div>
    </div>
    </body>
</html>
