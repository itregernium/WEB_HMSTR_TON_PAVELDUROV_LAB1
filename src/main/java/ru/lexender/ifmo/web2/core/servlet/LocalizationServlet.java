package ru.lexender.ifmo.web2.core.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

public class LocalizationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lang = request.getParameter("lang");
        Locale locale;
        if (lang == null || lang.isEmpty()) {
            locale = new Locale("ru", "RU");
        } else {
            locale = switch (lang) {
                case "de" -> new Locale("de", "DE");
                case "en" -> new Locale("en", "US");
                default -> new Locale("ru", "RU");
            };
        }

        ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
        request.setAttribute("bundle", bundle);
        request.setAttribute("locale", locale);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
