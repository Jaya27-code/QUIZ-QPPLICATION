<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>

<jsp:include page="Header.jsp" />

<h2>
    Welcome 
    <%= session.getAttribute("uname") != null 
        ? session.getAttribute("uname") 
        : "User" %>
</h2>

</body>
</html>

