<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/header.jsp"></jsp:include>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"> <!-- Font Awesome Icons -->
    <style>
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
        }
        .nav-link {
            font-weight: 500;
            display: flex;
            align-items: center;
        }
        .nav-link:hover{
        	color:gold;
        }
        .nav-link i {
            margin-right: 8px;
        }
        .dropdown-menu a {
            display: flex;
            align-items: center;
        }
        .dropdown-menu a i {
            margin-right: 8px;
        }
        .logout-btn {
            font-weight: 500;
            color: white;
            display: flex;
            align-items: center;
            text-decoration: none;
        }
        .logout-btn:hover {
            color: #ff6b6b; /* Add a hover effect for logout */
        }
        .logout-btn i {
            margin-right: 8px;
        }

        /* Ensure no extra padding above the navbar */
        body {
            margin-top: 0; /* Remove any padding/margin above the navbar */
        }

        /* Add spacing below navbar */
        nav {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <!-- Brand -->
            <a class="navbar-brand" href="index.jsp">
                <i class="fas fa-store"></i> E-COMMERCE
            </a>

            <!-- Toggler Button -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar Links -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <!-- Home -->
                    <li class="nav-item">
                        <a class="nav-link" href="adminhome.jsp">
                            <i class="fas fa-home"></i> Home
                        </a>
                    </li>

                    <!-- Categories Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="categoriesDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-list"></i> Categories
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="categoriesDropdown">
                            <li>
                                <a class="dropdown-item" href="addcategory.jsp">
                                    <i class="fas fa-plus-circle"></i> Add
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="viewcategories.jsp">
                                    <i class="fas fa-eye"></i> View
                                </a>
                            </li>
                        </ul>
                    </li>

                    <!-- Product Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="productDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-box"></i> Product
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="productDropdown">
                            <li>
                                <a class="dropdown-item" href="addproduct.jsp">
                                    <i class="fas fa-plus-circle"></i> Add
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="viewproducts.jsp">
                                    <i class="fas fa-eye"></i> View
                                </a>
                            </li>
                        </ul>
                    </li>

                    <!-- Employee Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="employeeDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-users"></i> Employee
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="employeeDropdown">
                            <li>
                                <a class="dropdown-item" href="addemployee.jsp">
                                    <i class="fas fa-user-plus"></i> Add
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="viewemployee.jsp">
                                    <i class="fas fa-user-friends"></i> View
                                </a>
                            </li>
                        </ul>
                    </li>
                    
                    <!-- Support Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="supportDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-comments"></i> Support
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="supportDropdown">
                            <li>
                                <a class="dropdown-item" href="adminaddsupport.jsp">
                                    <i class="fas fa-plus-circle"></i> Add
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="adminviewsupport.jsp">
                                    <i class="fas fa-eye"></i> View
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>

                <!-- Logout Option -->
                <a href="../../logout.jsp" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>
    </nav>
</body>
</html>
