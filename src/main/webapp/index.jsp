<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
HttpSession Currentsession = request.getSession(false); 
boolean loggedIn = (Currentsession != null && Currentsession.getAttribute("username") != null); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="views/css/index.css" />
<script type="text/javascript" src="views/js/index.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Julius+Sans+One&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link
	href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet" />
<script src="https://kit.fontawesome.com/0320d428e2.js"></script>
<script>
    function redirectToOrder() {
        <%if (!loggedIn) {%>
            // Redirect to login page if not logged in
            window.location.href = "login.jsp"; // Change the URL to your login page
        <%} else {%>
            // Redirect to order page if logged in
            window.location.href = "order.jsp"; // Change the URL to your order page
        <%}%>
    }
    
    function redirectToViewTicket() {
        <%if (!loggedIn) {%>
            // Redirect to login page if not logged in
            window.location.href = "login.jsp"; // Change the URL to your login page
        <%} else {%>
            // Redirect to order page if logged in
            window.location.href = "http://localhost:8080/RinseRight/retrieveRespondedTicket"; // Change the URL to your order page
        <%}%>
    }
    
    function redirectToActiveOrders() {
        <%if (!loggedIn) {%>
            // Redirect to login page if not logged in
            window.location.href = "login.jsp"; // Change the URL to your login page
        <%} else {%>
            // Redirect to order page if logged in
            window.location.href = "http://localhost:8080/RinseRight/currentOrders"; // Change the URL to your order page
        <%}%>
    }
    
    function redirectToTickets() {
        <%if (!loggedIn) {%>
            // Redirect to login page if not logged in
            window.location.href = "login.jsp"; // Change the URL to your login page
        <%} else {%>
            // Redirect to order page if logged in
            window.location.href = "Ticket.jsp"; // Change the URL to your order page
        <%}%>
    }
    
    function redirectToProfile() {
        <%if (!loggedIn) {%>
            // Redirect to login page if not logged in
            window.location.href = "login.jsp"; // Change the URL to your login page
        <%} else {%>
            // Redirect to order page if logged in
            window.location.href = "manageProfile.jsp"; // Change the URL to your order page
        <%}%>
    }
