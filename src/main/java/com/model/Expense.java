package com.model;

import java.sql.Date;

public class Expense {
    private int id;
    private int userId;
    private String category;
    private double amount;
    private Date date;

    public Expense(int id, int userId, String category, double amount, Date date) {
        this.id = id;
        this.userId = userId;
        this.category = category;
        this.amount = amount;
        this.date = date;
    }

    public int getId() { return id; }
    public int getUserId() { return userId; }
    public String getCategory() { return category; }
    public double getAmount() { return amount; }
    public Date getDate() { return date; }
}