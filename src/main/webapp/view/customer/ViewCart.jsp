<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.example.model.Products"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Cart"%>
<%@page import="com.example.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="../../header.jsp" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style type="text/css">
        body {
            background-color: #f4f4f9;
        }

        .container {
            margin-top: 50px;
        }

        /* Hover effect for cards */
        .card {
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background-color: #ffffff;
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px); /* Lift the card */
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2); /* Add a stronger shadow */
        }

        .card img {
            width: 100%;
            height: 200px; /* Limit the height */
            object-fit: contain; /* Ensure full image is displayed without cropping */
            border-radius: 10px 10px 0 0;
            transition: transform 0.3s ease;
        }

        .card img:hover {
            transform: scale(1.05); /* Slight zoom effect */
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }

        .card-text {
            font-size: 1rem;
            color: #777;
        }

        .card-footer {
            background-color: #f8f9fa;
            padding: 10px 20px;
            border-top: 1px solid #eee;
            text-align: right;
        }

        .delete-icon {
            color: #dc3545;
            font-size: 20px;
            cursor: pointer;
            transition: color 0.3s;
        }

        .delete-icon:hover {
            color: #ff0000;
        }

        .total-section {
            margin-top: 30px;
            text-align: right;
        }

        .total-section h3 {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .total-price {
            font-size: 1.8rem;
            color: #28a745;
            font-weight: bold;
        }

        .purchase-btn {
            font-size: 1.1rem;
            padding: 12px 30px;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            margin-top: 20px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .purchase-btn:hover {
            background-color: #0056b3;
        }

        /* Responsive styles */
        @media (max-width: 767px) {
            .total-section {
                text-align: center;
            }

            .card {
                margin-bottom: 20px;
            }
        }
    </style>

</head>

<body>
    <jsp:include page="./customermenu.jsp" />

    <%
        String orderId = "ORD" + System.currentTimeMillis(); // Generate a unique order ID
        session.setAttribute("orderId", orderId); // Set the orderId in session
    %>

    <%
    	Map<Integer, Integer> productQuantities = new HashMap<>();
        int totalAmount = 0;
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            System.out.println("Customer object is not found in session.");
        } else {
            Cart cartlist = new Cart();
            List<Cart> CartList = cartlist.getCartByCustomerId(customer.getCustomerId());
			
            int gstAmount = 0;
            int totalGst = 0; // Initialize before the loop
            for (Cart cartOb : CartList) {
                Products products = new Products();
                products = products.getProductsById(cartOb.getProductCode());
                
                int quantity = cartOb.getQuantity();
                int finalAmount = products.getCost() - (products.getCost() * products.getDiscount() / 100);
                gstAmount += (int) (finalAmount * 0.11);
                totalAmount += finalAmount + gstAmount;
                totalGst += gstAmount + quantity;
                
                productQuantities.put(products.getProductCode(), quantity);
            }

            session.setAttribute("billAmount", totalAmount);
            session.setAttribute("gstAmount", totalGst); // Store GST amount in session
            session.setAttribute("productQuantities", productQuantities);
    %>

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h3>Total Products: <%= CartList.size() %></h3>
            </div>
            <div class="col-md-6 text-end total-section">
                <h3>Total Amount: <span class="total-price">₹<%= totalAmount %>.00</span></h3>
            </div>
        </div>

        <div class="row">
            <%
                for (Cart cartOb : CartList) {
                    Products products = new Products();
                    products = products.getProductsById(cartOb.getProductCode());
            %>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="../../uploads/<%= products.getProductImage1() %>" class="card-img-top" alt="Product Image">
                    <div class="card-body">
                        <h5 class="card-title"><%= products.getProductName() %></h5>
                        <p class="card-text"><strong>Description:</strong> <%= products.getDescription() %></p>
                        <p class="card-text"><strong>Cost:</strong> ₹<%= products.getCost() %></p>
                        <p class="card-text"><strong>Discount:</strong> <%= products.getDiscount() %>%</p>
                        <p class="card-text"><strong>Final Price:</strong> ₹<%= products.getCost() - (products.getCost() * products.getDiscount() / 100) %></p>
                    </div>
                    <div class="card-footer">
                        <a href="/EcommerceApplication/DeleteCartServlet?productCode=<%= products.getProductCode() %>" class="delete-icon">
                            <i class="fas fa-trash"></i>
                        </a>
                    </div>
                </div>
            </div>
            <%
                }
            }
            %>
        </div>

        <div class="text-center">
            <a href="Payment.jsp" class="purchase-btn">Purchase Products</a>
        </div>
    </div>

    <br><br>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
