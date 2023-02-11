package com.example.testwebapp.filter;

import com.example.testwebapp.util.ControllerUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

@WebFilter(filterName = "JSPFileFilter", urlPatterns = {"*"})
public class SecurityFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        try {
            HttpServletRequest request = (HttpServletRequest) servletRequest;
            HttpServletResponse response = (HttpServletResponse) servletResponse;
            if (!request.getRequestURI().contains("/login") && request.getSession().getAttribute("loggedInUser") == null) {
                response.sendRedirect("login");
            } else {
                filterChain.doFilter(servletRequest, servletResponse);
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }

}
