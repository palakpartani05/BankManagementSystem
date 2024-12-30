<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Registration</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.error-message {
	color: red;
	font-size: 1em;
	margin-bottom: 10px;
}

.success-message {
	color: green;
	font-size: 1em;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<h2>Customer Registration</h2>
		<!-- Display message at the top of the form -->
		<%
		String message = (String) request.getAttribute("message");
		String messageType = (String) request.getAttribute("messageType"); // success or error
		if (message != null) {
		%>
		<div
			class="<%="success".equals(messageType) ? "success-message" : "error-message"%>">
			<%=message%>
		</div>
		<%
		}
		%>

		<form action="CustomerServlet" method="post" id="registrationForm">
			<div class="form-group">
				<label for="ssn">Customer SSN ID:</label> <input type="text"
					class="form-control" id="ssn" name="ssn" maxlength="7" required>
				<div class="error-message" id="ssnError"></div>
			</div>
			<div class="form-group">
				<label for="firstName">First Name:</label> <input type="text"
					class="form-control" id="firstName" name="firstName" maxlength="50"
					required>
				<div class="error-message" id="firstNameError"></div>
			</div>
			<div class="form-group">
				<label for="lastName">Last Name:</label> <input type="text"
					class="form-control" id="lastName" name="lastName" maxlength="50"
					required>
				<div class="error-message" id="lastNameError"></div>
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="email"
					class="form-control" id="email" name="email" required>
				<div class="error-message" id="emailError"></div>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					class="form-control" id="password" name="password" maxlength="30"
					required>
				<div class="error-message" id="passwordError"></div>
			</div>
			<div class="form-group">
				<label for="confirmPassword">Confirm Password:</label> <input
					type="password" class="form-control" id="confirmPassword"
					name="confirmPassword" maxlength="30" required>
				<div class="error-message" id="confirmPasswordError"></div>
			</div>
			<div class="form-group">
				<label for="address">Address:</label>
				<textarea class="form-control" id="address" name="address"
					maxlength="100" required></textarea>
				<div class="error-message" id="addressError"></div>
			</div>
			<div class="form-group">
				<label for="contactNumber">Contact Number:</label> <input
					type="text" class="form-control" id="contactNumber"
					name="contactNumber" maxlength="10" required>
				<div class="error-message" id="contactNumberError"></div>
			</div>
			<button type="submit" class="btn btn-primary">Register</button>
		</form>
	</div>
	<script>
		document.getElementById('registrationForm').onsubmit = function(e) {
			let isValid = true;
			const ssn = document.getElementById('ssn').value;
			const password = document.getElementById('password').value;
			const confirmPassword = document.getElementById('confirmPassword').value;
			const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

			document.getElementById('ssnError').innerText = '';
			document.getElementById('passwordError').innerText = '';
			document.getElementById('confirmPasswordError').innerText = '';

			if (ssn.length !== 7 || isNaN(ssn)) {
				document.getElementById('ssnError').innerText = 'SSN ID must be a 7-digit number.';
				isValid = false;
			}
			if (!passwordRegex.test(password)) {
				document.getElementById('passwordError').innerText = 'Password must be at least 8 characters long, include an uppercase, a lowercase, a number, and a special character.';
				isValid = false;
			}
			if (password !== confirmPassword) {
				document.getElementById('confirmPasswordError').innerText = 'Password and Confirm Password do not match.';
				isValid = false;
			}

			if (!isValid) {
				e.preventDefault();
			}
		};
	</script>
</body>
</html>
