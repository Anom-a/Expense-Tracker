package com.expense_tracker;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/users")
public class UserServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/testdb";
    private static final String DB_USER = "testuser";
    private static final String DB_PASSWORD = "testpass";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        out.println("<html><body>");
        out.println("<h2>User List from PostgreSQL</h2>");
        out.println("<ul>");

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            out.println("<p>Error: PostgreSQL Driver not found.</p>");
            e.printStackTrace();
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

            String sql = "SELECT id, name, email FROM users";

            try (PreparedStatement statement = conn.prepareStatement(sql);
                    ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    out.println("<li>" + name + " (" + email + ")</li>");
                }
            }

        } catch (SQLException e) {
            out.println("<p>Database Connection Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }

        out.println("</ul>");
        out.println("</body></html>");
    }
}