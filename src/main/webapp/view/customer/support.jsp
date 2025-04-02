<%@page import="com.example.model.Customer"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page session="true"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Feedback Form</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<jsp:include page="customermenu.jsp"/>
<style>
body {
    background-color: #f8f9fa;
    font-family: Arial, sans-serif;
}

.feedback-container {
    max-width: 600px;
    margin: 50px auto;
    padding: 30px;
    background: #ffffff;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

.form-title {
    font-size: 1.8rem;
    font-weight: bold;
    color: #0d6efd;
    text-align: center;
    margin-bottom: 20px;
}

.btn-submit {
    background-color: #0d6efd;
    color: #ffffff;
    font-weight: bold;
}

.btn-submit:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
<% 
    Customer customer = (Customer) session.getAttribute("customer"); 
    if (customer == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if the session is invalid
    }
%>

<div class="container feedback-container">
    <div class="form-title">We Value Your Feedback!</div>
    <form method="post" action="/EcommerceApplication/AddFeedbackServlet">
        <!-- Customer Query Input -->
        <div class="mb-3">
            <label for="customerQueries" class="form-label">Your Query</label>
            <textarea class="form-control" id="customerQueries" name="customerQueries" rows="4"
                placeholder="Describe your issue or suggestion here..." required></textarea>
        </div>

        <!-- Submit Button -->
        <div class="mb-3 text-center">
            <button type="submit" class="btn btn-submit btn-lg">Submit Feedback</button>
        </div>
    </form>
</div>

</body>
</html>
