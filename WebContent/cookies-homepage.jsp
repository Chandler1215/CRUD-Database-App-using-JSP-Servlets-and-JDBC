<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
</head>
<body>
<!--  read the favorite programming language cookie -->
<% 
	// the default ... if there are no cookies
	String favLang = "Java";
	// get the cookies from the browser request
	Cookie[] theCookies = request.getCookies();
	
	// find our favorite language cookie
	if(theCookies != null)
	
		for(Cookie tempCookie : theCookies){
			if("myApp.favoriteLanguage".equals(tempCookie.getName())){
				favLang = tempCookie.getValue();
				break;
			}
		}
	%>
<!--  Show the personalized page to user -->
Here are some articles for you about <%= favLang %>
<br></br>
Maybe you want a job like <%= favLang %> Developer
<br></br>
Some project for you written in <%= favLang %>
<br></br>

 




<a href="cookies-personalize-form.html">Here you can personalize information</a>


</body>
</html>