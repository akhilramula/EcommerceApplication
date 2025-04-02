<!DOCTYPE html>
<html lang="en">
<head>
   <jsp:include page="header.jsp"></jsp:include>
   <style>
       body {
           background-image: url('image/customerloginpic.jpg'); /* Path to your image */
           background-size: cover; /* Ensures the image covers the entire screen */
           background-position: center; /* Centers the image */
           background-repeat: no-repeat; /* Prevents the image from repeating */
           height: 100vh; /* Ensures the body takes full viewport height */
           margin: 0;
           font-family: Arial, sans-serif;
       }

       .card {
           background: rgba(255, 255, 255, 0.9); /* Adds slight transparency to the card */
           border-radius: 10px;
           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
       }

       .card-header h3 {
           color: #333; /* Dark text for the header */
       }

       .btn-primary {
           background-color: #007bff;
           border: none;
       }

       .btn-primary:hover {
           background-color: #0056b3;
       }

       a.text-decoration-none {
           color: #007bff;
       }
   </style>
</head>
<body>
<jsp:include page="loginmenu.jsp"></jsp:include>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Customer Login</h3>
                    </div>
                    <div class="card-body">
                        <form action="/EcommerceApplication/CustomerLoginValidateServlet" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">User ID (Email)</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter your email" name="email">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" placeholder="Enter your password" name="password">
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary" name="submit">Login</button>
                            </div>
                        </form>
                        <div class="text-center mt-3">
                            <p>New to this website? <a href="/EcommerceApplication/customerregistration.jsp" class="text-decoration-none">Register</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
