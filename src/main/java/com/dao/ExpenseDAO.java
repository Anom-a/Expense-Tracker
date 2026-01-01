package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Expense;
import com.util.DBUtil;

public class ExpenseDAO {
    public List<Expense> getExpensesByUserId(int userId) {
        List<Expense> list = new ArrayList<>();
        String sql = "SELECT * FROM expenses WHERE user_id = ? ORDER BY expense_date DESC";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                list.add(new Expense(
                    rs.getInt("id"),
                    rs.getInt("user_id"),
                    rs.getString("category"),
                    rs.getDouble("amount"),
                    rs.getDate("expense_date")
                ));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public void addExpense(int userId, String category, double amount, Date date) {
        String sql = "INSERT INTO expenses (user_id, category, amount, expense_date) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, category);
            ps.setDouble(3, amount);
            ps.setDate(4, date);
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    public void deleteExpense(int expenseId) {
        String sql = "DELETE FROM expenses WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, expenseId);
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }
}