<%@page import="com.example.model.Products"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Ratings"%>
<%@page import="com.example.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/header.jsp" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Ratings</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style type="text/css">
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .table {
            margin-top: 30px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table th,
        .table td {
            text-align: center;
            vertical-align: middle;
            padding: 12px;
        }

        .table th {
            background-color: #ffebcd;
            color: #333;
            font-weight: bold;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }

        .table-striped tbody tr:nth-of-type(even) {
            background-color: #ffffff;
        }

        .table-striped tbody tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }

        .page-title {
            text-align: center;
            font-size: 2rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 30px;
        }

        .header-section {
            background-color: #007bff;
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .header-section h2 {
            margin: 0;
            font-size: 1.8rem;
        }

        .ratings-section {
            margin-top: 20px;
        }

        /* Responsive adjustments */
        @media (max-width: 767px) {
            .container {
                padding-left: 15px;
                padding-right: 15px;
            }

            .page-title {
                font-size: 1.5rem;
            }

            .table th,
            .table td {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="customermenu.jsp" />
    
    <%
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            System.out.println("Customer object is not found in session.");
        } else {
            Ratings Rating = new Ratings();
            List<Ratings> RatingsList = Rating.getRatingsByCustomerId(customer.getCustomerId());
    %>

    <div class="container">
        <!-- Page title -->
        <div class="header-section">
            <h2><u>My Ratings</u></h2>
        </div>

        <!-- Ratings Table -->
        <div class="ratings-section">
            <table class="table table-striped" id="table_id">
                <thead>
                    <tr>
                        <th>Rating ID</th>
                        <th>Product Code</th>
                        <th>Rating</th>
                        <th>Comments</th>
                        <th>Customer ID</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Ratings ratingOb : RatingsList) {
                    %>
                    <tr>
                        <td><%= ratingOb.getRatingId() %></td>
                        <td><%= ratingOb.getProductCode() %></td>
                        <td><%= ratingOb.getRating() %></td>
                        <td><%= ratingOb.getComments() %></td>
                        <td><%= ratingOb.getCustomerId() %></td>
                        <td><%= ratingOb.getDate() %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <%
        }
    %>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
