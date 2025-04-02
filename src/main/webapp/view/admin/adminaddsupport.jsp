<!DOCTYPE html>
<%@page import="com.example.model.Support"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Feedback</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f3f5;
            font-family: 'Arial', sans-serif;
        }

        /* Adding some space at the top of the page to avoid navbar overlap */
        .main-content {
            margin-top: 80px;
        }

        .feedback-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 40px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            font-size: 2rem;
            font-weight: bold;
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            border-radius: 8px;
            border: 1px solid #ddd;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: #007bff;
        }

        .btn-submit {
            background-color: #007bff;
            color: white;
            font-size: 1.1rem;
            font-weight: bold;
            width: 100%;
            padding: 10px;
            border-radius: 8px;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        .readonly-textarea {
            background-color: #f7f7f7;
            color: #6c757d;
        }

        .readonly-textarea:focus {
            background-color: #f7f7f7;
        }

        .feedback-container .mb-3 {
            margin-bottom: 20px;
        }

        .feedback-container .btn-submit {
            margin-top: 20px;
        }
    </style>
</head>

<body>

    <!-- Include the admin menu (navbar) -->
    <jsp:include page="adminmenu.jsp"></jsp:include>
<%session=request.getSession();
Support support=new Support();
support=(Support)session.getAttribute("support");%>
    <!-- Main Content -->
    <div class="container main-content">
        <div class="feedback-container">
            <div class="form-title">Customer Feedback Response</div>

            <form method="post" action="/EcommerceApplication/">
                <!-- Customer Query (Readonly for Admin) -->
                <div class="mb-3">
                    <label for="customerQuery" class="form-label">Customer Query</label>
                    <textarea class="form-control readonly-textarea" id="customerQuery" name="customerQuery" rows="4" readonly 
                   value=<%=support.getCustomerQueries()%>></textarea>
                </div>

                <!-- Admin's Response (Editable for Admin) -->
                <div class="mb-3">
                    <label for="adminResponse" class="form-label">Response</label>
                    <textarea class="form-control" id="adminResponse" name="feedback" rows="4" placeholder="Enter your response here..."></textarea>
                </div>

                <!-- Submit Button -->
                <div class="mb-3">
                    <button type="submit" class="btn btn-submit btn-primary">Submit Response</button>
                </div>
            </form>
        </div>
    </div>

</body>

</html>
