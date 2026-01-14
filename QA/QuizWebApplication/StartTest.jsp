<%@ page import="java.sql.ResultSet" %>
<%@ page import="DAO.DBConnect" %>
<%@ page import="questionbank.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Quiz</title>

<style>
.center {
    text-align: center;
    margin-top: 30px;
}
</style>

</head>
<body>

<jsp:include page="Header.jsp" />

<%
/* --------- SAFETY CHECK --------- */
String t = request.getParameter("t");
if (t == null) {
    out.println("<h3>Invalid request</h3>");
    return;
}

/* --------- VARIABLES --------- */
String subject = "";
String[] question = new String[10];
String[][] choice = new String[10][4];
String[] correctAns = new String[10];

Object qno[] = new UniqueRandomNumber().unique();

/* --------- SUBJECT LOGIC --------- */
if ("cn".equals(t)) {
    subject = "Computer Network";
    for (int i = 0; i < 10; i++) {
        int q = Integer.parseInt(qno[i].toString());
        question[i] = ComputerNetwork.nw[q];
        choice[i] = ComputerNetwork.nwchoice[q];
        correctAns[i] = ComputerNetwork.nwans[q];
    }
}
else if ("oot".equals(t)) {
    subject = "Object Oriented Technology";
    for (int i = 0; i < 10; i++) {
        int q = Integer.parseInt(qno[i].toString());
        question[i] = oot.oot[q];
        choice[i] = oot.ootchoice[q];
        correctAns[i] = oot.ootanswer[q];
    }
}
else if ("ds".equals(t)) {
    subject = "Data Structure";
    for (int i = 0; i < 10; i++) {
        int q = Integer.parseInt(qno[i].toString());
        question[i] = DataSt.ds[q];
        choice[i] = DataSt.dschoice[q];
        correctAns[i] = DataSt.dsans[q];
    }
}
else if ("se".equals(t)) {
    subject = "Software Engineering";
    for (int i = 0; i < 10; i++) {
        int q = Integer.parseInt(qno[i].toString());
        question[i] = SE.se[q];
        choice[i] = SE.sechoice[q];
        correctAns[i] = SE.seans[q];
    }
}
else if ("os".equals(t)) {
    subject = "Operating System";
    for (int i = 0; i < 10; i++) {
        int q = Integer.parseInt(qno[i].toString());
        question[i] = OS.os[q];
        choice[i] = OS.oschoice[q];
        correctAns[i] = OS.osanswer[q];
    }
}
else if ("dbms".equals(t)) {
    subject = "Database Management System";
    for (int i = 0; i < 10; i++) {
        int q = Integer.parseInt(qno[i].toString());
        question[i] = dbms.dbms[q];
        choice[i] = dbms.dbmschoice[q];
        correctAns[i] = dbms.dbmsanswer[q];
    }
}

/* --------- STORE IN SESSION --------- */
session.setAttribute("subject", subject);
session.setAttribute("correctAns", correctAns);

/* --------- DATABASE ENTRY --------- */
DBConnect db = new DBConnect();

String sql = "insert into testresult(emailid, name, subject) values('"
        + session.getAttribute("email") + "','"
        + session.getAttribute("uname") + "','"
        + subject + "')";

db.QueryExecuter(sql);

ResultSet rs = db.QueryReturner("select max(testid) from testresult");
rs.next();
int testid = rs.getInt(1);
session.setAttribute("testid", testid);

for (int i = 0; i < 10; i++) {
    String qsql = "insert into testresultdesc values("
            + testid + "," + (i + 1) + ",'"
            + question[i] + "','E','"
            + correctAns[i] + "')";
    db.QueryExecuter(qsql);
}
%>

<h2>Subject : <%= subject %></h2>

<form action="Result.jsp" method="post">

<%
for (int i = 0; i < 10; i++) {
%>
    <h3>Question <%= i + 1 %> : <%= question[i] %></h3>

    <input type="radio" name="q<%= i %>" value="A" required> A. <%= choice[i][0] %><br>
    <input type="radio" name="q<%= i %>" value="B"> B. <%= choice[i][1] %><br>
    <input type="radio" name="q<%= i %>" value="C"> C. <%= choice[i][2] %><br>
    <input type="radio" name="q<%= i %>" value="D"> D. <%= choice[i][3] %><br><br>
<%
}
%>

<div class="center">
    <button type="submit">Submit Test</button>
</div>

</form>

</body>
</html>
