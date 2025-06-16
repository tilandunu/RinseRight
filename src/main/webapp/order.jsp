<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>RinseRight | Order Placement</title>
<link rel="stylesheet" href="views/css/order.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&family=Raleway:ital,wght@0,300;1,300&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Julius+Sans+One&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap"
	rel="stylesheet" />
</head>
<body>
	<script>
		function goToHome() {
			window.location.href = "index.jsp";
		}
		// Function to calculate the final amount
		function calculateFinalAmount() {
			// Get selected values from the form
			var typeOfWash = document.getElementsByName("typeOfWash")[0].value;
			var typeOfAftercare = document.getElementsByName("typeOfAftercare")[0].value;
			var clothType = document.getElementsByName("clothType")[0].value;
			var quantity = parseInt(document.getElementById("quantity").value) || 1;

			// Define prices for each option
			var typeOfWashPrices = {
				"DryClean" : 600,
				"MachineWash" : 500,
				"HandWash" : 800,
				"HeavyDutyCycle" : 1200,
				"SteamCleaning" : 1800
			};
			var typeOfAftercarePrices = {
				"None" : 0,
				"MachineDry" : 300,
				"IronAndPress" : 500,
				"HandWash" : 200
			};
			var clothTypePrices = {
				"Shirt" : 1000,
				"TShirt" : 500,
				"TShirtPrint" : 700,
				"Tunic" : 800,
				"BodySuit" : 1500
			};

			var totalAmount = (typeOfWashPrices[typeOfWash]
					+ typeOfAftercarePrices[typeOfAftercare] + clothTypePrices[clothType])
					* quantity;

			// Update the final amount display
			document.getElementById("finalAmount").textContent = "Rs. "
					+ totalAmount;

			document.getElementById("finalAmountInput").value = totalAmount;
		}

		document.addEventListener("DOMContentLoaded", function() {
			// Add event listeners to form elements to recalculate the final amount on change
			document.getElementsByName("typeOfWash")[0].addEventListener(
					"change", calculateFinalAmount);
			document.getElementsByName("typeOfAftercare")[0].addEventListener(
					"change", calculateFinalAmount);
			document.getElementsByName("clothType")[0].addEventListener(
					"change", calculateFinalAmount);
			document.getElementById("quantity").addEventListener("change",
					calculateFinalAmount);

			calculateFinalAmount();
		});

		calculateFinalAmount();

		// Function to increment quantity
		function incrementQuantity() {
			var quantityInput = document.getElementById("quantity");
			var currentValue = parseInt(quantityInput.value);
			if (!isNaN(currentValue)) {
				quantityInput.value = currentValue + 1;
				calculateFinalAmount(); // Recalculate final amount when quantity changes
			}
		}

		// Function to decrement quantity
		function decrementQuantity() {
			var quantityInput = document.getElementById("quantity");
			var currentValue = parseInt(quantityInput.value);
			if (!isNaN(currentValue) && currentValue > 1) {
				quantityInput.value = currentValue - 1;
				calculateFinalAmount(); // Recalculate final amount when quantity changes
			}
		}
	</script>
	<script>
		function goBack() {
			window.history.back();
		}
	</script>


	<div id="titleBar">
		<div id="headingDiv">
			<p id="heading">RinseRight</p>
			<p id="subheading">"Laundry Genius at Your Service"</p>
		</div>
		<div id="logoDiv">
			<span class="material-symbols-outlined" id="arrow" onclick="goBack()">
				arrow_back </span> <span class="material-symbols-outlined" id="home"
				onclick="goToHome()"> home </span>
		</div>
		<p id="topic">PLACE YOUR ORDER</p>
	</div>

	<div id="contentDiv">
		<div id="contentDivInside">
			<form action="<%=request.getContextPath()%>/placeOrder"
				method="post">
				<div id="firstSection">
					<div class="dropdownDiv">
						<p class="dropdownLabel">TYPE OF WASH</p>
						<select name="typeOfWash" class="dropdown1" required>
							<option value="DryClean">Dry Cleaning [Rs.600]</option>
							<option value="MachineWash">Machine Wash [Rs.500]</option>
							<option value="HandWash">Hand Wash [Rs.800]</option>
							<option value="HeavyDutyCycle">Heavy Duty Cycle
								[Rs.1200]</option>
							<option value="SteamCleaning">Steam Cleaning [Rs.1800]</option>
						</select>
					</div>

					<div class="dropdownDiv">
						<p class="dropdownLabel">TYPE OF AFTERCARE</p>
						<select name="typeOfAftercare" class="dropdown1" required>
							<option value="None">None</option>
							<option value="MachineDry">Machine Dry [Rs.300]</option>
							<option value="IronAndPress">Iron and Press [Rs.500]</option>
							<option value="HandWash">Folding and Packing [Rs.200]</option>
						</select>
					</div>
				</div>
				<div id="secondSection">
					<div id="secondSectionPart1">
						<div class="dropdownDiv2">
							<p class="dropdownLabel">CLOTH TYPE</p>
							<select name="clothType" class="dropdown2" required>
								<option value="Shirt">Shirt [Rs.1000]</option>
								<option value="TShirt">T-Shirt(Plain) [Rs.500]</option>
								<option value="TShirtPrint">T-Shirt(Printed) [Rs.700]</option>
								<option value="Tunic">Tunic [Rs.800]</option>
								<option value="BodySuit">Body Suit [Rs.1500]</option>
							</select>
						</div>

						<div class="dropdownDiv2">
							<p class="dropdownLabel">CLOTH MATERIAL</p>
							<select name="clothMaterial" class="dropdown2" required>
								<option value="Cotton">Cotton</option>
								<option value="Polyester">Polyester</option>
								<option value="Wool">Wool</option>
								<option value="Silk">Silk</option>
								<option value="Linen">Linen</option>
							</select>
						</div>
					</div>
					<div id="secondSectionPart2">
						<p id="quantityLabel">Quantity</p>
						<div id="quantityIconDiv">
							<span class="material-symbols-outlined"
								onclick="decrementQuantity()" id="decrementID"> remove </span> <input
								type="number" name="quantity" id="quantity" value="1" min="1" />
							<span class="material-symbols-outlined"
								onclick="incrementQuantity()" id="incrementID"> add </span>
						</div>
					</div>

					<input type="hidden" name="finalAmount" id="finalAmountInput">
				</div>
				<div id="BottomDiv">
					<div id="finalDiv">
						<p id="finalLabel">FINAL AMOUNT :</p>
						<p id="finalAmount"></p>
					</div>
					<div id="finalButtons">
						<input type="submit" value="GO TO PAYMENT" id="finishButton" />
					</div>
				</div>
			</form>

		</div>
	</div>
</body>
</html>
