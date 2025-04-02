<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="loginmenu.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>

    <!-- Custom CSS -->
    <style>
        /* Page background */
     body {
           background-image: url('image/customerloginpic.jpg'); /* Path to your image */
           background-size: cover; /* Ensures the image covers the entire screen */
           background-position: center; /* Centers the image */
           background-repeat: no-repeat; /* Prevents the image from repeating */
           height: 100vh; /* Ensures the body takes full viewport height */
           margin: 0;
           font-family: Arial, sans-serif;
       }

        /* Login Container */
        .login-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Form Title */
        .login-container h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        /* Form Inputs */
        .form-label {
            font-weight: bold;
            color: #333;
        }

        .form-control {
            border-radius: 8px;
            padding: 12px;
            font-size: 1rem;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        /* Submit Button */
        .btn-primary {
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
            font-weight: bold;
            border-radius: 8px;
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        /* Footer */
        footer {
            background-color: #343a40;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>

<body>
    <!-- Admin Login Container -->
    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="/EcommerceApplication/AdminLoginValidateServlet" method="post">
            <!-- Username Input -->
            <div class="mb-3">
                <label for="username" class="form-label">Admin Username</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
            </div>

            <!-- Password Input -->
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <!-- Role Input -->
            <div class="mb-3">
                <label for="role" class="form-label">Role</label>
                <input type="text" class="form-control" id="role" name="role" placeholder="Enter your role" required>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>

    <!-- Include Footer -->
    <footer>
        <p>&copy; 2024 E-Commerce Application</p>
    </footer>

</body>
</html>
