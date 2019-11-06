<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!--  Step 1 Create HTML for Form -->

<form action="todo-demo.jsp">
	Add new item: <input type="text" name="theItem"/>
	              <input type="submit" value="Submit"/>
</form>

<!--  Step 2 Add a new item -->
<%  // Get items from the session
	List<String> items = (List<String>) session.getAttribute("myToDoList");
	
	// If item didn't exist, create a new one
	if(items == null){
		items = new ArrayList<String>();
		session.setAttribute("myToDoList", items);
	}
	// see if there is a form data to add
	String theItem = request.getParameter("theItem");
    
    if ( (theItem != null) && (!theItem.trim().equals("")) ) {
       items.add(theItem);
       
       response.sendRedirect("todo-demo.jsp");
    }
%>
<!--  Step 3 Display all "To do" from the list -->
<hr>
<b>The list of items</b>
<ol>
<%
	for(String temp : items){
		out.println("<li>" + temp + "</li>");
	}
%>
</ol>


</body>
</html>