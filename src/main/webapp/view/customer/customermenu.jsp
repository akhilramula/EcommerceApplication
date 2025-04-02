<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/header.jsp"></jsp:include>
    <title>E-Commerce Navbar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
        }
        .nav-link {
            font-weight: 500;
        }
        
          .nav-link:hover {
            color: #ffd700; /* Hover effect color */
        }
       
        /* Search bar positioning and styling */
        .search-bar {
            max-width: 400px;
            position: relative;
        }

        .search-input {
            padding-left: 35px;
            border-radius: 20px;
            font-size: 1rem;
        }

        .search-icon {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            color: #aaa;
        }
        .nav-icons i {
            font-size: 1.2rem;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <!-- Brand -->
            <a class="navbar-brand" href="index.jsp"><i class="fas fa-store"></i> E-Commerce</a>

            <!-- Toggler Button -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar Content -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="customerhome.jsp"><i class="fas fa-home"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="customerprofile.jsp"><i class="fas fa-user"></i> Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewWishList.jsp"><i class="fas fa-heart"></i> WishList</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewCart.jsp"><i class="fas fa-shopping-cart"></i> Cart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="order.jsp"><i class="fas fa-box"></i> Orders</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewRatings.jsp"><i class="fas fa-star"></i> Ratings</a>
                    </li>
                    <!-- Support Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="productDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-comments"></i> Support
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="productDropdown">
                            <li>
                                <a class="dropdown-item" href="support.jsp">
                                    <i class="fas fa-plus-circle"></i> Add
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="viewfeedbacks.jsp">
                                    <i class="fas fa-eye"></i> View
                                </a>
                            </li>
                        </ul>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="../../logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </li>
                </ul>

                <!-- Search Bar -->
                <form class="d-flex position-relative search-bar" action="#">
                    <i class="fas fa-search search-icon"></i>
                    <input class="form-control search-input" type="search" placeholder=" Search for products..." aria-label="Search" name="search">
                    <button class="btn btn-outline-light ms-2" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>

</body>
</html>
