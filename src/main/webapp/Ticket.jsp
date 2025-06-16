<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="views/css/Ticket.css" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link
	href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet" />
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>RinseRight | Ticket Placement</title>
<script>
function displayAlert() {
    var message = '<%=(request.getAttribute("message") != null) ? request.getAttribute("message").toString() : ""%>
	';
		if (message !== "null" && message !== "") {
			alert(message);
		}
	}
</script>
</head>
<body onload="displayAlert()">
	<script>
		function goBack() {
			window.history.back();
		}

		function goToHome() {
			window.location.href = "index.jsp";
		}
	</script>
	<div id="headerDiv">
		<p id="header">PLACE YOUR TICKET</p>
		<div id="headIcon">
			<span class="material-symbols-outlined" id="homeIcon"
				onclick="goToHome()"> home </span> <span
				class="material-symbols-outlined" id="backIcon" onclick="goBack()">
				arrow_back </span>
		</div>
	</div>

	<div id="formDiv">
		<form action="<%=request.getContextPath()%>/placeTicket" method="post">
			<div id="checkBoxDiv">
				<input type="checkbox" name="mode" value="urgent" id="checkbox" />
				<p id="checkboxLabel">URGENT</p>
			</div>

			<div id="typeDiv">
				<p class="typeLabel">INQUIRY TYPE</p>
				<select name="inquiryType" id="typeSelect" class="selectTypeBox"
					onchange="toggleSubTypeOptions()" required>
					<option value="payment">Payment</option>
					<option value="orderStatus">Order Status</option>
					<option value="serviceQuality">Service Quality</option>
					<option value="other">Other</option>
				</select>
			</div>

			<div id="SubTypeDiv">
				<p class="typeLabel">SUB-INQUIRY TYPE</p>
				<select name="subInquiryType" id="subInquiryType"
					class="selectTypeBox" required>
					<optgroup label="Payment">
						<option value="paymentMethod">Payment Method Issues</option>
						<option value="billingIssues">Billing issues</option>
						<option value="otherPayment">Other Payment Issues</option>
					</optgroup>
					<optgroup label="Order Status">
						<option value="orderTracking">Order Tracking Issues</option>
						<option value="cancellations">Changes and cancellations</option>
						<option value="otherOrder">Other Order Status Issues</option>
					</optgroup>
					<optgroup label="Service Quality">
						<option value="cleaningProcess">Cleaning Process</option>
						<option value="damages">Damages</option>
						<option value="otherService">Other Service Quality Issues</option>
					</optgroup>
					<optgroup label="Other">
						<option value="other">Other</option>
					</optgroup>
				</select>
			</div>

			<div id="enterInquiryDiv">
				<p class="boxLabel">ENTER INQUIRY</p>
				<textarea name="inquiry" class="box" cols="160" rows="30" required></textarea>
			</div>

			<div id="enterSuggestionsDiv">
				<p class="boxLabel">ANY SUGGESTIONS?</p>
				<textarea name="suggestions" class="box" cols="160" rows="30"></textarea>
			</div>

			<div id="submitDiv">
				<input type="submit" value="PLACE THE TICKET" id="submit" />
			</div>
		</form>
	</div>
</body>
</html>
