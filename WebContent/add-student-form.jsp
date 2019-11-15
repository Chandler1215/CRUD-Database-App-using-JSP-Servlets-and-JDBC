<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add student</title>
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
		<h3>Add Student</h3>
		<form action="StudentControllerServlet" method="GET">
		<input type="hidden" name="command" value="ADD"/>
		
		<table>
			<tbody>
				<tr>
					<td><label>First name:</label></td>
					<td><input type="text" name="firstName"/></td>
				</tr>
				<tr>
					<td><label>Last name:</label></td>
					<td><input type="text" name="lastName"/></td>
				</tr>	
				<tr>
					<td><label>Study Period:</label></td>
					<td><input type="text" name="studyPeriod"/></td>
				</tr>	
				<tr>
					<td><label>Study Year:</label></td>
				    <td><select name="studyYear" class="drowDown">
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
					<td><input type="text" name="email"/></td>
				</tr>
				<tr>
					<td><label>Scholar Ship:</label></td>
					<td><select name="scholarShip" class="drowDown">
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