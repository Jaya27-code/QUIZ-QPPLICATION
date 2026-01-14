<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Quiz Web App</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="Welcome.jsp">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Test
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="StartTest.jsp?t=cn">Computer Network</a></li>
          <li><a href="StartTest.jsp?t=os">OS</a></li>
          <li><a href="StartTest.jsp?t=se">SE</a></li>
          <li><a href="StartTest.jsp?t=ds">DS</a></li>
          <li><a href="StartTest.jsp?t=oot">OOT</a></li>
          <li><a href="StartTest.jsp?t=dbms">DBMS</a></li>
        </ul>
      </li>
      
      <li><a href="ResultHistory.jsp">Result History</a></li>
      
      <li><a href="top5.jsp">Top 5 Result</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="SignOut.jsp"><span class="glyphicon glyphicon-log-in"></span> Sign Out</a></li>
    </ul>
  </div>
</nav>

</body>
</html>