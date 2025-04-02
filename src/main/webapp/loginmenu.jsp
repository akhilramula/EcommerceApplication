<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"> <!-- Font Awesome Icons -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
        .nav-link:hover{
        	color:gold;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <!-- Brand -->
            <a class="navbar-brand" href="index.jsp">
                <i class="fas fa-store"></i> E-Commerce
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
                        <a class="nav-link" href="index.jsp">
                            <i class="fas fa-home"></i> Home
                        </a>
                    </li>

                    <!-- About Us -->
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">
                            <i class="fas fa-info-circle"></i> About
                        </a>
                    </li>

                    <!-- Contact -->
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">
                            <i class="fas fa-envelope"></i> Contact us
                        </a>
                    </li>

                    <!-- Logins Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="loginDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-sign-in-alt"></i> Logins
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="loginDropdown">
                            <li>
                                <a class="dropdown-item" href="adminlogin.jsp">
                                    <i class="fas fa-user-shield"></i> Admin
                                </a>
                            </li>
                           
                            <li>
                                <a class="dropdown-item" href="customerlogin.jsp">
                                    <i class="fas fa-user"></i> Customer
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
