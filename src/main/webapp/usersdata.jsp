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
    <script src="DOM/index.js"></script>
</head>
<body>

<%
    List<User> users = (List<User>) request.getAttribute("users");
%>
<div class="container">
    <div style="display: flex; flex-direction: row; justify-content: space-between; margin: 10px">
        <h3>
            Welcome <%
            User user = (User) session.getAttribute("loggedInUser");
            out.print(user.getName());
        %>
        </h3>
        <form action="Logout" method="GET">
            <button style="margin-left: auto;" class="btn btn-secondary" type="submit">Log out</button>
        </form>
    </div>

    <div>
        <div class="mycontainer">
            <form action="users" method="GET">
                <div class="form-group">
                    <input onkeyup="typeInput()" id="nameInput" placeholder="enter name" class="form-control"
                           type="text" name="name" value=""/>
                    <label id="name"></label>
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
                    <td><%=u.getNationalityId() == null ? "N/A" : u.getCountryByNationalityId().getName()%>
                    </td>
                    <td style="display: flex; flex-direction: row;">
                        <div style="margin-right: 15px;">
                            <button onclick="setIdForDeleteButton(<%=u.getId()%>)" class="btn btn-danger"
                                    type="button" data-toggle="modal"
                                    data-target="#exampleModal">
                                <i class="fa-solid fa-trash"></i>
                            </button>
                        </div>
                        <div>
                            <form action="userdata" method="GET">
                                <input type="hidden" name="id" value="<%=u.getId()%>"/>
                                <button class="btn btn-secondary" type="submit" name="action" value="update">
                                    <i class="fa-sharp fa-solid fa-pen"></i>
                                </button>
                            </form>
                        </div>

                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </div>

</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirm Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure to delete this data? Once it's deleted it can't be restored.
            </div>
            <div class="modal-footer">
                <form action="userdata" method="POST">
                    <input type="hidden" name="id" value="" id="idForDelete">
                    <input type="hidden" name="action" value="delete">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-danger">Yes</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
