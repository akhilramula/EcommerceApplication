<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>

<style>
  .hero-section {
    background: url('image/ecommercebackground2.jpg') no-repeat center center/cover;
    height: 600px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    text-align: center;
    position: relative;
  }
  .hero-section .overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.2);
    pointer-events: none; /* Fix for blocking content */
  }
  .hero-section h1,
  .hero-section p,
  .hero-section .btn {
    z-index: 2; /* Ensures visibility above the overlay */
    position: relative;
  }
</style></head>
<body>
<jsp:include page="loginmenu.jsp"></jsp:include>

<!-- Hero Section -->
<div class="hero-section">
  <div class="overlay"></div>
  <div class="content text-white">
    <h1>Welcome to Our E-Commerce Platform</h1>
    <p>Explore the best products and deals curated just for you!</p>
    <a href="customerlogin.jsp" class="btn btn-primary btn-lg"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Shop Now</a> <!-- Ensure customerlogin.jsp exists -->
  </div>
</div>

<!-- Features Section -->
<section class="feature-section">
  <div class="container">
    <h2 class="text-center mb-5 mt-5">Why Choose Us?</h2>
    <div class="row g-4">
      <div class="col-md-4">
        <div class="feature-card text-center p-4 bg-white">
          <img src="image/delivery icon.webp" alt="Fast Delivery" class="img-fluid">
          <h5 class="mt-3">Fast Delivery</h5>
          <p>Get your orders delivered quickly and on time, every time.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="feature-card text-center p-4 bg-white">
          <img src="image/premium icon.webp" alt="Best Quality" class="img-fluid">
          <h5 class="mt-3">Best Quality</h5>
          <p>We offer only the finest products, ensuring the best value for you.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="feature-card text-center p-4 bg-white">
          <img src="image/customer service icon.webp" alt="Customer Support" class="img-fluid">
          <h5 class="mt-3">24/7 Support</h5>
          <p>Our team is always here to help with your questions and concerns.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
