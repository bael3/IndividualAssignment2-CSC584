<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.profile.bean.ProfileBean"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Student Profiles</title>
        <style>
           * { box-sizing: border-box; margin: 0; padding: 0; }
 
        body {
            font-family: Tahoma, Geneva, Verdana, sans-serif;
            background: mistyrose;
            min-height: 100vh;
            padding: 30px 20px;
        }
 
        .container {
            max-width: 900px;
            margin: 0 auto;
        }
 
        .page-header {
            background: white;
            border-radius: 16px;
            padding: 25px 30px;
            margin-bottom: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.10);
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
        }
        .page-header h1 { color: palevioletred; font-size: 24px; }
        .page-header p  { color: dimgray; font-size: 13px; margin-top: 4px; }
 
        .btn-add {
            background: palevioletred;
            color: white;
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            transition: opacity 0.2s;
            white-space: nowrap;
        }
        .btn-add:hover { opacity: 0.85; }
 
        .search-card {
            background: white;
            border-radius: 12px;
            padding: 18px 24px;
            margin-bottom: 20px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            display: flex;
            gap: 10px;
            align-items: center;
            flex-wrap: wrap;
        }
        .search-card input[type=text] {
            flex: 1;
            min-width: 200px;
            padding: 10px 14px;
            border: 2px solid lightgrey;
            border-radius: 8px;
            font-size: 14px;
            font-family: Tahoma, Geneva, Verdana, sans-serif;
            transition: border-color 0.3s;
        }
        .search-card input[type=text]:focus {
            border-color: palevioletred;
            outline: none;
        }
        .btn-search {
            background: palevioletred;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            font-family: Tahoma, Geneva, Verdana, sans-serif;
            transition: opacity 0.2s;
        }
        .btn-search:hover { opacity: 0.85; }
        .btn-clear {
            background: white;
            color: palevioletred;
            border: 2px solid palevioletred;
            padding: 9px 16px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            font-family: Tahoma, Geneva, Verdana, sans-serif;
            transition: all 0.2s;
        }
        .btn-clear:hover { background: mistyrose; }
 
        .result-info {
            color: dimgray;
            font-size: 13px;
            margin-bottom: 14px;
            padding-left: 4px;
        }
 
        .profile-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(380px, 1fr));
            gap: 16px;
        }
 
        .profile-card {
            background: white;
            border-radius: 14px;
            padding: 24px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.09);
            border-top: 4px solid palevioletred;
            transition: transform 0.2s;
        }
        .profile-card:hover { transform: translateY(-2px); }
 
        .pc-header {
            display: flex;
            align-items: center;
            gap: 14px;
            margin-bottom: 16px;
            padding-bottom: 14px;
            border-bottom: 2px solid whitesmoke;
        }
        .pc-avatar {
            width: 50px; height: 50px;
            background: mistyrose;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            font-size: 24px;
            flex-shrink: 0;
        }
        .pc-name { color: palevioletred; font-size: 18px; font-weight: 700; }
        .pc-id   { color: dimgray; font-size: 12px; margin-top: 2px; }
 
        .pc-field {
            display: flex;
            gap: 8px;
            margin-bottom: 8px;
            font-size: 13px;
        }
        .pc-field-icon  { font-size: 14px; width: 20px; flex-shrink: 0; }
        .pc-field-label { color: rosybrown; font-weight: 600; width: 90px; flex-shrink: 0; }
        .pc-field-value { color: dimgray; word-break: break-word; }
 
        .intro-box {
            background: seashell;
            border-left: 3px solid palevioletred;
            padding: 10px 12px;
            border-radius: 0 6px 6px 0;
            color: dimgray;
            font-size: 12px;
            line-height: 1.5;
            margin-top: 4px;
        }
 
        .pc-actions {
            display: flex;
            gap: 8px;
            margin-top: 16px;
            padding-top: 14px;
            border-top: 1px solid whitesmoke;
        }
        .btn-edit {
            flex: 1;
            padding: 8px;
            background: white;
            color: steelblue;
            border: 2px solid steelblue;
            border-radius: 7px;
            font-size: 13px;
            font-weight: bold;
            text-decoration: none;
            text-align: center;
            transition: all 0.2s;
            font-family: Tahoma, Geneva, Verdana, sans-serif;
        }
        .btn-edit:hover { background: steelblue; color: white; }
 
        .btn-delete {
            flex: 1;
            padding: 8px;
            background: white;
            color: indianred;
            border: 2px solid indianred;
            border-radius: 7px;
            font-size: 13px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            transition: all 0.2s;
            font-family: Tahoma, Geneva, Verdana, sans-serif;
        }
        .btn-delete:hover { background: indianred; color: white; }
 
        .empty-state {
            text-align: center;
            background: white;
            border-radius: 14px;
            padding: 60px 30px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.09);
            color: dimgray;
        }
        .empty-state .icon { font-size: 60px; margin-bottom: 16px; }
        .empty-state h2 { color: rosybrown; margin-bottom: 8px; }
        .empty-state a {
            display: inline-block;
            margin-top: 16px;
            background: palevioletred;
            color: white;
            padding: 10px 22px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
        } 
        
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
          List<ProfileBean> profiles = (List<ProfileBean>) request.getAttribute("profiles");
          String keyword = (String) request.getAttribute("keyword");
          if (keyword == null) keyword = "";
         %>
 
