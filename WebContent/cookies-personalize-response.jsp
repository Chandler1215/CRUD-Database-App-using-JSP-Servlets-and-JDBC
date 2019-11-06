<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Set your favorite language</title>
</head>

<%
	//read form data
	String favLang = request.getParameter("favoriteLanguage");

   // Create cookie
   Cookie theCookie = new Cookie("myApp.favoriteLanguage", favLang);

	// Set lifetime for cookie 
	theCookie.setMaxAge(60*60*24*365);
			
	// send cookie to browser
	response.addCookie(theCookie);

%>
<body>
	Thanks ! We have set your favorite language to : ${param.favoriteLanguage}
	
	<br></br>
	
	<a href="cookies-homepage.jsp"> Return to homepage.</a>


</body>
</html>