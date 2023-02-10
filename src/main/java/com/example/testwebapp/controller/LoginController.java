package com.example.testwebapp.controller;

import com.example.testwebapp.util.ControllerUtil;
import dao.inter.UserDaoInter;
import entity.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import main.Context;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    private UserDaoInter userDaoInter = Context.instanceUserDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("login.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        String email = request.getParameter("email");
            System.out.println(email);
        String password = request.getParameter("password");
            System.out.println(password);
        User user = userDaoInter.getUserWithEmailAndPassword(email,password);

        if(user==null){
            throw new IllegalArgumentException("Email or password is incorrect.");
        }
        request.getSession().setAttribute("loggedInUser",user);
        response.sendRedirect("users");
        }catch (Exception exception){
            ControllerUtil.erorPage(response,exception);
        }

    }
}
