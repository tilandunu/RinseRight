<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>RinseRight | CURRENT ORDERS</title>
<link rel="stylesheet" href="views/css/currentOrders.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap"
	rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<script>
	function goToHome() {
		window.location.href = "index.jsp";
	}
	function goBack() {
		window.history.back();
	}
	
	 function confirmDelete() {
	        return confirm("Are you sure you want to delete this order?");
	    }
</script>

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
	<div id="mainHeadingDiv">
		<p id="Heading">ORDERS</p>
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
	</div>

	<c:forEach items="${currentOrders}" var="order">
		<section class="mainCardSection">
			<span class="material-symbols-outlined shirt"> apparel </span>
			<div class="textDiv">
				<p class="headText">${order.typeOfWash}</p>
				<p class="subText">${order.typeOfAftercare}</p>
			</div>
			<p class="price">${order.finalAmount}</p>
			<form action="<%=request.getContextPath()%>/deleteOrder"
				method="post" onsubmit="return confirmDelete();">
				<input type="hidden" name="orderID" value="${order.orderID}" />
				<button type="submit" class="material-symbols-outlined delete">
					delete</button>
			</form>
		</section>
	</c:forEach>

	<p id="tagline">2024 LATIL, Marketing agency, Sri Lanka, All rights
		reserved</p>
</body>
</html>