<div class="container">
 
    <div class="page-header">
        <div>
            <h1>&#128101; Student Profiles</h1>
        </div>
        <a href="profileForm.html" class="btn-add">&#43; Add New Profile</a>
        <a href="index.html" class="home-float">&#8592; Home</a>
    </div>
 
    <form class="search-card" action="ProfileServlet" method="get">
        <input type="hidden" name="action" value="search">
        <input type="text" name="keyword" placeholder="&#128269; Search by Student ID or Name..."
               value="<%= keyword %>">
        <button type="submit" class="btn-search">Search</button>
        <% if (!keyword.isEmpty()) { %>
        <a href="ProfileServlet?action=view" class="btn-clear">&#10005; Clear</a>
        <% } %>
    </form>
 
    <p class="result-info">
        <% if (!keyword.isEmpty()) { %>
            Search results for "<strong><%= keyword %></strong>": <%= profiles != null ? profiles.size() : 0 %> found
        <% } else { %>
            Total profiles: <%= profiles != null ? profiles.size() : 0 %>
        <% } %>
    </p>
 
    <% if (profiles == null || profiles.isEmpty()) { %>
    <div class="empty-state">
        <div class="icon">&#128100;</div>
        <h2>No profiles found</h2>
        <p><%= keyword.isEmpty() ? "No profiles have been added yet." : "No results match your search." %></p>
        <a href="profileForm.html">&#43; Add First Profile</a>
        <a href="index.html" class="home-float">&#8592; Home</a>
    </div>
    <% } else { %>
    <div class="profile-grid">
        <% for (ProfileBean p : profiles) { %>
        <div class="profile-card">
 
            <div class="pc-header">
                <div class="pc-avatar">&#128100;</div>
                <div>
                    <div class="pc-name"><%= p.getName() %></div>
                    <div class="pc-id">&#127988; <%= p.getStudentID() %></div>
                </div>
            </div>
 
            <div class="pc-field">
                <span class="pc-field-icon">&#127979;</span>
                <span class="pc-field-label">Programme</span>
                <span class="pc-field-value"><%= p.getProgramme() %></span>
            </div>
            <div class="pc-field">
                <span class="pc-field-icon">&#128140;</span>
                <span class="pc-field-label">Email</span>
                <span class="pc-field-value"><%= p.getEmail() %></span>
            </div>
            <div class="pc-field">
                <span class="pc-field-icon">&#127928;</span>
                <span class="pc-field-label">Hobbies</span>
                <span class="pc-field-value"><%= p.getHobbies() %></span>
            </div>
 
            <% if (p.getIntroduction() != null && !p.getIntroduction().isEmpty()) { %>
            <div class="pc-field" style="align-items:flex-start;">
                <span class="pc-field-icon">&#128221;</span>
                <span class="pc-field-label">About</span>
                <span class="pc-field-value">
                    <div class="intro-box"><%= p.getIntroduction() %></div>
                </span>
            </div>
            <% } %>
 
            <div class="pc-actions">
                <a href="ProfileServlet?action=edit&id=<%= p.getId() %>" class="btn-edit">&#9998; Edit</a>
                <a href="ProfileServlet?action=delete&id=<%= p.getId() %>"
                   class="btn-delete"
                   onclick="return confirm('Delete <%= p.getName().replace("'", "\\'") %>\'s profile?');">
                   &#128465; Delete
                </a>
            </div>
        </div>
        <% } %>
    </div>
    <% } %>
 
</div>

    </body>
</html>
