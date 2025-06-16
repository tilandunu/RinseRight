<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RinseRight | Login</title>
    <link rel="stylesheet" href="views/css/login.css" />
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
      function goToRegister() {
        window.location.href = "register.jsp";
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
    
  </head>
  <body onload="displayAlert()">
    <div id="mainHeadingDiv">
      <div id="headingDiv">
        <div id="headIcon">
          <span class="material-symbols-outlined" id="homeIcon"  onclick="goToHome()"> home </span>
          <span class="material-symbols-outlined" id="backIcon" onclick="goBack()"> arrow_back </span>
        </div>
        <div id="LogoDiv">
          <p id="headLogo">RinseRight</p>
          <p id="subHeadLogo">"Laundry Genius at Your Service"</p>
        </div>
      </div>
      <p id="Heading">LOGIN</p>
    </div>
    <form action="<%= request.getContextPath() %>/login" method="post">
      <div id="mainSectionDiv">
        <div id="mainSection2Div">
          <div class="inputDiv2">
            <p class="labelform">USERNAME</p>
            <input type="text" class="textBox2" name="username" required />
          </div>
          <div class="inputDiv2">
            <p class="labelform">PASSWORD</p>
            <input type="password" class="textBox2" name="password" required />
          </div>
        </div>
      </div>

      <div id="submitButtonDiv">
        <input type="submit" value="LOGIN" id="submitButton" />
      </div>
      <div id="loginLinkDiv">
        <p id="loginLink" onclick="goToRegister()">NO ACCOUNT?</p>
      </div>
    </form>
  </body>
</html>
