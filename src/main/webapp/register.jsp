<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>RinseRight | Register</title>
<link rel="stylesheet" href="views/css/register.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link
	href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet" />
<script>
	function goToHome() {
		window.location.href = "index.jsp";
	}

	function goToLogin() {
		window.location.href = "login.jsp"
	}

	function goBack() {
		window.history.back();
	}
</script>

<script>
function displayAlert() {
    var message = '<%= (request.getAttribute("message") != null) ? request.getAttribute("message").toString() : "" %>';
    if (message !== "null" && message !== "") {
        alert(message);
    }
}

</script>

<script>
	function validateForm() {
		var password = document.getElementsByName('password')[0].value;
		var reEnterPassword = document.getElementsByName('reEnterPassword')[0].value;

		if (password !== reEnterPassword) {
			alert('Passwords do not match!');
			return false; // Prevent form submission
		}

		var phoneNumber = document.getElementsByName('phoneNumber')[0].value;

		// Phone number validation using regular expression
		var phoneRegex = /^\d{10}$/; // Regular expression for a 10-digit phone number
		if (!phoneRegex.test(phoneNumber)) {
			alert('Please enter a valid 10-digit phone number.');
			return false;
		}

		return true; // Allow form submission
	}
</script>
</head>
<body onload="displayAlert()">
	<div id="mainHeadingDiv">
		<div id="headingDiv">
			<div id="headIcon">
				<span class="material-symbols-outlined" id="homeIcon"
					onclick="goToHome()"> home </span> <span
					class="material-symbols-outlined" id="backIcon" onclick="goBack()">
					arrow_back </span>
			</div>

			<div id="LogoDiv">
				<p id="headLogo">RinseRight</p>
				<p id="subHeadLogo">"Laundry Genius at Your Service"</p>
			</div>
		</div>
		<p id="Heading">REGISTER</p>
	</div>
	<form id="registrationForm"
		action="<%=request.getContextPath()%>/registerNew" method="post"
		onsubmit="return validateForm()">
		<div id="mainSectionDiv">
			<div id="mainSection1Div">
				<div id="firstSection">
					<div class="inputDiv1">
						<p class="labelform">FIRST NAME</p>
						<input type="text" class="textBox1" name="firstName" required />
					</div>
					<div class="inputDiv1">
						<p class="labelform">LAST NAME</p>
						<input type="text" class="textBox1" name="lastName" required />
					</div>
				</div>
				<div id="secondSection">
					<div class="inputDiv1">
						<p class="labelform">EMAIL ADDRESS</p>
						<input type="email" class="textBox1" name="email" required />
					</div>
					<div class="inputDiv1">
						<p class="labelform">PHONE NUMBER</p>
						<input type="tel" class="textBox1" name="phoneNumber" required
							pattern="[0-9]{10}" />
					</div>
				</div>
			</div>
			<div id="mainSection2Div">
				<div class="inputDiv2">
					<p class="labelform">ADDRESS</p>
					<input type="text" class="textBox2" name="address" required />
				</div>
				<div class="inputDiv2">
					<p class="labelform">USERNAME</p>
					<input type="text" class="textBox2" name="username" required />
				</div>
				<div class="inputDiv2">
					<p class="labelform">PASSWORD</p>
					<input type="password" class="textBox2" name="password" required />
				</div>
				<div class="inputDiv2">
					<p class="labelform">RE-ENTER PASSWORD</p>
					<input type="password" class="textBox2" name="reEnterPassword"
						required />
				</div>
			</div>
		</div>

		<div id="submitButtonDiv">
			<input type="submit" value="REGISTER" id="submitButton" />
		</div>
		<div id="loginLinkDiv">
			<p id="loginLink" onclick="goToLogin()">ALREADY HAVE AN ACCOUNT?</p>
		</div>
	</form>
</body>
</html>
