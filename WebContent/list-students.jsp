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
			<h2 align="center">My University</h2>
	    </div>
	</div>
	
	<div id="container">
		<div id="content">
		<!-- Put new button: Add Student -->
		<input type="button" value="Add Student"
		onclick="window.location.href='add-student-form.jsp'; return false;"
		class="add-student-button"
		/>
				<table border="1">
					<th>First Name</th>
					<th>Last name</th>
					<th>Study Period</th>
					<th>Study Year</th>
					<th>Email</th>
					<th>Scholarship</th>
					<th>Action</th>
				
					<core:forEach var="tempStudent" items="${STUDENTS_LIST}">
					<!--  set up a link for each student  -->
					<core:url var="tempLink" value="StudentControllerServlet">
						<core:param name="command" value="LOAD"/>
						<core:param name="studentId" value="${tempStudent.id}"/>
					</core:url>
					
					<!--  set up a link to delete  -->
					<core:url var="deleteLink" value="StudentControllerServlet">
						<core:param name="command" value="DELETE"/>
						<core:param name="studentId" value="${tempStudent.id}"/>
					</core:url>
					
					
						<tr>
							<td> ${tempStudent.firstName } </td>
							<td> ${tempStudent.lastName } </td>
							<td> ${tempStudent.studyPeriod } </td>
							<td><core:choose>
 									 <core:when test="${tempStudent.studyYear==1}">I</core:when>
  									 <core:when test="${tempStudent.studyYear==2}">II</core:when>
   							 		 <core:when test="${tempStudent.studyYear==3}">III</core:when>
   							 		 <core:when test="${tempStudent.studyYear==4}">IV</core:when>
   							 		 <core:when test="${tempStudent.studyYear==5}">V</core:when>
  									 <core:otherwise>-</core:otherwise>
								</core:choose>
							</td>
							<td> ${tempStudent.email }</td>
							<td><core:if test="${tempStudent.scholarShip==true}">Yes</core:if>
								<core:if test="${tempStudent.scholarShip!=true}">No</core:if></td>
							
							<td><a href="${tempLink}" class="button">Update</a>
								<a href="${deleteLink}" class="button" 
								onclick="if (!(confirm('Are you sure you want to delete this student?')))return false">Delete</a>
							</td>
							
						</tr>
					</core:forEach>
						
				</table>
		 </div>
	 </div>
</body>
</html>