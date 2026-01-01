package com.web;

import java.io.IOException;
import java.sql.Date;

import com.dao.ExpenseDAO;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/expenses")
public class ExpenseController extends HttpServlet {

    private ExpenseDAO dao = new ExpenseDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("server started");
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("currentUser") : null;

        if (user == null) {
            resp.sendRedirect("login");
            return;
        }

        req.setAttribute("expenseList", dao.getExpensesByUserId(user.getId()));
        req.setAttribute("user", user);
        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("currentUser") : null;

        if (user != null) {
            String action = req.getParameter("action");
            if ("delete".equals(action)) {
                int expenseId = Integer.parseInt(req.getParameter("id"));
                dao.deleteExpense(expenseId);
            } else {
                // Add expense
                String category = req.getParameter("category");
                double amount = Double.parseDouble(req.getParameter("amount"));
                Date date = Date.valueOf(req.getParameter("date"));
                dao.addExpense(user.getId(), category, amount, date);
            }
        }
        resp.sendRedirect("expenses");
    }
}