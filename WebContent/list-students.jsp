<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Tracker App</title>
	<link type="text/css" rel="stylesheet" href="CSS/style.css">
</head>


<body>
	<div id="wrapper">
		<div id="header">
			<h2 align="center">Our University</h2>
	    </div>
	</div>
	
	<div id="container">
		<div id="content">
				<table border="1">
					<th>First Name</th>
					<th>Last name</th>
					<th>Study Period</th>
					<th>Study Year</th>
					<th>Email</th>
					<th>Scholarship</th>
				
					<core:forEach var="tempStudent" items="${STUDENTS_LIST}">
						<tr>
							<td> ${tempStudent.firstName } </td>
							<td> ${tempStudent.lastName } </td>
							<td> ${tempStudent.studyPeriod } </td>
							<td> ${tempStudent.studyYear }</td>
							<td> ${tempStudent.email }</td>
							<td> <core:if test="${tempStudent.scholarShip==true}">Yes</core:if> 
							     <core:if test="${tempStudent.scholarShip!=true}">No</core:if></td>
						</tr>
					</core:forEach>
						
				</table>
		 </div>
	 </div>
</body>
</html>