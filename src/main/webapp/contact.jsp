<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Bootstrap CSS -->
<jsp:include page="header.jsp"></jsp:include>

    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .contact-header {
            background: linear-gradient(135deg, #ff7e39, #ff4f39);
            color: white;
            text-align: center;
            padding: 50px 20px;
        }

        .contact-header h1 {
            font-size: 2.5rem;
        }

        .contact-header p {
            font-size: 1.2rem;
        }

        .contact-card {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border: none;
        }

        .contact-card h5 {
            font-size: 1.2rem;
        }

        .btn-send {
            background-color: #ff4f39;
            border: none;
        }

        .btn-send:hover {
            background-color: #ff7e39;
        }

        .social-icons a {
            color: #ff4f39 !important;
            margin: 0 10px;
            font-size: 1.5rem;
            transition: color 0.3s;
        }

        .social-icons a:hover {
            color: #ff7e39;
        }
        
        .btn-primary{
        background-color:#ff4f39 !important;
        }
    </style>
</head>
<body>
<jsp:include page="loginmenu.jsp"></jsp:include>
    <!-- Header Section -->
    <div class="contact-header">
        <h1>Contact Us</h1>
        <p>Have questions? We're here to help you!</p>
    </div>

    <!-- Contact Form Section -->
    <div class="container my-5">
        <div class="row g-4">
            <!-- Contact Information -->
            <div class="col-lg-4">
                <div class="card contact-card p-4">
                    <h5>Contact Information</h5>
                    <p class="text-muted">Feel free to reach out to us at any time. We're happy to assist you!</p>
                    <ul class="list-unstyled">
                        <li><strong>Phone:</strong> +1 123-456-7890</li>
                        <li><strong>Email:</strong> support@ecommerce.com</li>
                        <li><strong>Address:</strong> 123 Market Street, San Francisco, CA</li>
                    </ul>
                    <h5>Follow Us</h5>
                    <div class="social-icons">
                        <a href="#"><i class="bi bi-facebook"></i></a>
                        <a href="#"><i class="bi bi-twitter"></i></a>
                        <a href="#"><i class="bi bi-instagram"></i></a>
                        <a href="#"><i class="bi bi-linkedin"></i></a>
                    </div>
                </div>
            </div>

            <!-- Contact Form -->
            <div class="col-lg-8">
                <div class="card contact-card p-4">
                    <h5>Send Us a Message</h5>
                    <form>
                        <div class="mb-3">
                            <label for="name" class="form-label">Your Name</label>
                            <input type="text" class="form-control" id="name" placeholder="Enter your name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="email" placeholder="Enter your email" required>
                        </div>
                        <div class="mb-3">
                            <label for="subject" class="form-label">Subject</label>
                            <input type="text" class="form-control" id="subject" placeholder="Enter the subject" required>
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">Message</label>
                            <textarea class="form-control" id="message" rows="5" placeholder="Write your message here" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center py-4">
        <p class="text-muted mb-0">© 2024 E-Commerce. All rights reserved.</p>
    </footer>

</body>
</html>
