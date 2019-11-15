<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student</title>
 	<link type="text/css" rel="stylesheet" href="CSS/style.css">
 	<link type="text/css" rel="stylesheet" href="CSS/add-student-style.css">
</head>
<body>
<div id="wrapper">
		<div id="header">
			<h2 align="center">My University</h2>
	    </div>
	</div>
	
	<div id="container">
		<h3>Update Student</h3>
		<form action="StudentControllerServlet" method="GET">
		<input type="hidden" name="command" value="UPDATE"/>
		<input type="hidden" name="studentId" value="${THE_STUDENT.id}"/>
		
		<table>
			<tbody>
				<tr>
					<td><label>First name:</label></td>
					<td><input type="text" name="firstName" value="${THE_STUDENT.firstName}"/></td>
				</tr>
				<tr>
					<td><label>Last name:</label></td>
					<td><input type="text" name="lastName" value="${THE_STUDENT.lastName}"/></td>
				</tr>	
				<tr>
					<td><label>Study Period:</label></td>
					<td><input type="text" name="studyPeriod" value="${THE_STUDENT.studyPeriod}"/></td>
				</tr>	
				<tr>
					<td><label>Study Year:</label></td>
				    <td><select name="studyYear" class="drowDown" >
				    	<option value="${THE_STUDENT.studyYear}">Current Value(${THE_STUDENT.studyYear})</option>
						<option value="1">I</option>
						<option value="2">II</option>
						<option value="3">III</option>
						<option value="4">IV</option>
						<option value="5">V</option>
						</select>
					</td>
				</tr>	
				<tr>
					<td><label>Email:</label></td>
					<td><input type="text" name="email" value="${THE_STUDENT.email}"/></td>
				</tr>
				<tr>
					<td><label>Scholar Ship:</label></td>
					<td><select name="scholarShip" class="drowDown">
						<option value="${THE_STUDENT.studyYear}">
						 Current Value(<core:if test="${THE_STUDENT.scholarShip==true}">Yes</core:if>
									   <core:if test="${THE_STUDENT.scholarShip!=true}">No</core:if>)</option>
						<option value="true">Yes</option>
						<option value="false">No</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><input type="submit" value="Save" class="save"/></td>
				</tr>
				
				
			</tbody>
		
		</table> 
		
		</form>
	 </div>
	 <div>
		<button onclick="window.location.href = 'StudentControllerServlet';" class="backButton">Back</button>
	</div>

</body>
</html>