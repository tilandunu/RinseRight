<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="views/css/payment.css" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>RinseRight | Payment Gateway</title>
</head>
<body>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const agreeCheckbox = document
					.getElementById("termsAndConditionsCheckbox");
			const submitButton = document.getElementById("submitButton");

			// Function to enable/disable the submit button based on checkbox state
			function toggleSubmitButton() {
				if (agreeCheckbox.checked) {
					submitButton.classList.remove("disabled");
				} else {
					submitButton.classList.add("disabled");
				}
			}

			// Initial call to set button state based on default checkbox state
			toggleSubmitButton();

			// Event listener to toggle button state when checkbox state changes
			agreeCheckbox.addEventListener("change", toggleSubmitButton);
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const creditCardRadio = document.getElementById("creditCard");
			const cashOnDeliveryRadio = document
					.getElementById("cashOnDelivery");
			const creditCardFields = document
					.getElementById("creditCardFields");
			const cashOnDeliveryFields = document
					.getElementById("cashOnDeliveryFields");
			const cardTypeFields = document.getElementById("mainDIVCARD");
			const cardNumberInput = document.getElementById("cardNumber");
			const cvvInput = document.getElementById("CVV");
			const deliveryAddressInput = document
					.getElementById("deliveryAddress");

			function toggleFields() {
				if (creditCardRadio.checked) {
					creditCardFields.style.display = "block";
					cashOnDeliveryFields.style.display = "none";
					cardTypeFields.style.display = "block";
					// Add required attribute to inputs
					cardNumberInput.required = true;
					cvvInput.required = true;
					deliveryAddressInput.required = false; // Remove required from hidden field
				} else if (cashOnDeliveryRadio.checked) {
					creditCardFields.style.display = "none";
					cashOnDeliveryFields.style.display = "block";
					cardTypeFields.style.display = "none";
					// Add required attribute to inputs
					cardNumberInput.required = false; // Remove required from hidden field
					cvvInput.required = false; // Remove required from hidden field
					deliveryAddressInput.required = true;
				}
			}

			toggleFields(); // Call the function initially to set the required attributes

			creditCardRadio.addEventListener("change", toggleFields);
			cashOnDeliveryRadio.addEventListener("change", toggleFields);
		});
	</script>
	<script>
		function cancelOrder() {
			// Prompt the user with a confirmation dialog
			if (confirm("Are you sure you want to cancel the order?")) {
				// If the user confirms, redirect to the homepage
				window.location.href = "index.jsp";
			} else {
				// If the user cancels, do nothing
				return;
			}
		}
	</script>
	<script>
		function validateForm(event) {
			// Remove spaces from credit card number
			const cardNumber = document.getElementById("cardNumber").value
					.replace(/\s/g, '');
			const cvv = document.getElementById("CVV").value;
			const creditCardRadio = document.getElementById("creditCard");

			if (creditCardRadio.checked) {
				// Validate card number (simple Luhn check could be implemented for more robustness)
				const cardNumberPattern = /^[0-9]{16}$/;
				if (!cardNumberPattern.test(cardNumber)) {
					alert("Please enter a valid 16-digit card number.");
					event.preventDefault(); // Prevent form submission
					return false;
				}

				// Validate CVV
				const cvvPattern = /^[0-9]{3,4}$/;
				if (!cvvPattern.test(cvv)) {
					alert("Please enter a valid CVV number (3 or 4 digits).");
					event.preventDefault(); // Prevent form submission
					return false;
				}
			}
			return true;
		}
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const cardNumberInput = document.getElementById("cardNumber");

			// Function to format the credit card number with spaces after every four digits
			function formatCardNumber() {
				let cardNumber = cardNumberInput.value.replace(/\s/g, ''); // Remove existing spaces
				let formattedCardNumber = '';
				for (let i = 0; i < cardNumber.length; i++) {
					if (i > 0 && i % 4 === 0) {
						formattedCardNumber += ' '; // Add a space after every four digits
					}
					formattedCardNumber += cardNumber[i];
				}
				cardNumberInput.value = formattedCardNumber;
			}

			// Event listener to format the credit card number input
			cardNumberInput.addEventListener("input", formatCardNumber);
		});
	</script>

	<div id="LogoDiv">
		<p id="headLogo">RinseRight</p>
		<p id="subHeadLogo">"Laundry Genius at Your Service"</p>
	</div>

	<div id="mainTotalDiv">
		<div id="totalDiv">
			<p id="totalLabel">YOUR TOTAL IS</p>
			<p id="total">
				RS.
				<%=session.getAttribute("finalAmount")%></p>
		</div>
	</div>

	<form action="<%=request.getContextPath()%>/processPayment"
		method="post">
		<div class="paymentMethodDiv">
			<p id="methodlabel">SELECT YOUR PAYMENT METHOD</p>
			<div id="mainMethodDiv">
				<input type="radio" id="creditCard" name="paymentMethod"
					value="creditCard" checked /> <label for="creditCard">
					<div class="methodDiv">
						<span class="material-symbols-outlined card"
							style="font-size: 50px"> credit_card </span>
						<p class="methodNames">CREDIT/DEBIT CARD</p>
					</div>
				</label> <input type="radio" id="cashOnDelivery" name="paymentMethod"
					value="cashOnDelivery" /> <label for="cashOnDelivery">
					<div class="methodDiv">
						<span class="material-symbols-outlined paymentOnDelivery"
							style="font-size: 50px"> payments </span>
						<p class="methodNames">CASH ON DELIVERY</p>
					</div>
				</label>
			</div>
		</div>

		<div id="mainDIVCARD">
			<div class="paymentMethodDiv">
				<p id="methodlabel">SELECT YOUR CARD TYPE</p>
				<div id="mainMethodDiv">
					<input type="radio" id="visaPayment" name="cardType" value="visa" />
					<label for="visaPayment">
						<div class="methodDiv2">
							<i class="fa fa-cc-visa visaCard" style="font-size: 50px"></i>
							<p class="methodNames">VISA</p>
						</div>
					</label> <input type="radio" id="mastercardPayment" name="cardType"
						value="mastercard" /> <label for="mastercardPayment">
						<div class="methodDiv2">
							<i class="fa fa-cc-mastercard masterCard" style="font-size: 50px"></i>
							<p class="methodNames">MASTERCARD</p>
						</div>
					</label>
				</div>
			</div>
		</div>

		<div id="creditCardFields">
			<div class="inputDiv">
				<input type="text" name="cardNumber" id="cardNumber"
					placeholder="CARD NUMBER" required /> <input type="text"
					name="CVV" id="CVV" placeholder="CVV" required />
			</div>
		</div>

		<div id="cashOnDeliveryFields" style="display: none">
			<div class="inputDiv">
				<input type="text" name="deliveryAddress" id="deliveryAddress"
					placeholder="DELIVERY ADDRESS" required />
			</div>
		</div>

		<div class="mainCheckBoxDiv">
			<div class="checkboxDiv">
				<input type="checkbox" value="termsAndConditionsYes"
					class="checkbox" id="termsAndConditionsCheckbox" />
				<p class="checkboxlabel">AGREE WITH TERMS AND CONDITIONS</p>
			</div>
		</div>
		<div id="submitDiv">
			<input type="submit" name="submit" value="PLACE ORDER"
				id="submitButton" class="disabled"
				onclick="return validateForm(event);" />
		</div>
	</form>
	<div id="cancelButtonDiv">
		<button id="cancelOrderButton" onclick="cancelOrder()">CANCEL
			ORDER</button>
	</div>
</body>
</html>
