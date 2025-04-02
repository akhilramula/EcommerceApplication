<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - E-Commerce</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .hero-section {
            background: linear-gradient(135deg, #ff7e39, #ff4f39);
            color: white;
            padding: 60px 20px;
            text-align: center;
        }

        .hero-section h1 {
            font-size: 3rem;
            margin-bottom: 20px;
        }

        .hero-section p {
            font-size: 1.2rem;
            line-height: 1.6;
        }

        .about-content {
            padding: 50px 20px;
        }

        .about-card {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border: none;
            background-color: #ffffff;
            margin-bottom: 30px;
        }

        .mission-section {
            background-color: #ffffff;
            padding: 50px 20px;
            text-align: center;
        }

        .mission-section h2 {
            margin-bottom: 20px;
        }

        .team-section img {
            border-radius: 50%;
            max-width: 100%;
            height: auto;
        }

        .team-card {
            text-align: center;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border: none;
            margin-bottom: 20px;
        }

        .footer {
            background-color: #333;
            color: white;
            padding: 20px 0;
            text-align: center;
        }

        .footer a {
            color: #ff7e39;
            text-decoration: none;
        }

        .footer a:hover {
            color: #ff4f39;
        }
    </style>
</head>
<body>
<jsp:include page="loginmenu.jsp"></jsp:include>
    <!-- Hero Section -->
    <div class="hero-section">
        <h1>About Us</h1>
        <p>Learn more about who we are and our mission to make your shopping experience seamless and enjoyable.</p>
    </div>

    <!-- About Section -->
    <div class="about-content container">
        <div class="row g-4">
            <div class="col-lg-6">
                <div class="card about-card p-4">
                    <h3>Who We Are</h3>
                    <p>
                        We are an innovative e-commerce platform dedicated to bringing you the best shopping experience. 
                        With a diverse range of products and a user-friendly interface, we make online shopping simple, 
                        reliable, and enjoyable for everyone.
                    </p>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card about-card p-4">
                    <h3>What We Offer</h3>
                    <p>
                        From the latest electronics to trendy fashion and everything in between, our platform is your one-stop 
                        shop for all your needs. With secure payment options and quick delivery services, shopping with us is stress-free.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Mission Section -->
    <div class="mission-section">
        <h2>Our Mission</h2>
        <p>
            Our mission is to revolutionize the way people shop by providing high-quality products, excellent customer service, 
            and a seamless online shopping experience. We aim to connect customers with the best brands and ensure customer satisfaction.
        </p>
    </div>

    <!-- Team Section -->
    <div class="container my-5">
        <h2 class="text-center mb-5">Meet Our Team</h2>
        <div class="row g-4">
            <div class="col-lg-3 col-md-6">
                <div class="card team-card">
                    <img src="https://via.placeholder.com/150" alt="Team Member" class="img-fluid mb-3">
                    <h5>John Doe</h5>
                    <p class="text-muted">CEO & Founder</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="card team-card">
                    <img src="https://via.placeholder.com/150" alt="Team Member" class="img-fluid mb-3">
                    <h5>Jane Smith</h5>
                    <p class="text-muted">CTO</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="card team-card">
                    <img src="https://via.placeholder.com/150" alt="Team Member" class="img-fluid mb-3">
                    <h5>Mike Johnson</h5>
                    <p class="text-muted">Marketing Head</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="card team-card">
                    <img src="https://via.placeholder.com/150" alt="Team Member" class="img-fluid mb-3">
                    <h5>Sarah Brown</h5>
                    <p class="text-muted">Customer Support</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>© 2024 E-Commerce. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
