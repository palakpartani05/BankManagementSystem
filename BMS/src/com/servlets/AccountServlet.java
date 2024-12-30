package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBConnection;

import java.sql.*;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Collect data from the form
		String customerName = request.getParameter("customerName");
		String accountNumber = request.getParameter("accountNumber");
		String ifscCode = request.getParameter("ifscCode");
		double accountBalance = Double.parseDouble(request.getParameter("accountBalance"));
		String adhaarCardNo = request.getParameter("adhaarCardNo");
		String panCardNo = request.getParameter("panCardNo");
		Date dateOfBirth = Date.valueOf(request.getParameter("dateOfBirth"));
		String gender = request.getParameter("gender");
		String maritalStatus = request.getParameter("maritalStatus");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String contactNumber = request.getParameter("contactNumber");


		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DBConnection.getConnection(); // Assuming DatabaseConnection is a class for DB connection
			System.out.println("Error in connection"+ conn);
			String sql = "INSERT INTO account1(customer_name, account_number, ifsc_code, account_balance, adhaar_card_no, pan_card_no, date_of_birth, gender, marital_status, email, address, contact_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, customerName);
			stmt.setString(2, accountNumber);
			stmt.setString(3, ifscCode);
			stmt.setDouble(4, accountBalance);
			stmt.setString(5, adhaarCardNo);
			stmt.setString(6, panCardNo);
			stmt.setDate(7, dateOfBirth);
			stmt.setString(8, gender);
			stmt.setString(9, maritalStatus);
			stmt.setString(10, email);
			stmt.setString(11, address);
			stmt.setString(12, contactNumber);

			int rowsInserted = stmt.executeUpdate();
			if (rowsInserted > 0) {
				response.sendRedirect("completeRegistration.jsp");
			} else {
				response.sendRedirect("error.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
