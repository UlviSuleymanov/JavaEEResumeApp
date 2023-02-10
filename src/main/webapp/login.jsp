<%--
  Created by IntelliJ IDEA.
  User: Ulvi
  Date: 09.02.2023
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="styles/root.css">
    <script src="https://kit.fontawesome.com/aa0029724a.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="DOM/index.js"></script>

</head>
<body class="login_background">
<form action="login" method="POST">
    <div class="col-4 container login_fix_">
        <center>
            <h1>Login:</h1>
        </center>
        <div class="form-group">
            <label>Email adress</label>
            <input type="email" class="form-control" placeholder="example@mail.com" name="email"/>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" class="form-control" placeholder="example@mail.com" name="password"/>
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
    </div>
</form>
</body>
</html>
