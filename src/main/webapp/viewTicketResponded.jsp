<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>RinseRight | VIEW TICKET</title>
<link rel="stylesheet" href="views/css/viewTicketResponded.css" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />
</head>
<body>
<div id="myModal" class="modal">
    <div class="modal-content">
        <p id="modalHeader">OUR RESPONSE</p>
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

    // Function to display modal with response content
    function displayModal(ticketID, inquiry, response) {
        var modal = document.getElementById("myModal");
        var responseContent = document.getElementById("responseContent");
        responseContent.innerHTML = "<strong>Inquiry:</strong> " + inquiry + "<br><br><strong>Response:</strong> " + response;
        modal.style.display = "block";
    }

    // Function to close the modal
    function closeModal() {
        var modal = document.getElementById("myModal");
        modal.style.display = "none";
    }
</script>

<div id="headerDiv">
    <p id="header">VIEW YOUR TICKETS</p>
    <div id="headIcon">
        <span class="material-symbols-outlined" id="homeIcon" onclick="goToHome()"> home </span> <span class="material-symbols-outlined" id="backIcon" onclick="goBack()"> arrow_back </span>
    </div>
</div>

<div id="buttonDiv">
    <button class="buttons" id="responded" onclick="goToResponded()">RESPONDED</button>
    <button class="buttons" id="noResponse" onclick="goToNonResponded()">NO RESPONSE</button>
</div>

<div id="mainDiv">
    <c:forEach var="ticket" items="${respondedTickets}">
        <section class="ticketDiv" onclick="displayModal('${ticket.ticketID}', '${ticket.inquiry}', '${ticket.response}')">
            <p class="ticketNo">TICKET ID #${ticket.ticketID}</p>
            <p class="ticketNo">${ticket.inquiryType}</p>
        </section>
    </c:forEach>
</div>
</body>
</html>
