<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS -->
    <script>
        // JavaScript validation for the form
        function validateForm() {
            var name = document.getElementById("name").value;
            var accountNumber = document.getElementById("accountNumber").value;
            var ifscCode = document.getElementById("ifscCode").value;
            var balance = document.getElementById("balance").value;
            var adhaarCard = document.getElementById("adhaarCard").value;
            var panCard = document.getElementById("panCard").value;
            var dob = document.getElementById("dob").value;
            var gender = document.getElementById("gender").value;
            var maritalStatus = document.getElementById("maritalStatus").value;
            var email = document.getElementById("email").value;
            var contact = document.getElementById("contact").value;

            if (name == "" || accountNumber == "" || ifscCode == "" || balance == "" || adhaarCard == "" || panCard == "" || dob == "" || gender == "" || maritalStatus == "" || email == "" || contact == "") {
                alert("All fields are required");
                return false;
            }

            // Email validation
            var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Add Customer Account</h2>
        <form action="AccountServlet" method="POST" onsubmit="return validateForm()">
    <!-- Customer Name -->
    <div class="form-group">
        <label for="name">Customer Name</label>
        <input type="text" class="form-control" id="name" name="customerName" >
    </div>

    <!-- Account Number -->
    <div class="form-group">
        <label for="accountNumber">Account Number</label>
        <input type="text" class="form-control" id="accountNumber" name="accountNumber" >
    </div>

    <!-- IFSC Code -->
    <div class="form-group">
        <label for="ifscCode">IFSC Code</label>
        <input type="text" class="form-control" id="ifscCode" name="ifscCode" >
    </div>

    <!-- Account Balance -->
    <div class="form-group">
        <label for="balance">Account Balance</label>
        <input type="number" class="form-control" id="balance" name="accountBalance" >
    </div>

    <!-- Aadhaar Card Number -->
    <div class="form-group">
        <label for="adhaarCard">Aadhaar Card Number</label>
        <input type="text" class="form-control" id="adhaarCard" name="adhaarCardNo" >
    </div>

    <!-- PAN Card Number -->
    <div class="form-group">
        <label for="panCard">PAN Card Number</label>
        <input type="text" class="form-control" id="panCard" name="panCardNo" >
    </div>

    <!-- Date of Birth -->
    <div class="form-group">
        <label for="dob">Date of Birth</label>
        <input type="date" class="form-control" id="dob" name="dateOfBirth" >
    </div>

    <!-- Gender -->
    <div class="form-group">
        <label for="gender">Gender</label>
        <select class="form-control" id="gender" name="gender" >
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select>
    </div>

    <!-- Marital Status -->
    <div class="form-group">
        <label for="maritalStatus">Marital Status</label>
        <select class="form-control" id="maritalStatus" name="maritalStatus" >
            <option value="Single">Single</option>
            <option value="Married">Married</option>
        </select>
    </div>

    <!-- Email -->
    <div class="form-group">
        <label for="email">Email</label>
        <input type="email" class="form-control" id="email" name="email" >
    </div>

    <!-- Contact Number -->
    <div class="form-group">
        <label for="contact">Contact Number</label>
        <input type="text" class="form-control" id="contact" name="contactNumber" >
    </div>

    <!-- Submit Button -->
    <button type="submit" class="btn btn-primary">Add Customer</button>
</form>

    </div>
</body>
</html>
