<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr > <th colspan="3"> Student Data List </th> </tr>
<tr>
		<th>First Name </th>
		<th>Last Name </th>
		<th>Email </th>
	</tr>
<core:forEach var="tempStudent" items="${student_list}" >
	<tr>
		<td>${tempStudent.firstName} </td>
		<td>${tempStudent.lastName}</td>
		<td>${tempStudent.email} </td>
	</tr>
		</core:forEach>	
</table>


</body>
</html>