package ru.lexender.ifmo.web2.core.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

public class ControllerServlet extends HttpServlet {
    private final AreaCheckServlet areaCheckServlet = new AreaCheckServlet();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String path = request.getServletPath();
        if (path.equals("/check")) {
            areaCheckServlet.doGet(request, response);
        } else {
            String lang = request.getParameter("lang");
            Locale locale;
            if (lang == null || lang.isEmpty()) {
                locale = new Locale("ru", "RU");
            } else {
                switch (lang) {
                    case "de":
                        locale = new Locale("de", "DE");
                        break;
                    case "en":
                        locale = new Locale("en", "US");
                        break;
                    case "ru":
                    default:
                        locale = new Locale("ru", "RU");
                        break;
                }
            }


            ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
            request.setAttribute("bundle", bundle);
            request.setAttribute("locale", locale);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
