<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="net.RinseRight.dao.ProfileDao" %>
<%@ page import="net.RinseRight.model.User" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RinseRight | Manage Profile</title>
    <link rel="stylesheet" href="views/css/manageProfile.css" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap"
      rel="stylesheet"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100..900;1,100..900&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />
    <script>
      function goToHome() {
        window.location.href = "index.jsp";
      }
    </script>
    
    <script>
	  function confirmUpdate() {
	    // Show confirmation dialog
	    var confirmation = confirm("Do you want to update profile?");
	    
	    // Return true if user clicks OK, false otherwise
	    return confirmation;
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
  </head>
  <body onload="displayAlert()">
    <div id="mainHeadingDiv">
      <div id="headingDiv">
        <div id="headIcon">
          <span
            class="material-symbols-outlined"
            id="homeIcon"
            onclick="goToHome()"
          >
            home
          </span>
          <span class="material-symbols-outlined" id="backIcon">
            arrow_back
          </span>
        </div>
        <div id="LogoDiv">
          <p id="headLogo">RinseRight</p>
          <p id="subHeadLogo">"Laundry Genius at Your Service"</p>
        </div>
      </div>
      <p id="Heading">BONJOUR!</p>
      <p id="subHeading">Manage your profile</p>
    </div>

<%
	String username = (String) session.getAttribute("username");
	if (username != null) {
	    ProfileDao profileDao = new ProfileDao();
	    User user = profileDao.getUserData(username);
	    
	    if (user != null) {
%>

    <form method="post" action="<%= request.getContextPath() %>/updateProfile" onsubmit="return confirmUpdate()">
      <div id="mainSectionDiv">
        <div id="mainSection1Div">
          <div class="inputDiv1">
            <p class="labelform">FIRST NAME</p>
            <input type="text" class="textBox1" name="firstName" value="<%= user.getFirstName() %>" required />
          </div>
          <div class="inputDiv1">
            <p class="labelform">LAST NAME</p>
            <input type="text" class="textBox1" name="lastName" value="<%= user.getLastName() %>" required />
          </div>
        </div>
        <div id="mainSection2Div">
          <div class="inputDiv2">
            <p class="labelform">EMAIL</p>
            <input type="text" class="textBox2" name="email" value="<%= user.getEmail() %>" required />
          </div>
          <div class="inputDiv2">
            <p class="labelform">PHONE NUMBER</p>
            <input type="text" class="textBox2" name="phoneNumber" value="<%= user.getPhoneNumber() %>" required />
          </div>
          <div class="inputDiv2">
            <p class="labelform">ADDRESS</p>
             <input type="text" class="textBox2" name="address" value="<%= user.getAddress() %>" required />
          </div>
        </div>
      </div>

      <div id="submitButtonDiv">
        <input type="submit" value="UPDATE PROFILE" id="submitButton" />
      </div>
    </form>
    
    <%
    }
}
%>
  </body>
</html>
