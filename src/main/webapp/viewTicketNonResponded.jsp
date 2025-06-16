<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>RinseRight | VIEW TICKET</title>
<link rel="stylesheet" href="views/css/viewTicketNonResponded.css" />
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
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet" />

</head>
<body>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<p id="modalHeader">TICKET DETAILS</p>
			<span class="close" onclick="closeModal()">&times;</span>
			<p id="responseContent"></p>
		</div>
	</div>

	<script>
        function goBack() {
            window.history.back();
        }

        function goToHome() {
            window.location.href = "index.jsp";
        }

        function goToNonResponded() {
            window.location.href = "http://localhost:8080/RinseRight/retrieveNonRespondedTicket";
        }

        function goToResponded() {
            window.location.href = "http://localhost:8080/RinseRight/retrieveRespondedTicket";
        }

        // Function to display modal with ticket details
        function displayModal(ticketID, inquiryType, inquiry) {
            var modal = document.getElementById("myModal");
            var responseContent = document.getElementById("responseContent");
            responseContent.innerHTML = "<strong>Inquiry Type:</strong> " + inquiryType + "<br><br><strong>Inquiry:</strong> " + inquiry;
            modal.style.display = "block";
        }

        // Function to close the modal
        function closeModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "none";
        }

        function confirmDelete(ticketID) {
            var confirmation = confirm("Are you sure you want to delete this ticket?");
            return confirmation;
        }
    </script>

	<div id="headerDiv">
		<p id="header">VIEW YOUR TICKETS</p>
		<div id="headIcon">
			<span class="material-symbols-outlined" id="homeIcon"
				onclick="goToHome()"> home </span> <span
				class="material-symbols-outlined" id="backIcon" onclick="goBack()">
				arrow_back </span>
		</div>
	</div>

	<div id="buttonDiv">
		<button class="buttons" id="responded" onclick="goToResponded()">RESPONDED</button>
		<button class="buttons" id="noResponse" onclick="goToNonResponded()">NO
			RESPONSE</button>
	</div>

	<div id="mainDiv">
		<c:forEach var="ticket" items="${nonRespondedTickets}">
			<section class="ticketDiv"
				onclick="displayModal('${ticket.ticketID}', '${ticket.inquiryType}', '${ticket.inquiry}')">
				<p class="ticketNo">TICKET ID #${ticket.ticketID}</p>
				<div id="iconDiv">
					<a
						href="<%=request.getContextPath()%>/editTicket?ticketID=${ticket.ticketID}"
						class="material-symbols-outlined edit">edit</a>
					<form id="deleteForm_${ticket.ticketID}"
						action="<%=request.getContextPath()%>/deleteTicket" method="post"
						onsubmit="return confirmDelete(${ticket.ticketID})">
						<input type="hidden" name="ticketID" value="${ticket.ticketID}">
						<button type="submit"
							class="material-symbols-outlined delete-button">delete</button>
					</form>
				</div>
			</section>
		</c:forEach>
	</div>
</body>
</html>
