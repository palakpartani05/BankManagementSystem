package com.servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.dao.DBConnection;

@WebServlet("/CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ssn = request.getParameter("ssn");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM customer WHERE ssn_id = ? AND password = ?");
            ps.setString(1, ssn);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Login successful
                HttpSession session = request.getSession();
                session.setAttribute("customerName", rs.getString("first_name") + " " + rs.getString("last_name"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("address", rs.getString("address"));
                session.setAttribute("contactNumber", rs.getString("contact_number"));
                session.setAttribute("ssn", rs.getString("ssn_id"));

                response.sendRedirect("dashboard.jsp");
            } else {
                // Login failed
                request.setAttribute("errorMessage", "Invalid SSN ID or Password.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerLogin.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerLogin.jsp");
            dispatcher.forward(request, response);
        }
    }
}
