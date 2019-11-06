<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html>

<core:set var="theLocale" value="${not empty param.theLocale ? param.theLocale : pageContext.request.locale }" scope = "session" />

<fmt:setLocale value="${theLocale}" />
<fmt:setBundle basename="I18N.resources.labels" />

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<a href="i18n-messages-test.jsp?theLocale=en_US">English (US)</a>

<a href="i18n-messages-test.jsp?theLocale=de_DE">Deutsh (DE)</a>

<a href="i18n-messages-test.jsp?theLocale=es_ES">Spanish (ES)</a> <br><br/>

<fmt:message key="label.greeting" /> <br><br/>

<fmt:message key="label.firstname" /> <b><i> Bart </i></b><br/>

<fmt:message key="label.lastname" /> <b><i> Bartovskii </i></b> <br><br/>

<fmt:message key="label.welcome" /> <br>

Selected locale: ${theLocale}

</body>
</html>