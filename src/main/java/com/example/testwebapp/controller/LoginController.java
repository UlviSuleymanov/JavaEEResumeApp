package com.example.testwebapp.controller;

import at.favre.lib.crypto.bcrypt.BCrypt;
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
    private static BCrypt.Verifyer verifyer = BCrypt.verifyer();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            System.out.println("password=" + password);
            User user = userDaoInter.getUserWithEmail(email);
            if (user == null) {
                throw new IllegalArgumentException("Such User Does not exist");
            }
            System.out.println("hash=" + user.getPassword());
            BCrypt.Result result = verifyer.verify(password.toCharArray(), user.getPassword().toCharArray());
            if (!result.verified) {
                throw new IllegalArgumentException("Password is incorrect");
            }
            request.getSession().setAttribute("loggedInUser", user);
            response.sendRedirect("users");
        } catch (Exception exception) {
            ControllerUtil.erorPage(response, exception);
        }

    }
}
