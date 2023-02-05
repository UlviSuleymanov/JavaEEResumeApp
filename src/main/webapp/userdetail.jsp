<%@ page import="dao.inter.UserDaoInter" %>
<%@ page import="entity.User" %>
<%@ page import="main.Context" %><%--
  Created by IntelliJ IDEA.
  User: Ulvi
  Date: 01.02.2023
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    User u = (User) request.getAttribute("user");
%>
<div>
    <form action="UserController" method="POST">
        <input type="hidden" name="id" value="<%=u.getId()%>"/>
        <label for="name">name:</label>
        <input type="text" name="name" value="<%=u.getName()%>"/>
        <br/>
        <label for="surname">surname:</label>
        <input type="text" name="surname" value="<%=u.getSurname()%>"/>
        <input type="submit" name="save" value="Save"/>
    </form>
</div>
</body>
</html>
