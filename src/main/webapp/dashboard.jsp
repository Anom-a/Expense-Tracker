<%@ page import="java.util.List" %>
<%@ page import="com.model.*" %>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>ExpenseTracker Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#135bec",
                        "background-light": "#f6f6f8",
                        "background-dark": "#101622",
                        "surface-light": "#ffffff",
                        "surface-dark": "#1a2230",
                        "text-main-light": "#0d121b",
                        "text-main-dark": "#ffffff",
                        "text-secondary-light": "#4c669a",
                        "text-secondary-dark": "#9aaebb",
                    },
                    fontFamily: {
                        "display": ["Manrope", "sans-serif"]
                    },
                    borderRadius: {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
                },
            },
        }
    </script>
    <style>
        body {
            font-family: 'Manrope', sans-serif;
        }
        .material-symbols-outlined {
            font-variation-settings:
            'FILL' 0,
            'wght' 400,
            'GRAD' 0,
            'opsz' 24
        }
        /* Custom scrollbar for cleaner look */
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: transparent;
        }
        ::-webkit-scrollbar-thumb {
            background: #cfd7e7;
            border-radius: 4px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: #a0aec0;
        }
        /* Smooth animations */
        .animate-fade-in {
            animation: fadeIn 0.5s ease-in-out;
        }
        .animate-slide-up {
            animation: slideUp 0.6s ease-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes slideUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .hover-lift {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .hover-lift:hover {
            transform: translateY(-2px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }
    </style>
</head>
<body class="bg-background-light dark:bg-background-dark font-display text-text-main-light dark:text-text-main-dark transition-colors duration-200 animate-fade-in">
<% User user = (User) request.getAttribute("user"); %>
<% List<Expense> expenseList = (List<Expense>) request.getAttribute("expenseList"); %>
<div class="min-h-screen flex flex-col">
<!-- Top Navigation -->
<nav class="sticky top-0 z-50 w-full bg-surface-light dark:bg-surface-dark border-b border-[#e7ebf3] dark:border-gray-800 px-6 py-3 shadow-sm">
<div class="max-w-7xl mx-auto flex items-center justify-between">
<div class="flex items-center gap-3">
<div class="size-8 bg-primary/10 rounded-lg flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-2xl">account_balance_wallet</span>
</div>
<h2 class="text-lg font-bold tracking-tight">ExpenseTracker</h2>
</div>
<div class="flex items-center gap-6">
<div class="hidden md:flex items-center gap-2 text-text-secondary-light dark:text-text-secondary-dark text-sm font-medium">
<span class="material-symbols-outlined text-[20px]">account_circle</span>
<span><%= user.getName() %>@university.edu</span>
</div>
<div class="flex items-center gap-4">
<button class="relative p-2 text-text-secondary-light dark:text-text-secondary-dark hover:bg-gray-100 dark:hover:bg-gray-800 rounded-full transition-colors">
<span class="material-symbols-outlined">notifications</span>
<span class="absolute top-2 right-2 size-2 bg-red-500 rounded-full"></span>
</button>
<div class="h-8 w-[1px] bg-gray-200 dark:bg-gray-700 mx-2 hidden sm:block"></div>
<a href="logout" class="flex items-center justify-center rounded-lg h-9 px-4 bg-primary hover:bg-blue-700 text-white text-sm font-bold transition-colors shadow-sm shadow-blue-500/20">
<span class="truncate">Logout</span>
</a>
</div>
</div>
</div>
</nav>
<!-- Main Content -->
<main class="flex-1 w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
<!-- Page Heading -->
<div class="flex flex-col md:flex-row md:items-end justify-between gap-4 mb-8 animate-slide-up">
<div>
<h1 class="text-3xl sm:text-4xl font-black tracking-tight mb-2">Welcome back, <%= user.getName() %></h1>
<p class="text-text-secondary-light dark:text-text-secondary-dark text-base">Here is your spending overview.</p>
</div>
<button class="flex items-center gap-2 bg-surface-light dark:bg-surface-dark border border-gray-200 dark:border-gray-700 hover:border-primary/50 text-text-main-light dark:text-text-main-dark px-5 py-2.5 rounded-lg shadow-sm transition-all hover:shadow-md group hover-lift">
<span class="material-symbols-outlined text-primary group-hover:scale-110 transition-transform">add_circle</span>
<span class="font-bold text-sm">Add Transaction</span>
</button>
</div>
<!-- Add Expense Form (Hidden by default, can be toggled with JS if needed, but for now visible) -->
<div id="addExpenseForm" class="bg-surface-light dark:bg-surface-dark p-6 rounded-xl border border-gray-200 dark:border-gray-800 shadow-sm mb-8 animate-slide-up">
<h3 class="font-bold text-lg mb-4">Add New Expense</h3>
<form action="expenses" method="POST" class="flex flex-col gap-4">
<div class="grid grid-cols-1 md:grid-cols-3 gap-4">
<input type="text" name="category" placeholder="Category (e.g. Food)" required class="px-4 py-2 rounded-lg bg-background-light dark:bg-background-dark border border-gray-200 dark:border-gray-700 text-text-main-light dark:text-text-main-dark focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all">
<input type="number" step="0.01" name="amount" placeholder="Amount" required class="px-4 py-2 rounded-lg bg-background-light dark:bg-background-dark border border-gray-200 dark:border-gray-700 text-text-main-light dark:text-text-main-dark focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all">
<input type="date" name="date" required class="px-4 py-2 rounded-lg bg-background-light dark:bg-background-dark border border-gray-200 dark:border-gray-700 text-text-main-light dark:text-text-main-dark focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all">
</div>
<button type="submit" class="w-full md:w-auto px-6 py-2 bg-primary hover:bg-blue-700 text-white font-bold rounded-lg shadow-sm transition-all hover:shadow-md">Save Expense</button>
</form>
</div>
<!-- Stats Grid -->
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
<!-- Stat Card 1 -->
<div class="bg-surface-light dark:bg-surface-dark p-6 rounded-xl border border-gray-200 dark:border-gray-800 shadow-sm flex flex-col gap-1 relative overflow-hidden group hover-lift">
<div class="absolute right-0 top-0 p-4 opacity-5 group-hover:opacity-10 transition-opacity">
<span class="material-symbols-outlined text-6xl">payments</span>
</div>
<p class="text-text-secondary-light dark:text-text-secondary-dark text-sm font-bold uppercase tracking-wider">Total Spent</p>
<div class="flex items-baseline gap-2 mt-1">
<span class="text-3xl font-bold text-primary">$1,250.00</span>
</div>
<div class="flex items-center gap-1 mt-2 text-sm">
<span class="bg-red-100 dark:bg-red-900/30 text-red-600 dark:text-red-400 px-1.5 py-0.5 rounded text-xs font-bold flex items-center">
<span class="material-symbols-outlined text-[14px]">trending_up</span> 12%
</span>
<span class="text-text-secondary-light dark:text-text-secondary-dark">vs last month</span>
</div>
</div>
<!-- Stat Card 2 -->
<div class="bg-surface-light dark:bg-surface-dark p-6 rounded-xl border border-gray-200 dark:border-gray-800 shadow-sm flex flex-col gap-1 relative overflow-hidden group hover-lift">
<div class="absolute right-0 top-0 p-4 opacity-5 group-hover:opacity-10 transition-opacity">
<span class="material-symbols-outlined text-6xl">receipt_long</span>
</div>
<p class="text-text-secondary-light dark:text-text-secondary-dark text-sm font-bold uppercase tracking-wider">Transactions</p>
<div class="flex items-baseline gap-2 mt-1">
<span class="text-3xl font-bold"><%= expenseList != null ? expenseList.size() : 0 %></span>
</div>
<div class="flex items-center gap-1 mt-2 text-sm">
<span class="text-text-secondary-light dark:text-text-secondary-dark">Total expenses</span>
</div>
</div>
<!-- Stat Card 3 -->
<div class="bg-surface-light dark:bg-surface-dark p-6 rounded-xl border border-gray-200 dark:border-gray-800 shadow-sm flex flex-col gap-1 relative overflow-hidden group hover-lift">
<div class="absolute right-0 top-0 p-4 opacity-5 group-hover:opacity-10 transition-opacity">
<span class="material-symbols-outlined text-6xl">pie_chart</span>
</div>
<p class="text-text-secondary-light dark:text-text-secondary-dark text-sm font-bold uppercase tracking-wider">Budget Status</p>
<div class="flex items-baseline gap-2 mt-1">
<span class="text-3xl font-bold">85%</span>
<span class="text-sm font-medium text-text-secondary-light dark:text-text-secondary-dark">Used</span>
</div>
<div class="w-full bg-gray-100 dark:bg-gray-700 rounded-full h-1.5 mt-3">
<div class="bg-primary h-1.5 rounded-full" style="width: 85%"></div>
</div>
</div>
</div>
<!-- Charts Section -->
<div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
<!-- Spending Chart -->
<div class="bg-surface-light dark:bg-surface-dark p-6 rounded-xl border border-gray-200 dark:border-gray-800 shadow-sm hover-lift">
<div class="flex justify-between items-start mb-6">
<div>
<h3 class="font-bold text-lg">Spending Over Time</h3>
<p class="text-text-secondary-light dark:text-text-secondary-dark text-sm">Weekly breakdown</p>
</div>
<button class="text-primary hover:bg-primary/5 p-1 rounded transition-colors">
<span class="material-symbols-outlined">more_horiz</span>
</button>
</div>
<div class="h-64 flex items-end justify-between gap-2 sm:gap-4 px-2">
<!-- Chart Bar 1 -->
<div class="flex flex-col items-center gap-2 group w-full">
<div class="w-full bg-primary/20 dark:bg-primary/20 rounded-t-lg relative h-32 group-hover:bg-primary/30 transition-all">
<div class="absolute bottom-0 w-full bg-primary rounded-t-lg transition-all duration-500 h-[60%]"></div>
</div>
<span class="text-xs font-bold text-text-secondary-light dark:text-text-secondary-dark">W1</span>
</div>
<!-- Chart Bar 2 -->
<div class="flex flex-col items-center gap-2 group w-full">
<div class="w-full bg-primary/20 dark:bg-primary/20 rounded-t-lg relative h-48 group-hover:bg-primary/30 transition-all">
<div class="absolute bottom-0 w-full bg-primary rounded-t-lg transition-all duration-500 h-[85%]"></div>
</div>
<span class="text-xs font-bold text-text-secondary-light dark:text-text-secondary-dark">W2</span>
</div>
<!-- Chart Bar 3 -->
<div class="flex flex-col items-center gap-2 group w-full">
<div class="w-full bg-primary/20 dark:bg-primary/20 rounded-t-lg relative h-40 group-hover:bg-primary/30 transition-all">
<div class="absolute bottom-0 w-full bg-primary rounded-t-lg transition-all duration-500 h-[45%]"></div>
</div>
<span class="text-xs font-bold text-text-secondary-light dark:text-text-secondary-dark">W3</span>
</div>
<!-- Chart Bar 4 -->
<div class="flex flex-col items-center gap-2 group w-full">
<div class="w-full bg-primary/20 dark:bg-primary/20 rounded-t-lg relative h-52 group-hover:bg-primary/30 transition-all">
<div class="absolute bottom-0 w-full bg-primary rounded-t-lg transition-all duration-500 h-[30%]"></div>
</div>
<span class="text-xs font-bold text-text-secondary-light dark:text-text-secondary-dark">W4</span>
</div>
</div>
</div>
<!-- Category Chart -->
<div class="bg-surface-light dark:bg-surface-dark p-6 rounded-xl border border-gray-200 dark:border-gray-800 shadow-sm flex flex-col hover-lift">
<div class="flex justify-between items-start mb-6">
<div>
<h3 class="font-bold text-lg">Category Breakdown</h3>
<p class="text-text-secondary-light dark:text-text-secondary-dark text-sm">Where your money goes</p>
</div>
<button class="text-primary hover:bg-primary/5 p-1 rounded transition-colors">
<span class="material-symbols-outlined">filter_list</span>
</button>
</div>
<div class="flex flex-1 items-center justify-center gap-8">
<div class="relative size-40 sm:size-48 rounded-full border-[12px] border-primary/20 flex items-center justify-center">
<!-- Simple CSS Donut representation -->
<div class="absolute inset-0 rounded-full border-[12px] border-primary border-t-transparent border-r-transparent rotate-45" style="clip-path: circle(50%);"></div>
<div class="absolute inset-0 rounded-full border-[12px] border-green-500 border-t-transparent border-l-transparent border-b-transparent -rotate-12" style="clip-path: circle(50%);"></div>
<div class="text-center">
<p class="text-xs font-bold text-text-secondary-light dark:text-text-secondary-dark uppercase">Top</p>
<p class="text-xl font-black text-text-main-light dark:text-text-main-dark">Food</p>
</div>
</div>
<div class="flex flex-col gap-3">
<div class="flex items-center gap-2">
<div class="size-3 rounded-full bg-primary"></div>
<span class="text-sm font-medium">Food & Drink</span>
<span class="text-sm text-text-secondary-light dark:text-text-secondary-dark ml-auto pl-2">45%</span>
</div>
<div class="flex items-center gap-2">
<div class="size-3 rounded-full bg-primary/50"></div>
<span class="text-sm font-medium">Rent</span>
<span class="text-sm text-text-secondary-light dark:text-text-secondary-dark ml-auto pl-2">30%</span>
</div>
<div class="flex items-center gap-2">
<div class="size-3 rounded-full bg-green-500"></div>
<span class="text-sm font-medium">Transport</span>
<span class="text-sm text-text-secondary-light dark:text-text-secondary-dark ml-auto pl-2">15%</span>
</div>
<div class="flex items-center gap-2">
<div class="size-3 rounded-full bg-gray-200 dark:bg-gray-600"></div>
<span class="text-sm font-medium">Others</span>
<span class="text-sm text-text-secondary-light dark:text-text-secondary-dark ml-auto pl-2">10%</span>
</div>
</div>
</div>
</div>
</div>
<!-- Recent Transactions Table -->
<div class="bg-surface-light dark:bg-surface-dark rounded-xl border border-gray-200 dark:border-gray-800 shadow-sm overflow-hidden hover-lift">
<div class="px-6 py-5 border-b border-gray-200 dark:border-gray-700 flex justify-between items-center">
<h3 class="font-bold text-lg">Recent Transactions</h3>
<button class="text-sm text-primary font-bold hover:underline">View All</button>
</div>
<div class="overflow-x-auto">
<table class="w-full text-left text-sm">
<thead class="bg-gray-50/50 dark:bg-gray-800/50 text-text-secondary-light dark:text-text-secondary-dark font-semibold uppercase tracking-wider text-xs">
<tr>
<th class="px-6 py-4">Transaction</th>
<th class="px-6 py-4">Category</th>
<th class="px-6 py-4">Date</th>
<th class="px-6 py-4 text-right">Amount</th>
<th class="px-6 py-4 text-right">Status</th>
</tr>
</thead>
<tbody class="divide-y divide-gray-100 dark:divide-gray-800">
<% if (expenseList != null) {
    for (Expense e : expenseList) { %>
<tr class="hover:bg-gray-50 dark:hover:bg-gray-800/30 transition-colors">
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="size-10 rounded-full bg-orange-100 dark:bg-orange-900/20 text-orange-600 dark:text-orange-400 flex items-center justify-center">
<span class="material-symbols-outlined">shopping_bag</span>
</div>
<div>
<p class="font-bold text-text-main-light dark:text-text-main-dark"><%= e.getCategory() %></p>
<p class="text-xs text-text-secondary-light dark:text-text-secondary-dark">Expense</p>
</div>
</div>
</td>
<td class="px-6 py-4">
<span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-100 dark:bg-gray-700 text-text-secondary-light dark:text-text-secondary-dark">
<%= e.getCategory() %>
</span>
</td>
<td class="px-6 py-4 text-text-secondary-light dark:text-text-secondary-dark">
<%= e.getDate() %>
</td>
<td class="px-6 py-4 text-right font-bold text-text-main-light dark:text-text-main-dark">
-$<%= e.getAmount() %>
</td>
<td class="px-6 py-4 text-right">
<span class="text-green-600 dark:text-green-400 font-bold text-xs flex items-center justify-end gap-1">
<span class="material-symbols-outlined text-sm">check_circle</span> Completed
</span>
</td>
</tr>
<% } } %>
</tbody>
</table>
</div>
</div>
</main>
</div>
</body>
</html>