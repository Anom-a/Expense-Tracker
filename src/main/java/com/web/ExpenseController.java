package com.web;

import com.dao.ExpenseDAO;
import com.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet("/expenses")
public class ExpenseController extends HttpServlet {

    private ExpenseDAO dao = new ExpenseDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. Check Session
        System.out.println("server started");
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("currentUser") : null;

        if (user == null) {
            resp.sendRedirect("login");
            return;
        }

        // 2. Fetch data for THIS user only
        req.setAttribute("expenseList", dao.getExpensesByUserId(user.getId()));
        req.setAttribute("user", user);
        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("currentUser") : null;

        if (user != null) {
            System.out.println("the user is not the issue");
            String category = req.getParameter("category");
            double amount = Double.parseDouble(req.getParameter("amount"));
            Date date = Date.valueOf(req.getParameter("date")); // Format: YYYY-MM-DD
            System.out.println("this pkg is forwarding");
            dao.addExpense(user.getId(), category, amount, date);
            
        }
        System.out.println("server ended");
        resp.sendRedirect("expenses");
    }
}