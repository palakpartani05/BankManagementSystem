<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .dashboard-header {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center dashboard-header">Welcome to Your Dashboard</h2>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        Customer Details
                    </div>
                    <div class="card-body">
                        <p><strong>Full Name:</strong> <%= session.getAttribute("customerName") %></p>
                        <p><strong>Email:</strong> <%= session.getAttribute("email") %></p>
                        <p><strong>Address:</strong> <%= session.getAttribute("address") %></p>
                        <p><strong>Contact Number:</strong> <%= session.getAttribute("contactNumber") %></p>
                        <p><strong>SSN ID:</strong> <%= session.getAttribute("ssn") %></p>
                    </div>
                    <div class="card-footer text-end">
                        <a href="logout.jsp" class="btn btn-danger">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
