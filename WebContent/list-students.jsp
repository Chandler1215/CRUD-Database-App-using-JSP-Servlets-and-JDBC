<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, web.jdbc.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Tracker App</title>
	<link type="text/css" rel="stylesheet" href="CSS/style.css">
</head>
<%
//get the students from  the request object (send by servlet)
List<Student> theStudents=
				(List<Student>)request.getAttribute("STUDENTS_LIST");

%>

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
				
					<% for (Student tempStudent : theStudents) { %>
						<tr>
							<td> <%=tempStudent.getFirstName() %> </td>
							<td> <%=tempStudent.getLastName() %> </td>
							<td> <%=tempStudent.getStudyPeriod() %> </td>
							<td> <%=tempStudent.getStudyYear() %> </td>
							<td> <%=tempStudent.getEmail() %> </td>
							<td> <%=tempStudent.getScholarShip() %> </td>
						</tr>
						<%} %>
				</table>
		</div>
	</div>
</body>
</html>