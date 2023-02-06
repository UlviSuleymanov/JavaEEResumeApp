package com.example.testwebapp.controller;


import dao.inter.UserDaoInter;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.Context;

import java.io.IOException;

@WebServlet(name = "UserDataController", value = "/userdata")
public class UserDataController extends HttpServlet {
    private UserDaoInter userDaoInter = Context.instanceUserDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        String action = request.getParameter("action");
        if (action.equals("update")) {
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String adress = request.getParameter("adress");

            User user = userDaoInter.getById(id);
            user.setName(name);
            user.setSurname(surname);
            user.setEmail(email);
            user.setPhone(phone);
            user.setAdress(adress);
            userDaoInter.updateUser(user);
        } else if (action.equals("delete")) {
            userDaoInter.removeUser(id);
        }
        response.sendRedirect("users");
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userIdStr = request.getParameter("id");
            if (userIdStr == null || userIdStr.trim().isEmpty()) {
                throw new IllegalArgumentException("Id is not specified");
            }
            Integer userId = Integer.parseInt(request.getParameter("id"));
            UserDaoInter userdao = Context.instanceUserDao();
            User u = userdao.getById(userId);
            if (u == null) {
                throw new IllegalArgumentException("There is no User with this id");
            }
            request.setAttribute("user", u);
            request.getRequestDispatcher("userdata.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("error?msg=" + ex.getMessage());
        }
    }
}
