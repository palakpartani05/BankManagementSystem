<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Acknowledgement</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .modal-content {
            text-align: center;
        }
        .modal-body p {
            font-size: 18px;
            font-weight: bold;
        }
        .modal-body p.success {
            color: green;
        }
        .modal-body p.error {
            color: red;
        }
    </style>
</head>
<body>
    <!-- Modal -->
    <div class="modal fade" id="ackModal" tabindex="-1" aria-labelledby="ackModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                <%String name = (String) request.getAttribute("fullName"); %>
                    <h3 class="modal-title" id="ackModalLabel"style="color:green">
                        Welcome <%=name%>
                    </h3>
                	
                </div>
                <div class="modal-body">
                <%String message = (String) request.getAttribute("successMessage"); %>
                    <p style="color:green">
                        <%=message%>
                    </p>
           
                </div>
                <div class="modal-body">
                    <a href="CustomerLogin.jsp" class="btn btn-primary">Login</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Script to automatically show the modal -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const ackModal = new bootstrap.Modal(document.getElementById('ackModal'));
            ackModal.show();
        });
    </script>
</body>
</html>
