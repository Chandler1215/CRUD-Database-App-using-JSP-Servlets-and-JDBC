<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP Built-in objects</title>
</head>
<body>
Request user agent : <%= request.getHeader("User-Agent") %>
<br>

Request language: <%= request.getLocale() %>

</body>
</html>