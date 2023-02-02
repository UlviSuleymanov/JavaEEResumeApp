<%@ page import="dao.inter.UserDaoInter" %>
<%@ page import="entity.User" %>
<%@ page import="main.Context" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Title</title>
    <link href="styles/styles.css" rel="stylesheet">
</head>
<body>
<div id="root">
    <%
        UserDaoInter userDaoInter = Context.instanceUserDao();
        User u = userDaoInter.getById(1);
    %>
       <p classname="content">Hello, it's <%out.println(u.getName() + " " + u.getSurname());%> here, nice to meet you.
           <br/>
        <%
            out.println(u.getProfileDesc());
        %></p>
</div>
</body>
</html>
