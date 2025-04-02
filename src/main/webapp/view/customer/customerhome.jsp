<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Products"%>
<html lang="en">
<head>
    <jsp:include page="/header.jsp"></jsp:include>
    <jsp:include page="customermenu.jsp" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Include the CSS Styles -->
    <style>
        /* CSS code from above */
    body {
        background-image: url('../../image/customerpagebg2.png'); /* Replace with actual image path */
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
        font-family: 'Arial', sans-serif;
    }

    .product-card {
        border: 1px solid #ddd;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        height: 100%;
    }

    .product-card:hover {
        transform: scale(1.05);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }

    .product-card img {
        width: 100%;
        height: 300px; /* Keeps a consistent height */
        object-fit: contain; /* Ensures the entire image is visible */
        background-color: white; /* Adds a background for non-rectangular images */
    }

    .product-card .card-body {
        padding: 15px;
        background: #f9f9f9;
    }

    .product-card .card-title {
        font-size: 1.2rem;
        font-weight: bold;
        color: #333;
    }

    .product-card .card-text {
        font-size: 0.95rem;
        color: #666;
    }

    .product-card .price {
        color: #28a745;
        font-weight: bold;
        font-size: 1rem;
    }

    .product-card .card-footer {
        background: #fff;
        border-top: 1px solid #ddd;
        display: flex;
        justify-content: space-around;
        padding: 10px;
    }

    .action-icon {
        font-size: 1.3rem;
        color: #6c757d;
        margin: 0 10px;
        transition: color 0.3s ease;
    }

    .action-icon:hover {
        color: #ff5722;
    }

    /* Carousel styles */
    .product-presentation {
        margin: 20px auto;
        width: 90%;
        max-width: 1200px;
        overflow: hidden;
    }

   .carousel-inner img {
    width: 100%;
    height: 500px;
    object-fit: contain;  /* Ensure the full image is visible */
    background-color: transparent;  /* Optional: a background color in case the image leaves empty space */
}


    .carousel-indicators button {
        background-color: #555;
    }

    .carousel-indicators .active {
        background-color: #ff5722;
    }   

    </style>
</head>
<body>
<%
    Products product = new Products();
    List<Products> productList = new ArrayList<Products>();

    String search = request.getParameter("search");
    if (search == null) {
        productList = product.getAllProducts(null);
    } else {
        productList = product.getAllProducts(search);
    }
%>

<div class="container my-5">
    <!-- Image Presentation Carousel -->
    <div id="presentationCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#presentationCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#presentationCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#presentationCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#presentationCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
            <button type="button" data-bs-target="#presentationCarousel" data-bs-slide-to="4" aria-label="Slide 5"></button>
            <button type="button" data-bs-target="#presentationCarousel" data-bs-slide-to="5" aria-label="Slide 6"></button>

        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../../image/homepagepic1.jpg" class="d-block w-100" alt="Presentation Image 1">
            </div>
            <div class="carousel-item">
                <img src="../../image/homepagepic3.webp" class="d-block w-100" alt="Presentation Image 2">
            </div>
            <div class="carousel-item">
                <img src="../../image/presentation5.png" class="d-block w-100" alt="Presentation Image 3">
            </div>
            <div class="carousel-item">
                <img src="../../image/presentation1.png" class="d-block w-100" alt="Presentation Image 4">
            </div>
            <div class="carousel-item">
                <img src="../../image/presentation2.png" class="d-block w-100" alt="Presentation Image 4">
            </div>
            <div class="carousel-item">
                <img src="../../image/homepagepic2.jpg" class="d-block w-100" alt="Presentation Image 4">
            </div>
            
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#presentationCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#presentationCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>

<div class="container my-5">
    <h2 class="text-center mb-4 text-primary fw-bold">Our Products</h2>

    <!-- Product Cards -->
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <%
        for (Products productOb : productList) {
        %>
        <div class="col">
            <div class="product-card">
                <img src="../../uploads/<%=productOb.getProductImage1()%>" class="card-img-top" alt="<%=productOb.getProductName()%>">
                <div class="card-body">
                    <h5 class="card-title"><%=productOb.getProductName()%></h5>
                    <p class="card-text"><%=productOb.getDescription()%></p>
                    <p class="card-text"><strong>Price:</strong> &#8377; <%=productOb.getCost()%></p>
                </div>
                <div class="card-footer text-center">
                    <a href='/EcommerceApplication/AddToWishlistServlet?productCode=<%=productOb.getProductCode()%>' class="btn btn-outline-danger me-2"><i class="fas fa-heart"></i> Wishlist</a>
                    <a href='/EcommerceApplication/AddToCartServlet?productCode=<%=productOb.getProductCode()%>' class="btn btn-outline-primary me-2"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                    <a href='/EcommerceApplication/view/customer/Rating.jsp?productCode=<%=productOb.getProductCode()%>' class="btn btn-outline-warning"><i class="fas fa-star"></i> Reviews</a>
                </div>
            </div>
        </div>
        <%
        }
        %>
    </div>
</div>

<jsp:include page="../../footer.jsp" />

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
