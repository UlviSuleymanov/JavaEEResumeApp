package com.example.testwebapp.util;

import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class ControllerUtil {
    public static void erorPage(HttpServletResponse response, Exception exception) {
        try {
            exception.printStackTrace();
            response.sendRedirect("error?msg=" + exception.getMessage());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
