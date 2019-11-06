<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.*, tagdemo.Student"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<%
	// sample data
	List<Student> data = new ArrayList<>();

	data.add(new Student("Artur", "Bozieac", true));
	data.add(new Student("Cristi", "Cucereavii", false));
	data.add(new Student("Dan", "Papana", true));
	
	pageContext.setAttribute("myStudents", data);
%>
<body>

	<table border="1">
	
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Gold Customer</th>
		</tr>
		
	<core:forEach var="tempStudents" items="${myStudents}">
	
		<tr>
		
		<td>${tempStudents.firstName }</td>
		<td>${tempStudents.lastName }</td>
		<td>
			<core:if test="${tempStudent.goldCustomer}">
					Special Discount
			</core:if>
			
			<core:if test="${not tempStudent.goldCustomer}">
					-
			</core:if>
		</td>
		
		</tr>
		
	</core:forEach>
	
	</table>
	
	<br></br>
	
	<core:set var="data" value="coding"/>
	
	Length of the string <b>${data}</b>: ${fn:length(data)}
	<br> ${fn:toUpperCase(data)}
		<br> ${fn:startsWith(data,"cod")} <br>
		
		<core:set var="data" value="coding,eating,sleeping,repeating,getting,paid"/>
		<core:set var="actionsArray" value="${fn:split(data, ',')}" />
			<core:forEach var="action" items="${actionsArray}">
				${action} <br>
			</core:forEach>
			
					<core:set var="fun" value="${fn:join(actionsArray , '*')}" />
				${fun} <br>
		
			
			

	
</body>

</html>