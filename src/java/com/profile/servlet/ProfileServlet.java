package com.profile.servlet;

import com.profile.bean.ProfileBean;
import com.profile.db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/ProfileServlet"})
public class ProfileServlet extends HttpServlet {
    // receive form data using HTTP POST method
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
            String action=request.getParameter("action");
            if (action==null)
                action="save";
            
                switch (action) {
            case "update":
                handleUpdate(request, response);
                break;
            default:
                handleSave(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
 
        String action = request.getParameter("action");
        if (action == null) action = "view";
 
        switch (action) {
            case "view":
                handleView(request, response);
                break;
            case "search":
                handleSearch(request, response);
                break;
            case "edit":
                handleEdit(request, response);
                break;
            case "delete":
                handleDelete(request, response);
                break;
            default:
                handleView(request, response);
        }
    }
    // create a profile bean object
    private void handleSave(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        ProfileBean profile = buildBeanFromRequest(request);
 
        String sql = "INSERT INTO Profile (studentID, name, programme, email, hobbies, introduction) VALUES (?,?,?,?,?,?)";
 
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
 
            ps.setString(1, profile.getStudentID());
            ps.setString(2, profile.getName());
            ps.setString(3, profile.getProgramme());
            ps.setString(4, profile.getEmail());
            ps.setString(5, profile.getHobbies());
            ps.setString(6, profile.getIntroduction());
            ps.executeUpdate();
 
            request.setAttribute("profile", profile);
            request.setAttribute("message", "Profile saved successfully!");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
 
        } catch (SQLException e) {
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    
    private void handleView(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String sql = "SELECT * FROM Profile ORDER BY createdAt DESC";
        List<ProfileBean> profiles = new ArrayList<>();
 
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
 
            while (rs.next()) {
                profiles.add(mapRow(rs));
            }
 
            request.setAttribute("profiles", profiles);
            request.getRequestDispatcher("viewProfiles.jsp").forward(request, response);
 
        } catch (SQLException e) {
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    
    private void handleSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String keyword = request.getParameter("keyword");
        if (keyword == null) keyword = "";
        keyword = keyword.trim();
 
        String sql = "SELECT * FROM Profile WHERE studentID LIKE ? OR name LIKE ? ORDER BY name";
        List<ProfileBean> profiles = new ArrayList<>();
 
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
 
            String like = "%" + keyword + "%";
            ps.setString(1, like);
            ps.setString(2, like);
 
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    profiles.add(mapRow(rs));
                }
            }
 
            request.setAttribute("profiles", profiles);
            request.setAttribute("keyword", keyword);
            request.getRequestDispatcher("viewProfiles.jsp").forward(request, response);
 
        } catch (SQLException e) {
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    
    private void handleEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect("ProfileServlet?action=view");
            return;
        }
 
        String sql = "SELECT * FROM Profile WHERE id = ?";
 
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
 
            ps.setInt(1, Integer.parseInt(idParam));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    request.setAttribute("profile", mapRow(rs));
                }
            }
 
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
 
        } catch (SQLException | NumberFormatException e) {
            request.setAttribute("error", "Error loading profile: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    
    private void handleUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String idParam = request.getParameter("id");
        ProfileBean profile = buildBeanFromRequest(request);
 
        String sql = "UPDATE Profile SET studentID=?, name=?, programme=?, email=?, hobbies=?, introduction=? WHERE id=?";
 
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
 
            ps.setString(1, profile.getStudentID());
            ps.setString(2, profile.getName());
            ps.setString(3, profile.getProgramme());
            ps.setString(4, profile.getEmail());
            ps.setString(5, profile.getHobbies());
            ps.setString(6, profile.getIntroduction());
            ps.setInt(7, Integer.parseInt(idParam));
            ps.executeUpdate();
 
            request.setAttribute("profile", profile);
            request.setAttribute("message", "Profile updated successfully!");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
 
        } catch (SQLException | NumberFormatException e) {
            request.setAttribute("error", "Error updating profile: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    
    
    private void handleDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String idParam = request.getParameter("id");
        String sql = "DELETE FROM Profile WHERE id = ?";
 
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
 
            ps.setInt(1, Integer.parseInt(idParam));
            ps.executeUpdate();
            response.sendRedirect("ProfileServlet?action=view");
 
        } catch (SQLException | NumberFormatException e) {
            request.setAttribute("error", "Error deleting profile: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
 
    private ProfileBean buildBeanFromRequest(HttpServletRequest request) {
        ProfileBean b = new ProfileBean();
        b.setStudentID(nullSafe(request.getParameter("studentID")));
        b.setName(nullSafe(request.getParameter("name")));
        b.setProgramme(nullSafe(request.getParameter("programme")));
        b.setEmail(nullSafe(request.getParameter("email")));
        b.setHobbies(nullSafe(request.getParameter("hobbies")));
        b.setIntroduction(nullSafe(request.getParameter("introduction")));
        return b;
    }
 
    private ProfileBean mapRow(ResultSet rs) throws SQLException {
        ProfileBean b = new ProfileBean();
        b.setId(rs.getInt("id"));
        b.setStudentID(rs.getString("studentID"));
        b.setName(rs.getString("name"));
        b.setProgramme(rs.getString("programme"));
        b.setEmail(rs.getString("email"));
        b.setHobbies(rs.getString("hobbies"));
        b.setIntroduction(rs.getString("introduction"));
        return b;
    }
 
    private String nullSafe(String s) {
        return s != null ? s.trim() : "";
    }
    
}