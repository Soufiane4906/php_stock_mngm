<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Gestion de Stock</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/css/main/app.css">
    <link rel="stylesheet" href="assets/css/pages/login.css">
    
    <!-- Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/logo/favicon.svg" type="image/x-icon">
</head>

<body>
    <div id="auth">
        <div class="row">
            <div class="col-lg-5 col-12">
                <div id="auth-left">
                    <div class="auth-logo">
                        <img src="assets/images/logo/logo-jell.jpg" alt="Logo">
                    </div>
                    <h1 class="auth-title">Welcome Back</h1>
                    <p class="auth-subtitle">Please sign in to continue to your dashboard.</p>

                    <form action="Presentation/verifier.php" method="post" id="loginForm" class="needs-validation" novalidate>
                        <?php
                        if (isset($_GET['error'])) {
                            echo '<div class="alert alert-danger" role="alert">
                                <i class="bi bi-exclamation-circle me-2"></i>
                                Invalid username or password. Please try again.
                            </div>';
                            unset($_GET);
                        }
                        ?>
                        <div class="form-group position-relative">
                            <input type="text" class="form-control" placeholder="Username" name="login" required>
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                            <div class="invalid-feedback">
                                Please enter your username.
                            </div>
                        </div>
                        <div class="form-group position-relative">
                            <input type="password" class="form-control" placeholder="Password" name="password" required>
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                            <div class="invalid-feedback">
                                Please enter your password.
                            </div>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="rememberMe">
                            <label class="form-check-label" for="rememberMe">
                                Keep me logged in
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary" id="loginBtn">
                            Sign In
                        </button>
                    </form>
                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block"></div>
        </div>
    </div>

    <script>
        // Form validation
        document.getElementById('loginForm').addEventListener('submit', function(event) {
            if (!this.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            this.classList.add('was-validated');
        });

        // Remember me functionality
        const rememberMe = document.getElementById('rememberMe');
        const loginInput = document.querySelector('input[name="login"]');
        
        if (localStorage.getItem('rememberedUser')) {
            loginInput.value = localStorage.getItem('rememberedUser');
            rememberMe.checked = true;
        }

        rememberMe.addEventListener('change', function() {
            if (this.checked && loginInput.value) {
                localStorage.setItem('rememberedUser', loginInput.value);
            } else {
                localStorage.removeItem('rememberedUser');
            }
        });

        loginInput.addEventListener('input', function() {
            if (rememberMe.checked) {
                localStorage.setItem('rememberedUser', this.value);
            }
        });
    </script>
</body>

</html>