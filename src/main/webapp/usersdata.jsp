<%@ page import="entity.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="styles/root.css">
    <script src="https://kit.fontawesome.com/aa0029724a.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<%
    List<User> users = (List<User>) request.getAttribute("users");
%>
<div class="container">
    <div>
        <div class="mycontainer">
            <form action="users" method="GET">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input placeholder="enter name" class="form-control" type="text" name="name" value=""/>
                </div>
                <div class="form-group">
                    <label for="surname">Surname:</label>
                    <input placeholder="enter surname" class="form-control" type="text" name="surname" value=""/>
                </div>
                <input class="btn btn-primary" type="submit" name="save" value="Search"/>
            </form>
        </div>
        <div>
            <table class="table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Surname</th>
                    <th>Nationality</th>
                    <th>Operations</th>
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
                    <td>
                        <form action="userdata" method="POST">
                            <input type="hidden" name="id" value="<%=u.getId()%>"/>
                            <input type="hidden" name="action" value="delete"/>
                            <button class="btn btn-danger" type="submit">
                                <i class="fa-solid fa-trash"></i>
                            </button>
                        </form>
                        <form action="userdata" method="GET">
                            <input type="hidden" name="id" value="<%=u.getId()%>"/>
                            <button class="btn btn-secondary" type="submit" name="action" value="update">
                                <i class="fa-sharp fa-solid fa-pen"></i>
                            </button>
                        </form>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>
</html>
