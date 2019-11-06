<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page with imported header and footer</title>
</head>
<body>
<jsp:include page="my-header.html" />
<% 
	for(int i = 0; i <= 10; i++){
	out.println("<br> Printed " + i + " times");
	}
	%>

<jsp:include page="my-footer.jsp" />


</body>
</html>