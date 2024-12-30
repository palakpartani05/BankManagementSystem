<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration</title>
    <link rel="stylesheet" href="style.css"> <!-- Link to your CSS -->
    <script>
        // Validation for SSN ID and Password
        function validateForm() {
            var ssnId = document.getElementById("customerSsnId").value;
            if (ssnId == "") {
                alert("Customer SSN ID must be filled out");
                return false;
            }

            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (password != confirmPassword) {
                alert("Passwords do not match");
                return false;
            }

            var email = document.getElementById("email").value;
            var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Customer Registration</h2>
        <form action="CustomerServlet" method="POST" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="customerSsnId">Customer SSN ID</label>
                <input type="text" class="form-control" id="customerSsnId" name="customerSsnId" required>
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>

        <div id="customerDetails">
            <form action="CustomerServlet" method="POST" onsubmit="return validateForm()">
                <input type="hidden" id="ssnId" name="customerSsnId">

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>

                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="password" required>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>

                <button type="submit" class="btn btn-primary">Register</button>
            </form>
        </div>
    </div>
</body>
</html>