</script>
<script>
	function goToManageAccount(){
		window.location.href = "manageProfile.jsp";
	}	
	function goToRegister() {
		window.location.href = "register.jsp";
	}
	function goToLogin() {
		  window.location.href = "login.jsp";
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
	  function confirmUpdate() {
	    // Show confirmation dialog
	    var confirmation = confirm("Do you want to logout?");
	    
	    // Return true if user clicks OK, false otherwise
	    return confirmation;
	  }
	</script>

<title>RinseRight</title>

</head>
<body onload="displayAlert()">
	<div id="sidebar">
		<div id="sidebarLinksDiv">
			<button class="sidebarLinks" onclick="redirectToViewTicket()">-
				VIEW TICKETS</button>
			<button class="sidebarLinks" onclick="redirectToProfile()">- MANAGE PROFILE</button>
			<button class="sidebarLinks" onclick = "redirectToTickets()">- RAISE A TICKET</button>
			<button class="sidebarLinks" onclick ="redirectToActiveOrders()">- CHECK CURRENT ORDERS</button>
		</div>
	</div>
	<div id="content">
		<div id="navDiv">
			<div id="menuDiv">
				<span class="material-symbols-outlined" id="menuicon"> menu </span>
				<button id="homeButton">MENU</button>
			</div>
			<div id="registerDiv"
				<%if (loggedIn)
	out.print("style=\"display:none;\"");%>>
				<button id="registerButton" onclick="goToRegister()">
					<p id="registerButtonFont">REGISTER</p>
				</button>
				<button id="loginButton" onclick="goToLogin()">Already have
					an account?</button>
			</div>

			<div id="manageAccountDiv"
				<%if (!loggedIn)out.print("style=\"display:none;\"");%>>
				<button id="manageAccountButton" onclick="goToManageAccount()">
					Manage Account</button>
				<form action="<%=request.getContextPath()%>/logout" method="get" onsubmit="return confirmUpdate()">
					<button id="logoutButton" type="submit">Logout</button>
				</form>
			</div>

		</div>
		<div id="titleDiv">
			<p id="title">RinseRight</p>
			<p id="subtitle">"Laundry Genius at Your Service"</p>
		</div>
		<div id="placeOrderDiv">
			<button id="placeOrderButton" onclick="redirectToOrder()">
				<p id="buttonFont">PLACE YOUR ORDER </p>
			</button>
		</div>
		<div id="imgDiv">
			<img src="views/images/2105.i203.006.F.m004.c9.laundry cartoon.jpg"
				alt="LOADING..." id="image" width="100%" />
		</div>

		<div id="pr1Div">
			<p id="pr1">
				"Welcome to RinseRight, your premier destination for effortless
				laundry management. <br />At RinseRight, we're committed to
				revolutionizing the way you handle your laundry needs. With our
				intuitive platform and dedicated team, we strive to make laundry
				management simple, efficient, and stress-free."
			</p>
		</div>
		<div id="line1Div">
			<hr id="line1" />
		</div>

		<div id="whyChooseUsDiv">
			<div id="chooseUsImgDiv">
				<img src="views/images/pexels-ekaterina-belinskaya-4700383.jpg"
					alt="loading" width="600px" height="600px" />
			</div>
			<div id="chooseUsContentDiv">
				<p id="chooseUsTopic">WHY CHOOSE US?</p>
				<p id="chooseUsContent">
					"Why choose RinseRight? Because we prioritize your convenience
					above all else. Our user-friendly interface allows you to place
					orders, track progress, and manage your laundry preferences with
					ease.<br /> <br /> Plus, our experienced team ensures that your
					laundry is handled with care and precision, delivering outstanding
					results every time."
				</p>
			</div>
		</div>

		<div id="mainCardDiv">
			<section class="cardDiv">
				<section class="subCardDiv">
					<section class="subsubCardDiv">
						<div class="sectionContent">
							<span class="material-symbols-outlined" id="verfiedicon">
								verified </span>
							<p class="sectionTopic">Premium Service</p>
							<p class="sectionPara">
								"Experience the epitome of luxury with our premium laundry
								service. From exquisite attention to detail to the finest
								quality care for your garments, our team goes above and beyond
								to deliver an unparalleled laundry experience."<br /> <br />"Elevate
								your laundry experience with our premium service. With
								meticulous handling, advanced cleaning techniques, and exclusive
								add-on options, we ensure that every item receives the VIP
								treatment it deserves."
							</p>
						</div>
					</section>
				</section>
			</section>
			<section class="cardDiv">
				<section class="subCardDiv">
					<section class="subsubCardDiv">
						<div class="sectionContent">
							<span class="material-symbols-outlined" id="convenienceicon">
								bolt </span>
							<p class="sectionTopic">Convenience</p>
							<p class="sectionPara">
								"Say goodbye to laundry day hassles with our convenient laundry
								management system. With seamless online booking, flexible pickup
								and delivery options, and hassle-free scheduling, we make
								laundry effortless and convenient for you."<br /> <br /> "At
								RinseRight, convenience is our top priority. With our
								user-friendly platform, you can place orders, track progress,
								and manage your laundry preferences anytime, anywhere. Laundry
								day has never been easier!""
							</p>
						</div>
					</section>
				</section>
			</section>
			<section class="cardDiv">
				<section class="subCardDiv">
					<section class="subsubCardDiv">
						<div class="sectionContent">
							<span class="material-symbols-outlined" id="timericon">
								hourglass </span>
							<p class="sectionTopic">24x7 Availability</p>
							<p class="sectionPara">
								"Enjoy the convenience of round-the-clock service with our 24/7
								availability. Whether it's early morning or late at night, our
								team is here to meet your laundry needs whenever you need us." <br />
								<br /> "With our 24/7 availability, laundry assistance is just
								a click or call away. Need a last-minute pickup or have an
								urgent laundry request? Don't worry - we've got you covered, day
								or night."
							</p>
						</div>
					</section>
				</section>
			</section>
		</div>

		<div id="footerDiv">
			<div id="footerLogoDiv">
				<p id="footerLogoHead">RinseRight</p>
				<p id="footerLogoSaubHead">"Laundry Genius at Your Service"</p>
				<p id="footerAddress">212, Galle Road, Colombo 03</p>
			</div>
			<div id="footerlineDiv"></div>
			<div id="footerLinksDiv">
				<p id="footerLinkHead">SITE LINKS</p>
				<hr id="linksLine" />
				<p class="footerLinks">CONTACT US</p>
				<p class="footerLinks">ABOUT US</p>
				<p class="footerLinks">LOCATIONS</p>
				<p class="footerLinks">PROMOTIONS</p>
			</div>
			<div id="mainFinalDiv">
				<div id="getLatestUpdatesDiv">
					<p id="getLatestUpdatestext">Get the latest updates</p>
					<form action="" id="footerForm">
						<input type="text" id="getLatestUpdatesBox"
							placeholder="ENTER YOUR EMAIL ADDRESS" />
					</form>
				</div>
				<div id="followusDivMain">
					<div id="followusDiv">
						<p id="followustext">FOLLOW US</p>
						<div id="followUsIconDiv">
							<span class="fa fa-facebook" aria-hidden="true" id="facebook"></span>
							<span class="fa fa-instagram" aria-hidden="true" id="instagram"></span>
							<span class="fa-brands fa-x-twitter" id="twitter"></span>
						</div>
					</div>
					<p id="trademark">©2024LATIL , Marketing agency, Sri Lanka,
						All rights reserved</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
