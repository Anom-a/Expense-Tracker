package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    // Database Configuration
    // Ensure "testdb" matches the name of the database you created in PostgreSQL
    private static final String URL = "jdbc:postgresql://localhost:5432/testdb";
    private static final String USER = "testuser"; // PostgreSQL username
    private static final String PASSWORD = "testpass"; // PostgreSQL password

    // Static block to load the driver once when the application starts
    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("PostgreSQL JDBC Driver not found!");
            e.printStackTrace();
        }
    }

    /**
     * Returns a new Connection object to the database.
     * The caller is responsible for closing this connection.
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}