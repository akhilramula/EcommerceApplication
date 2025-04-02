<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/header.jsp"></jsp:include>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Body Background and Text Styling */
        body {
            background-color: #f8f9fa; /* Light background for a clean look */
            font-family: 'Arial', sans-serif;
        }

        /* Main Container Styling */
        .container {
            margin-top: 50px;
        }

        /* Header Styling */
        h2 {
            font-size: 2rem;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }

        /* Admin Portal Card */
        .admin-card {
            background-color: transparent;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            text-align: center;
            margin-top: 30px;
        }

        .admin-card h3 {
            font-size: 1.8rem;
            color: #333;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .admin-card p {
            font-size: 1.1rem;
            color: #555;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 12px;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 8px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        /* Responsive Styling */
        @media (max-width: 768px) {
            h2 {
                font-size: 1.5rem;
            }

            .admin-card {
                padding: 20px;
            }

            .btn-primary {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Admin Menu (Include Admin Menu) -->
    <jsp:include page="adminmenu.jsp"></jsp:include>

    <!-- Main Content Area -->
    <div class="container">
        <h2>Welcome to Admin Portal!</h2>

        <!-- Admin Portal Card -->
        <div class="admin-card">
            <h3>Admin Dashboard</h3>
            <p>Manage products, users, and orders with ease. Your powerful control center for the E-Commerce site.</p>
            <div class="mt-4">
                <a href="/EcommerceApplication/view/admin/addproduct.jsp" class="btn btn-primary">Add Products </a>
            </div>
            <div class="mt-3">
                <a href="/EcommerceApplication/usermanagement.jsp" class="btn btn-primary">Manage Users</a>
            </div>
            <div class="mt-3">
                <a href="/EcommerceApplication/orderhistory.jsp" class="btn btn-primary">View Orders</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
