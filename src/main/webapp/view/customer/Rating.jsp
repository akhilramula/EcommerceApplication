<%@page import="com.example.model.Products"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../../header.jsp" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Rating</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .card {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border: none;
            border-radius: 10px;
            overflow: hidden;
        }
        .card img {
            width: 100%;  /* Ensure the image fills the width of the card */
            height: auto;  /* Maintain aspect ratio */
            object-fit: contain; /* Ensure the image is contained without distortion */
            max-height: 300px;  /* Limit the height of the image to prevent overflow */
        }
        .card-body {
            padding: 20px;
            text-align: left;
        }
        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }
        .card-text {
            font-size: 1rem;
            color: #666;
        }
        .card-footer {
            padding: 15px;
            text-align: center;
            background-color: #f1f1f1;
        }
        textarea {
            width: 100%;
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
            resize: none;
        }
        select, button {
            margin-top: 15px;
            width: 100%;
        }
    </style>
</head>
<body>
    <jsp:include page="customermenu.jsp" />
    <%
        int productCode = Integer.parseInt(request.getParameter("productCode"));
        Products products = new Products();
        products = products.getProductsById(productCode);
    %>
    <div class="container mt-5">
        <h3 class="text-center mb-4">Rate the Product</h3>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form name="f1" method="post"
                    action="/EcommerceApplication/AddToRatingServlet?productCode=<%=products.getProductCode()%>">
                    <div class="card">
                        <img src="../../uploads/<%=products.getProductImage1()%>"
                            class="card-img-top" alt="Product Image">
                        <div class="card-body">
                            <h3 class="card-title"><%=products.getProductName()%></h3>
                            <p class="card-text"><%=products.getDescription()%></p>
                            <p class="card-text"><strong>Cost:</strong> ₹<%=products.getCost()%></p>
                        </div>
                        <div class="card-footer">
                            <textarea name="comments" rows="4" placeholder="Write your comments here..."></textarea>
                            <select name="rating" id="rating" class="form-select">
                                <option value="5">⭐⭐⭐⭐⭐ - Excellent</option>
                                <option value="4">⭐⭐⭐⭐ - Good</option>
                                <option value="3">⭐⭐⭐ - Average</option>
                                <option value="2">⭐⭐ - Below Average</option>
                                <option value="1">⭐ - Poor</option>
                            </select>
                            <button type="submit" class="btn btn-primary mt-3">
                                Submit Rating
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
