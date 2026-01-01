package com.web;

import java.io.IOException;

import com.dao.UserDAO;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = userDAO.loginUser(req.getParameter("email"), req.getParameter("password"));

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("currentUser", user); 
            resp.sendRedirect("expenses");
        } else {
            req.setAttribute("error", "Invalid Credentials");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}