<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Login - ExpenseTracker</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <!-- Theme Configuration -->
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#135bec",
                        "primary-hover": "#0f4bc3",
                        "background-light": "#f6f6f8",
                        "background-dark": "#101622",
                        "surface-light": "#ffffff",
                        "surface-dark": "#1a2230",
                        "text-main": "#0d121b",
                        "text-secondary": "#4c669a",
                        "border-color": "#cfd7e7",
                        "error": "#ef4444",
                        "success": "#22c55e",
                    },
                    fontFamily: {
                        "display": ["Manrope", "sans-serif"]
                    },
                    borderRadius: {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "2xl": "1rem",
                        "full": "9999px"
                    },
                    boxShadow: {
                        'soft': '0 4px 6px -1px rgba(0, 0, 0, 0.02), 0 2px 4px -1px rgba(0, 0, 0, 0.02)',
                        'card': '0 10px 15px -3px rgba(0, 0, 0, 0.05), 0 4px 6px -2px rgba(0, 0, 0, 0.025)',
                    }
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
        .animate-bounce-in {
            animation: bounceIn 0.7s ease-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes slideUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        @keyframes bounceIn {
            0% { transform: scale(0.3); opacity: 0; }
            50% { transform: scale(1.05); }
            70% { transform: scale(0.9); }
            100% { transform: scale(1); opacity: 1; }
        }
        .hover-lift {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .hover-lift:hover {
            transform: translateY(-2px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }
        .input-focus {
            transition: all 0.2s ease;
        }
        .input-focus:focus {
            transform: scale(1.02);
        }
    </style>
</head>
<body class="bg-background-light dark:bg-background-dark text-text-main dark:text-white min-h-screen flex flex-col antialiased animate-fade-in">
    <!-- Header / Logo Area -->
    <header class="w-full px-6 py-6 md:px-12 flex justify-between items-center z-10">
        <div class="flex items-center gap-3 text-text-main dark:text-white cursor-pointer group animate-slide-up">
            <div class="size-10 text-primary bg-primary/10 rounded-xl flex items-center justify-center transition-transform group-hover:scale-105">
                <svg class="text-primary fill-current" fill="none" height="24" viewbox="0 0 48 48" width="24" xmlns="http://www.w3.org/2000/svg">
                    <path clip-rule="evenodd" d="M39.475 21.6262C40.358 21.4363 40.6863 21.5589 40.7581 21.5934C40.7876 21.655 40.8547 21.857 40.8082 22.3336C40.7408 23.0255 40.4502 24.0046 39.8572 25.2301C38.6799 27.6631 36.5085 30.6631 33.5858 33.5858C30.6631 36.5085 27.6632 38.6799 25.2301 39.8572C24.0046 40.4502 23.0255 40.7407 22.3336 40.8082C21.8571 40.8547 21.6551 40.7875 21.5934 40.7581C21.5589 40.6863 21.4363 40.358 21.6262 39.475C21.8562 38.4054 22.4689 36.9657 23.5038 35.2817C24.7575 33.2417 26.5497 30.9744 28.7621 28.762C30.9744 26.5497 33.2417 24.7574 35.2817 23.5037C36.9657 22.4689 38.4054 21.8562 39.475 21.6262ZM4.41189 29.2403L18.7597 43.5881C19.8813 44.7097 21.4027 44.9179 22.7217 44.7893C24.0585 44.659 25.5148 44.1631 26.9723 43.4579C29.9052 42.0387 33.2618 39.5667 36.4142 36.4142C39.5667 33.2618 42.0387 29.9052 43.4579 26.9723C44.1631 25.5148 44.659 24.0585 44.7893 22.7217C44.9179 21.4027 44.7097 19.8813 43.5881 18.7597L29.2403 4.41187C27.8527 3.02428 25.8765 3.02573 24.2861 3.36776C22.6081 3.72863 20.7334 4.58419 18.8396 5.74801C16.4978 7.18716 13.9881 9.18353 11.5858 11.5858C9.18354 13.988 7.18717 16.4978 5.74802 18.8396C4.58421 20.7334 3.72865 22.6081 3.36778 24.2861C3.02574 25.8765 3.02429 27.8527 4.41189 29.2403Z" fill-rule="evenodd"></path>
                </svg>
            </div>
            <h2 class="text-xl font-bold leading-tight tracking-tight">ExpenseTracker</h2>
        </div>
        <a class="hidden md:flex text-sm font-semibold text-text-secondary hover:text-primary transition-colors" href="#">
            Help Center
        </a>
    </header>
    <!-- Main Content -->
    <main class="flex-1 flex items-center justify-center p-4 sm:p-6 mb-12">
        <div class="w-full max-w-[480px] flex flex-col animate-bounce-in">
            <!-- Login Card -->
            <div class="bg-surface-light dark:bg-surface-dark rounded-2xl shadow-card border border-border-color/30 dark:border-gray-800 p-6 sm:p-10 transition-colors duration-300 hover-lift">
                <!-- Heading -->
                <div class="mb-8 text-center sm:text-left">
                    <h1 class="text-text-main dark:text-white text-3xl font-bold leading-tight mb-2 tracking-tight">Welcome back</h1>
                    <p class="text-text-secondary dark:text-gray-400 text-sm font-normal leading-relaxed">Sign in to your account to continue tracking your expenses.</p>
                </div>
                <!-- Form -->
                <form action="login" method="post" class="flex flex-col gap-5">
                    <!-- Email Field -->
                    <div class="space-y-2">
                        <label class="text-text-main dark:text-gray-200 text-sm font-semibold leading-normal" for="email">Email Address</label>
                        <div class="relative group">
                            <input class="w-full h-12 px-4 rounded-lg bg-background-light dark:bg-background-dark border border-border-color dark:border-gray-700 text-text-main dark:text-white placeholder:text-text-secondary/70 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all text-base input-focus" id="email" name="email" placeholder="you@university.edu" type="email" required/>
                        </div>
                    </div>
                    <!-- Password Field -->
                    <div class="space-y-2">
                        <label class="text-text-main dark:text-gray-200 text-sm font-semibold leading-normal" for="password">Password</label>
                        <div class="relative">
                            <input class="w-full h-12 px-4 pr-12 rounded-lg bg-background-light dark:bg-background-dark border border-border-color dark:border-gray-700 text-text-main dark:text-white placeholder:text-text-secondary/70 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all text-base input-focus" id="password" name="password" placeholder="Enter your password" type="password" required/>
                            <button class="absolute right-0 top-0 h-full px-4 text-text-secondary hover:text-primary transition-colors flex items-center justify-center focus:outline-none" type="button">
                                <span class="material-symbols-outlined" style="font-size: 20px;">visibility_off</span>
                            </button>
                        </div>
                    </div>
                    <!-- Submit Button -->
                    <button class="w-full h-12 mt-2 bg-primary hover:bg-primary-hover text-white text-base font-bold rounded-lg shadow-sm transition-all duration-200 flex items-center justify-center gap-2 transform active:scale-[0.98] hover:shadow-lg" type="submit">
                        <span>Sign In</span>
                        <span class="material-symbols-outlined text-lg">arrow_forward</span>
                    </button>
                </form>
                <!-- Footer Link -->
                <div class="mt-8 text-center">
                    <p class="text-sm text-text-secondary dark:text-gray-400">
                        Don't have an account?
                        <a class="font-bold text-primary hover:text-primary-hover hover:underline transition-all" href="register">Register here</a>
                    </p>
                </div>
            </div>
            <!-- Trust Badge / Extra Info (Optional) -->
            <div class="mt-8 text-center px-4 animate-slide-up">
                <p class="text-xs text-text-secondary/60 flex items-center justify-center gap-2">
                    <span class="material-symbols-outlined text-sm">lock</span>
                    Your data is encrypted and secure.
                </p>
            </div>
        </div>
    </main>
</body>
</html>