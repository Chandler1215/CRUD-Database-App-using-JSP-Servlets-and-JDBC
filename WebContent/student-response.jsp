<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation</title>
</head>
<body>
The student is confirmed: 
<%= request.getParameter("firstName")%> <%= request.getParameter("lastName")%> 
<br>
Student's country : ${param.country}
<br>
His favorite programming language(s) is :
<ul>	 
	  <%
		String[] langs = request.getParameterValues("favoriteLanguage");
	  	if(langs!=null)
			for(String tempLang : langs){
			out.println("<li>" + tempLang + "</li>");
				}
	  %>
</ul>
</body>
</html>