<%@page import="java.util.List"%>
<%@page import="com.example.model.Support"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Feedbacks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <jsp:include page="customermenu.jsp"/>
    <style>
        body {
            background-color: #f4f7f6;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 30px;
        }

        .card {
            margin-bottom: 20px;
        }

        .feedback-id {
            font-weight: bold;
            font-size: 1.2rem;
            color: white;
        }

        .feedback-date,
        .feedback-content {
            font-size: 1rem;
            color: #333;
        }

        .card-header {
            background-color: #007bff;
            color: white;
        }

        .card-body {
            background-color: #f8f9fa;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">Your Feedbacks</h2>

        <% 
            Support support1 = new Support();
            List<Support> feedbackList = support1.getAllFeedback();
            if (feedbackList != null && !feedbackList.isEmpty()) {
        %>

        <div class="row">
            <% for(Support support : feedbackList) { %>
                <div class="col-md-6 col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <span class="feedback-id">Feedback ID: <%= support.getFeedbackId() %></span>
                        </div>
                        <div class="card-body">
                            <form method="post" action="/EcommerceApplication/UpdateFeedbackServlet">
                                <input type="hidden" name="feedbackId" value="<%= support.getFeedbackId() %>">

                                <label>Date:</label>
                                <input type="text" class="form-control" name="date" value="<%= support.getDate() %>" readonly>

                                <label>Customer ID:</label>
                                <input type="text" class="form-control" name="customerId" value="<%= support.getCustomerId() %>" readonly>

                                <label>Customer Query:</label>
                                <textarea class="form-control" name="customerQueries" required><%= support.getCustomerQueries() %></textarea>

                                <label>Response:</label>
                                <textarea class="form-control" name="feedback" readonly><%= support.getFeedback() %></textarea>

                             

                                <div class="text-center mt-3">
                                    <button type="submit" class="btn btn-primary">Update Feedback</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>

        <% } else { %>
            <div class="alert alert-warning" role="alert">
                No feedbacks found.
            </div>
        <% } %>
    </div>
</body>
</html>