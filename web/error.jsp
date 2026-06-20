<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <style>
        * { box-sizing: border-box; margin: 0; padding: 0; 
        }
        body {
            font-family: Tahoma, Geneva, Verdana, sans-serif;
            background: mistyrose;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px;
        }
        .error-card {
            background: white;
            border-radius: 16px;
            padding: 50px 40px;
            max-width: 500px;
            width: 100%;
            text-align: center;
            box-shadow: 0 20px 60px rgba(0,0,0,0.15);
        }
        .icon { font-size: 60px; margin-bottom: 16px; }
        h1 { color: indianred; margin-bottom: 12px; }
        p  { color: dimgray; font-size: 14px; line-height: 1.6; margin-bottom: 6px; }
        .error-detail {
            background: seashell;
            border-left: 4px solid indianred;
            padding: 12px;
            border-radius: 0 8px 8px 0;
            color: dimgray;
            font-size: 13px;
            text-align: left;
            margin: 16px 0 24px;
        }
        a {
            display: inline-block;
            background: palevioletred;
            color: white;
            padding: 12px 24px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: opacity 0.2s;
        }
        a:hover { opacity: 0.85; }
        
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
        String error = (String) request.getAttribute("error");
        %>
    <div class="error-card">
        <div class="icon">&#9888;</div>
        <h1>Oops! Something went wrong</h1>
        <p>An error occurred while processing your request.</p>
        <% if (error != null) { %>
        <div class="error-detail"><%= error %></div>
        <% } %>
        <a href="profileForm.html">&#8592; Go Back to Form</a>
        <a href="index.html" class="home-float">&#8592; Home</a>
    </div>
    </body>
</html>
