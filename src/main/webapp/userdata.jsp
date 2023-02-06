<%@ page import="entity.User" %>


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
    User u = (User) request.getAttribute("user");
%>
<div class="container">
    <div>
        <h1>
            Change <%=u.getName()%>'s personal details
        </h1>
        <div>
            <form class="form" action="userdata" method="POST">
                <input type="hidden" name="id" value="<%=u.getId()%>"/>
                <label for="name">Name:</label>
                <input type="text" name="name" value="<%=u.getName()%>"/>
                <br/>
                <label for="surname">Surname:</label>
                <input type="text" name="surname" value="<%=u.getSurname()%>"/>
                <br/>
                <label for="email">Email:</label>
                <input type="text" name="email" value="<%=u.getEmail()%>"/>
                <br/>
                <label for="phone">Phone:</label>
                <input type="text" name="phone" value="<%=u.getPhone()%>"/>
                <br/>
                <label for="adress">Adress:</label>
                <input type="text" name="adress" value="<%=u.getAdress()%>"/>
                <input type="submit" name="action" value="update"/>
            </form>
        </div>

    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>
</html>
