package com.servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.DBConnection;

import java.io.*;
import java.sql.*;

@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ssn = request.getParameter("ssn");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String contactNumber = request.getParameter("contactNumber");
        request.setAttribute("fullName", firstName+" "+lastName);
        try (Connection conn = DBConnection.getConnection()) {
            // Check if the customer SSN exists in the employee_accounts table
            PreparedStatement psCheck = conn.prepareStatement("SELECT * FROM account1 WHERE customer_ssn_id = ?");
            psCheck.setString(1, ssn);
            ResultSet rsCheck = psCheck.executeQuery();

            if (!rsCheck.next()) {
                // SSN not found
                request.setAttribute("message", "Account not found. Please contact the bank.");
                request.setAttribute("messageType", "error");
                RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerRegistration.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // Check if the customer is already registered
            PreparedStatement psRegistered = conn.prepareStatement("SELECT * FROM customer WHERE ssn_id = ?");
            psRegistered.setString(1, ssn);
            ResultSet rsRegistered = psRegistered.executeQuery();

            if (rsRegistered.next()) {
                // Customer already registered
                request.setAttribute("message", "Customer is already registered.");
                request.setAttribute("messageType", "error");
                RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerRegistration.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // Insert new customer
            PreparedStatement psInsert = conn.prepareStatement(
                    "INSERT INTO customer (ssn_id, first_name, last_name, email, password, address, contact_number) VALUES (?, ?, ?, ?, ?, ?, ?)");
            psInsert.setString(1, ssn);
            psInsert.setString(2, firstName);
            psInsert.setString(3, lastName);
            psInsert.setString(4, email);
            psInsert.setString(5, password);
            psInsert.setString(6, address);
            psInsert.setString(7, contactNumber);

            int rowsInserted = psInsert.executeUpdate();
            if (rowsInserted > 0) {
                // Registration successful
                request.setAttribute("successMessage", "Registration Successful!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("acknowledgement.jsp");
                dispatcher.forward(request, response);
            } else {
                // Registration failed
                request.setAttribute("message", "Registration failed. Please try again.");
                request.setAttribute("messageType", "error");
                RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerRegistration.jsp");
                dispatcher.forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred. Please try again.");
            request.setAttribute("messageType", "error");
            RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerRegistration.jsp");
            dispatcher.forward(request, response);
        }
    }
}
