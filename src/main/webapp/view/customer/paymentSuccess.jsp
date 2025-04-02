<%@page import="com.example.model.Invoices"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .success-container {
            margin: 50px auto;
            max-width: 600px;
            text-align: center;
            padding: 30px;
            border-radius: 10px;
            background: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .success-icon {
            font-size: 80px;
            color: #28a745;
        }
        .success-message {
            font-size: 24px;
            font-weight: bold;
            color: #333333;
            margin: 20px 0;
        }
        .transaction-details {
            font-size: 16px;
            color: #666666;
        }
        .button-container {
            display: flex;
            justify-content: center;
            gap: 15px; /* Space between buttons */
            margin-top: 20px;
        }
        .btn-custom {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            color: #ffffff;
        }
        .btn-success-custom {
            background-color: #28a745;
            border: none;
        }
        .btn-success-custom:hover {
            background-color: #218838;
        }
        .btn-danger-custom {
            background-color: #dc3545;
            border: none;
        }
        .btn-danger-custom:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
	
<div class="container">
    <div class="success-container">
        <i class="fas fa-check-circle success-icon"></i>
        <p class="success-message">Payment Successful!</p>
        <p class="transaction-details">
            Thank you for your payment. Your transaction has been processed successfully.<br>
        </p>
        <div class="button-container">
            <a href="customerhome.jsp" class="btn btn-custom btn-success-custom">
                <i class="fas fa-shopping-cart"></i> Continue Shopping
            </a>
            <a href="../../logout.jsp" class="btn btn-custom btn-danger-custom">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
