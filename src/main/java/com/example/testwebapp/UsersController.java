package com.example.testwebapp;

import dao.inter.UserDaoInter;
import entity.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import main.Context;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UsersController", value = "/users.jsp")
public class UsersController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String nationalityStr = request.getParameter("nid");
            Integer nationality_id = null;
            if (nationalityStr != null && !nationalityStr.trim().isEmpty()) {
                nationality_id = Integer.parseInt(nationalityStr);
            }
            UserDaoInter userDaoInter = Context.instanceUserDao();
            List<User> users = userDaoInter.getAll(name, surname, nationality_id);
            if (users == null) {
                throw new IllegalArgumentException("Users are not defined or found");
            }
            request.setAttribute("users", users);
            request.getRequestDispatcher("usersdetails.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("error.jsp?msg=" + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
