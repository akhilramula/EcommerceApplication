<%@ page import="com.example.model.Products"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.model.Customer"%>
<%@ page import="com.example.model.Wishlist"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/header.jsp" />
    <style>
        /* Product Card Styling */
        .product-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
        }
        .product-card:hover {
            transform: scale(1.03);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        .product-card img {
            width: 100%;
            height: 300px;
            object-fit: contain;
            background-color: #f5f5f5;
        }
        .product-card .card-body {
            padding: 15px;
            background: #f9f9f9;
            text-align: center;
        }
        .product-card .card-title {
            font-size: 1.3rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 8px;
        }
        .product-card .card-text {
            font-size: 0.95rem;
            color: #666;
        }

        /* Footer Buttons Styling */
        .product-card .card-footer {
            background: #fff;
            border-top: 1px solid #ddd;
            display: flex;
            justify-content: space-around;
            padding: 10px;
        }

        .btn-custom {
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 5px;
            padding: 8px 12px;
            border: none;
            color: white;
            border-radius: 30px;
            transition: all 0.3s ease;
        }

        /* Delete Button - Modern Red */
        .btn-delete {
            background: linear-gradient(to right, #ff4b2b, #ff416c);
        }
        .btn-delete:hover {
            background: linear-gradient(to right, #ff3b1c, #ff3550);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 65, 108, 0.3);
        }

        /* Add to Cart Button - Green */
        .btn-cart {
            background: linear-gradient(to right, #56ab2f, #a8e063);
        }
        .btn-cart:hover {
            background: linear-gradient(to right, #4c9a26, #9fd458);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(168, 224, 99, 0.3);
        }

        /* Review Button - Orange */
        .btn-review {
            background: linear-gradient(to right, #f09819, #ffcc2f);
        }
        .btn-review:hover {
            background: linear-gradient(to right, #e1880f, #f5b827);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 204, 47, 0.3);
        }

        .btn-custom i {
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <jsp:include page="customermenu.jsp" />
    <%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("Customer object is not found in session.");
        return;
    } else {
        Wishlist wishlistProduct = new Wishlist();
        List<Wishlist> WishlistList = wishlistProduct.getAllWishlistByCustomerId(customer.getCustomerId());
    %>
    <div class="container mt-5">
        <h3 class="text-center mb-4">Wishlist Products</h3>
        <div class="row">
            <%
            for (Wishlist wishlistItem : WishlistList) {
                Products products = new Products();
                products = products.getProductsById(wishlistItem.getProductCode());

                if (products != null) {
            %>
            <div class="col-md-4 mb-4">
                <div class="product-card">
                    <!-- Product Image -->
                    <img src="../../uploads/<%=products.getProductImage1()%>"
                         alt="<%=products.getProductName()%>">
                    <!-- Product Details -->
                    <div class="card-body">
                        <h5 class="card-title"><%=products.getProductName()%></h5>
                        <p class="card-text"><%=products.getDescription()%></p>
                        <p class="card-text">
                            <strong>Cost:</strong> ₹<%=products.getCost()%>
                        </p>
                    </div>
                    <!-- Action Buttons -->
                    <div class="card-footer">
                        <!-- Delete Button -->
                        <a href="/EcommerceApplication/DeleteWishlistServlet?productCode=<%=products.getProductCode()%>"
                           class="btn btn-custom btn-delete">
                            <i class="fas fa-trash"></i> Delete
                        </a>
                        <!-- Add to Cart Button -->
                        <a href="/EcommerceApplication/AddToCartServlet?productCode=<%=products.getProductCode()%>"
                           class="btn btn-custom btn-cart">
                            <i class="fas fa-cart-plus"></i> Add to Cart
                        </a>
                        <!-- Review Button -->
                        <a href="/EcommerceApplication/view/customer/Rating.jsp?productCode=<%=products.getProductCode()%>"
                           class="btn btn-custom btn-review">
                            <i class="fas fa-star"></i> Review
                        </a>
                    </div>
                </div>
            </div>
            <%
                } else {
                    out.println("<p>Product not found.</p>");
                }
            }
            %>
        </div>
    </div>
    <%
    }
    %>
</body>
</html>
