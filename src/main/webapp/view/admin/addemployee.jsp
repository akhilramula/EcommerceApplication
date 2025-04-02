<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee</title>

    <!-- Bootstrap CDN for Navbar and other styles -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <!-- General Styles -->
    <style>
        /* General Reset */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            flex-direction: column;
        }

        /* Make Navbar Full Width */
        .navbar {
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 9999;
        }

        .navbar .navbar-brand {
            font-weight: bold;
        }

        .form-card {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            padding: 30px;
            margin-top: 80px; /* To avoid overlap with fixed navbar */
            box-sizing: border-box;
        }

        .form-card h2 {
            text-align: center;
            font-size: 1.8rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        /* Input Field Styling */
        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            color: #555;
        }

        .form-control:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0px 0px 4px rgba(0, 123, 255, 0.5);
        }

        .form-radio-group {
            margin-bottom: 15px;
        }

        .form-radio-group label {
            margin-right: 15px;
            font-size: 0.9rem;
            color: #555;
        }

        /* Submit Button */
        .btn-primary {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 12px;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        /* Alerts */
        .alert {
            margin-top: 20px;
            padding: 10px;
            border-radius: 8px;
            text-align: center;
            font-size: 0.9rem;
            font-weight: bold;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
    </style>
</head>
<body>

    <!-- Include Admin Menu (Navbar) -->
    <jsp:include page="adminmenu.jsp"/>

    <!-- Form Card to Add Employee -->
    <div class="form-card">
        <h2>Add Employee</h2>
        <form action="/EcommerceApplication/AddEmployeeServlet" method="post" enctype="multipart/form-data">
            <!-- Employee ID -->
            <div class="form-group">
                <label for="employeeId" class="form-label">Employee ID</label>
                <input type="text" id="employeeId" name="employeeId" class="form-control" required>
            </div>

            <!-- First Name -->
            <div class="form-group">
                <label for="firstName" class="form-label">First Name</label>
                <input type="text" id="firstName" name="firstName" class="form-control" required>
            </div>

            <!-- Last Name -->
            <div class="form-group">
                <label for="lastName" class="form-label">Last Name</label>
                <input type="text" id="lastName" name="lastName" class="form-control" required>
            </div>

            <!-- Gender -->
            <div class="form-radio-group">
                <label class="form-label">Gender</label><br>
                <input type="radio" id="male" name="gender" value="male" required>
                <label for="male">Male</label>
                <input type="radio" id="female" name="gender" value="female">
                <label for="female">Female</label>
                <input type="radio" id="other" name="gender" value="other">
                <label for="other">Other</label>
            </div>

            <!-- Mobile -->
            <div class="form-group">
                <label for="mobile" class="form-label">Mobile</label>
                <input type="number" id="mobile" name="mobile" class="form-control" required>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>

            <!-- Designation -->
            <div class="form-group">
                <label for="designation" class="form-label">Designation</label>
                <input type="text" id="designation" name="designation" class="form-control" required>
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>

            <!-- Employee Picture -->
            <div class="form-group">
                <label for="employeepic" class="form-label">Employee Picture</label>
                <input type="file" id="employeepic" name="employeepic" class="form-control" accept="image/*">
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn-primary">Add Employee</button>
        </form>

        <!-- Alerts -->
        <% 
            String res = request.getParameter("res"); 
            if (res != null) { 
                if (res.equals("0")) { 
        %>
        <div class="alert alert-danger">
            Employee not added!
        </div>
        <% } else { %>
        <div class="alert alert-success">
            Employee added successfully!
        </div>
        <% } } %>
    </div>

</body>
</html>
