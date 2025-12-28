<%@ page import="java.util.List" %>
    <%@ page import="com.model.*" %>
        <html>

        <head>
            <title>Dashboard</title>
            <style>
                body {
                    font-family: sans-serif;
                    padding: 20px;
                }

                table {
                    border-collapse: collapse;
                    width: 100%;
                    margin-top: 20px;
                }

                th,
                td {
                    border: 1px solid #ddd;
                    padding: 8px;
                }
            </style>
        </head>

        <body>
            <% User user=(User) request.getAttribute("user"); %>

                <div style="display:flex; justify-content:space-between;">
                    <h1>Welcome, <%= user.getName() %>!</h1>
                    <a href="logout">Logout</a>
                </div>

                <!-- Form -->
                <div style="background:#f4f4f4; padding:15px; margin-bottom:20px;">
                    <h3>Add Expense</h3>
                    <form action="expenses" method="POST">
                        <input type="text" name="category" placeholder="Category (e.g. Food)" required>
                        <input type="number" step="0.01" name="amount" placeholder="Amount" required>
                        <input type="date" name="date" required>
                        <button type="submit">Save</button>
                    </form>
                </div>

                <!-- Table -->
                <table>
                    <tr>
                        <th>Date</th>
                        <th>Category</th>
                        <th>Amount</th>
                    </tr>
                    <% List<Expense> list = (List<Expense>) request.getAttribute("expenseList");
                            if (list != null) {
                            for (Expense e : list) {
                            %>
                            <tr>
                                <td>
                                    <%= e.getDate() %>
                                </td>
                                <td>
                                    <%= e.getCategory() %>
                                </td>
                                <td>$<%= e.getAmount() %>
                                </td>
                            </tr>
                            <% } } %>
                </table>
        </body>

        </html>