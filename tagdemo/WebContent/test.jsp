<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%
 // sample data
 String[] cities = {"Chisinau", "Orhei", "Craiova", "Bucuresti"};

pageContext.setAttribute("myCities", cities);
%>
 
<body>
<core:set var="stuff" value="<%= new java.util.Date() %>"/>
Time on the server is ${stuff} <br/>

<core:forEach var="tempCity" items="${myCities}">
	${tempCity} <br/>
	</core:forEach>


</body>
</html>