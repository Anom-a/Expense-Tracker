<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>ExpenseTracker - Master Your Money</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        primary: "#39E079",
                        "background-light": "#f6f8f7",
                        "background-dark": "#122017"
                    },
                    fontFamily: {
                        display: ["Manrope", "sans-serif"]
                    },
                    borderRadius: {
                        DEFAULT: "0.25rem",
                        lg: "0.5rem",
                        xl: "0.75rem",
                        full: "9999px"
                    }
                }
            }
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
        /* Smooth animations */
        .animate-fade-in {
            animation: fadeIn 1s ease-in-out;
        }
        .animate-slide-up {
            animation: slideUp 0.8s ease-out;
        }
        .animate-bounce-in {
            animation: bounceIn 1s ease-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes slideUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        @keyframes bounceIn {
            0% { transform: scale(0.3); opacity: 0; }
            50% { transform: scale(1.05); }
            70% { transform: scale(0.9); }
            100% { transform: scale(1); opacity: 1; }
        }
    </style>
</head>
<body class="bg-background-light dark:bg-background-dark text-[#0d121b] dark:text-white font-display animate-fade-in">
    <!-- Top Navigation -->
    <header class="sticky top-0 z-50 w-full border-b border-[#e7ebf3] dark:border-gray-800 bg-white/80 dark:bg-[#101622]/80 backdrop-blur-md">
        <div class="mx-auto flex h-16 max-w-7xl items-center justify-between px-4 sm:px-6 lg:px-8">
            <div class="flex items-center gap-2">
                <div class="flex size-8 items-center justify-center rounded-lg bg-primary/10 text-primary">
                    <span class="material-symbols-outlined text-2xl">account_balance_wallet</span>
                </div>
                <h1 class="text-xl font-bold tracking-tight text-[#0d121b] dark:text-white">ExpenseTracker</h1>
            </div>
            <div class="flex items-center gap-4">
                <button class="hidden text-sm font-semibold text-[#0d121b] hover:text-primary dark:text-gray-300 dark:hover:text-white sm:block">
                    Features
                </button>
                <button class="hidden text-sm font-semibold text-[#0d121b] hover:text-primary dark:text-gray-300 dark:hover:text-white sm:block">
                    Pricing
                </button>
                <a href="login" class="flex h-10 items-center justify-center rounded-lg bg-primary px-5 text-sm font-bold text-white transition-colors hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-primary focus:ring-offset-2 dark:focus:ring-offset-gray-900">
                    Log In
                </a>
            </div>
        </div>
    </header>
    <main class="relative flex min-h-[calc(100vh-4rem)] flex-col justify-center overflow-hidden">
        <!-- Abstract Background Decoration -->
        <div class="absolute -top-24 -right-24 -z-10 size-[500px] rounded-full bg-primary/5 blur-3xl dark:bg-primary/10"></div>
        <div class="absolute top-1/2 -left-24 -z-10 size-[400px] rounded-full bg-blue-300/10 blur-3xl dark:bg-blue-500/10"></div>
        <div class="mx-auto flex w-full max-w-7xl flex-1 flex-col justify-center px-4 py-12 sm:px-6 lg:px-8">
            <div class="grid gap-12 lg:grid-cols-2 lg:items-center lg:gap-8">
                <!-- Hero Content -->
                <div class="flex flex-col gap-6 text-center lg:text-left animate-slide-up">
                    <div class="space-y-4">
                        <div class="inline-flex items-center gap-2 rounded-full border border-primary/20 bg-primary/5 px-3 py-1 text-sm font-medium text-primary dark:border-primary/30 dark:bg-primary/10 dark:text-green-300 mx-auto lg:mx-0 w-fit">
                            <span class="relative flex size-2">
                                <span class="absolute inline-flex h-full w-full animate-ping rounded-full bg-primary opacity-75"></span>
                                <span class="relative inline-flex size-2 rounded-full bg-primary"></span>
                            </span>
                            v2.0 is now live for students!
                        </div>
                        <h1 class="text-4xl font-extrabold leading-[1.15] tracking-tight text-[#0d121b] dark:text-white sm:text-5xl lg:text-6xl">
                            Master Your Money, <br class="hidden lg:block"/>
                            <span class="bg-gradient-to-r from-primary to-blue-400 bg-clip-text text-transparent">Minus the Stress.</span>
                        </h1>
                        <p class="mx-auto max-w-2xl text-lg text-gray-600 dark:text-gray-300 lg:mx-0">
                            The simplest expense tracker for students and young pros. Stop wondering where your cash went and start saving for what matters—whether it's tuition, travel, or tacos.
                        </p>
                    </div>
                    <div class="flex flex-col items-center gap-4 sm:flex-row sm:justify-center lg:justify-start">
                        <a href="register" class="flex h-12 min-w-[160px] items-center justify-center rounded-lg bg-primary px-6 text-base font-bold text-white shadow-lg shadow-primary/25 transition-all hover:bg-green-700 hover:shadow-primary/40 focus:outline-none focus:ring-2 focus:ring-primary focus:ring-offset-2 dark:shadow-none dark:focus:ring-offset-gray-900">
                            Sign Up for Free
                        </a>
                        <button class="flex h-12 min-w-[160px] items-center justify-center gap-2 rounded-lg border border-gray-200 bg-white px-6 text-base font-bold text-gray-700 transition-colors hover:bg-gray-50 hover:text-primary dark:border-gray-700 dark:bg-[#1A2333] dark:text-gray-200 dark:hover:bg-gray-800">
                            <span class="material-symbols-outlined text-xl">play_circle</span>
                            Watch Demo
                        </button>
                    </div>
                    <!-- Social Proof / Trust -->
                    <div class="mt-4 flex flex-col items-center gap-4 lg:items-start">
                        <div class="flex items-center -space-x-2">
                            <div class="size-10 overflow-hidden rounded-full border-2 border-white bg-gray-100 dark:border-[#101622] dark:bg-gray-800" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDhgFgCujR8B7ifcv549iqrjd196F61SzuNXxG-kYUZKQj_zXuEnApxRWiBIF4-SUqsxBME-fbataoQsB2394fqdPRatAFuqTKE2lDoRY3rgSTibfluIK9UCgA-0xi1T1Qvb5YyBm3NUT7O6N0gTDspKrg91rjqgBoTDatBIr-lab3tcJjhUKOaCIDZc690HrToZSMaePTzq98mzpLWdv7KYOblAXIrOfhnw5M6CZYQvuw4eXVOkx_d8VrU8neGOjrUVAHAyB4YERQ"); background-size: cover;'></div>
                            <div class="size-10 overflow-hidden rounded-full border-2 border-white bg-gray-100 dark:border-[#101622] dark:bg-gray-800" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDD77DV7j-7f3rtRovx0N5tDXj5MDwzh68u4ZBkDAfC8TB85xJ33M-YAXj2xebvF2l-ZA1ZhS6wK3biL_Izx4KKNAh8t8mWiwlwFJXyVhdBPrFal0RGY9XArl6yvSCsOKv2BaJAran26Ma-M3zGAgtZMd4sLuK-enJzEyyDnZtKhJQr_1GkH9N9kLaM91tc0xMbXeLOLq2GMh3yCqjYaFV8TYNGEFutEmx9RkzQSKKw3sdDXbAVfbqRR2cMdwjqRicdP1XElLDuTVs"); background-size: cover;'></div>
                            <div class="size-10 overflow-hidden rounded-full border-2 border-white bg-gray-100 dark:border-[#101622] dark:bg-gray-800" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDqZwWheE6A1zxEBg9Ptv1NaOvHK0VUQB-hsnq1-sGr1ii5tgpTEJJ22Z6qTKww4V4Nzb_3OwCZcwvl_4d8aZ1m9EdSc9RAosC9ImZlcXzmRPBpcPlpKQ0mYAvC0RtCGoTUlDz8g0MLFZQGPX2nPsci4ViFukln3NoFnBzjzYQx4tOb-kftWc3Xt-wANbVDdVz3Vwbg8B1GBWWBpgIeSvJuTdyu9HIzqsALeUiyi73uP1y49-hUxr1de47C6ZJzbCxTspY74Ue1Uts"); background-size: cover;'></div>
                            <div class="size-10 overflow-hidden rounded-full border-2 border-white bg-gray-100 dark:border-[#101622] dark:bg-gray-800" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuAymPgGO6WAUagMcqHE183z6vOphAAuFpfrnf9SPAn51HQuS6ur9RpNgV-wrpp6zxmSBeAjEP3jwwjWGEkBUrksGOq50ICnamYnBxe07BrvWufnJxwY0icqZdOu8Oon2XOhge3rkkI4j8T1J-gapcqHWAt8CuCT6Pu36usv4tOYanIvpzgfvO3FSOBum-vMzLYdYlzmLCAAyOPqzpVf5S0otxX08vQUXsyBT8PiI0es-nx0G7Y0O_Kha26urnZYYiMkSM4u8fuXVwQ"); background-size: cover;'></div>
                            <div class="flex size-10 items-center justify-center rounded-full border-2 border-white bg-gray-100 text-xs font-bold text-gray-600 dark:border-[#101622] dark:bg-gray-800 dark:text-gray-300">
                                +2k
                            </div>
                        </div>
                        <p class="text-sm font-medium text-gray-500 dark:text-gray-400">
                            Trusted by <span class="font-bold text-gray-900 dark:text-white">10,000+</span> students & young pros
                        </p>
                    </div>
                </div>
                <!-- Hero Visual -->
                <div class="relative flex items-center justify-center lg:h-full animate-bounce-in">
                    <!-- Decorative background card effect -->
                    <div class="absolute inset-0 rotate-3 rounded-2xl bg-gradient-to-br from-blue-100 to-indigo-100 opacity-60 dark:from-blue-900/20 dark:to-indigo-900/20"></div>
                    <!-- Main Image Card -->
                    <div class="relative w-full overflow-hidden rounded-2xl border border-gray-100 bg-white p-2 shadow-2xl dark:border-gray-700 dark:bg-[#1A2333]">
                        <div class="aspect-[4/3] w-full rounded-xl bg-gray-50 bg-cover bg-center dark:bg-gray-900" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBZZOEzHgNKtGqlPt94HrQfHuvwDFvL5E_vspdnYhT62kPIfrsZ0uC1ZBLxArntWhSeNaHSywbvK-7moP-skopfqwRE8VKv8gd-wCIcvDBwyIInbkZgdoH5Ivcr7tuUUHots2asbtw8zW1G_AMGCdzgxVyP3RnauumXVpox0w9f38c9xes63AOP6kTofkfi-empAj_O0yYZP2DIK8RPcXo0PZKpAyu0_6_GrFqh_TC9u_CF2gMzJpUzaOaGKkNJ8fRMIbfBdh2Mt_c");'>
                            <!-- Floating Elements Overlay Mockup -->
                            <div class="absolute top-6 right-6 rounded-lg bg-white/90 p-3 shadow-lg backdrop-blur-sm dark:bg-[#101622]/90">
                                <div class="flex items-center gap-3">
                                    <div class="flex size-8 items-center justify-center rounded-full bg-green-100 text-green-600 dark:bg-green-900/30 dark:text-green-400">
                                        <span class="material-symbols-outlined text-lg">trending_up</span>
                                    </div>
                                    <div>
                                        <p class="text-xs text-gray-500 dark:text-gray-400">Savings</p>
                                        <p class="text-sm font-bold text-gray-900 dark:text-white">+$240.00</p>
                                    </div>
                                </div>
                            </div>
                            <div class="absolute bottom-6 left-6 rounded-lg bg-white/90 p-3 shadow-lg backdrop-blur-sm dark:bg-[#101622]/90">
                                <div class="flex items-center gap-3">
                                    <div class="flex size-8 items-center justify-center rounded-full bg-red-100 text-red-600 dark:bg-red-900/30 dark:text-red-400">
                                        <span class="material-symbols-outlined text-lg">local_pizza</span>
                                    </div>
                                    <div>
                                        <p class="text-xs text-gray-500 dark:text-gray-400">Last expense</p>
                                        <p class="text-sm font-bold text-gray-900 dark:text-white">-$12.50</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- Footer -->
    <footer class="border-t border-[#e7ebf3] bg-white dark:border-gray-800 dark:bg-[#101622]">
        <div class="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
            <div class="flex flex-col items-center justify-between gap-4 sm:flex-row">
                <p class="text-sm text-gray-500 dark:text-gray-400">
                    © 2025 ExpenseTracker. All rights reserved.
                </p>
                <div class="flex gap-6">
                    <a class="text-sm text-gray-500 hover:text-primary dark:text-gray-400 dark:hover:text-white" href="#">Privacy Policy</a>
                    <a class="text-sm text-gray-500 hover:text-primary dark:text-gray-400 dark:hover:text-white" href="#">Terms of Service</a>
                    <a class="text-sm text-gray-500 hover:text-primary dark:text-gray-400 dark:hover:text-white" href="#">Contact Us</a>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
