<%@ page import="dao.inter.UserDaoInter" %>
<%@ page import="entity.User" %>
<%@ page import="main.Context" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    UserDaoInter userDaoInter = Context.instanceUserDao();
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String nationalityStr = request.getParameter("nid");
    Integer nationality_id = null;
    if(nationalityStr!=null && !nationalityStr.trim().isEmpty()){
        nationality_id =Integer.parseInt(nationalityStr);
    }

    List<User> users = userDaoInter.getAll(name, surname, nationality_id);
%>

<div>
    <form action="users.jsp" method="GET">
        <label for="name">name:</label>
        <input type="text" name="name" value=""/>
        <br/>
        <label for="surname">surname:</label>
        <input type="text" name="surname" value=""/>
        <input type="submit" name="save" value="Search"/>
    </form>
</div>
<div>
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Surname</th>
            <th>Nationality</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (User u : users) {
        %>
        <tr>
            <td><%=u.getName()%>
            </td>
            <td><%=u.getSurname()%>
            </td>
            <td><%=u.getNationality().getName() == null ? "N/A" : u.getNationality().getName()%>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>
</body>
</html>
