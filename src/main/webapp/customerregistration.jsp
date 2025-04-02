<!DOCTYPE html>
<html lang="en">
<head>

<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="loginmenu.jsp"></jsp:include>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header text-center">
						<h3>Customer Registration</h3>
					</div>
					<div class="card-body">
						<form action="/EcommerceApplication/CustomerRegistrationServlet"
							method="post" enctype="multipart/form-data">

							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="firstName" class="form-label">First Name</label> <input
										type="text" class="form-control" id="firstName"
										placeholder="Enter First Name" name="firstName">
								</div>
								<div class="col-md-6 mb-3">
									<label for="lastName" class="form-label">Last Name</label> <input
										type="text" class="form-control" id="lastName"
										placeholder="Enter Last Name" name="lastName">
								</div>
							</div>
							<div class="mb-3">
								<label for="mobileNumber" class="form-label">Mobile
									Number</label> <input type="tel" class="form-control" id="mobileNumber"
									placeholder="Enter Mobile Number" name="mobileNumber">
							</div>
							<div class="mb-3">
								<label for="emailId" class="form-label">Email ID</label> <input
									type="email" class="form-control" id="emailId"
									placeholder="Enter Email ID" name="emailId">
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">Password</label> <input
									type="password" class="form-control" id="password"
									placeholder="Create Password" name="password">
							</div>
							<div class="mb-3">
								<label for="profilePic" class="form-label">Profile
									Picture</label> <input type="file" class="form-control" id="profilePic"
									name="profilePic">
							</div>

							<div class="d-grid">
								<button type="submit" class="btn btn-success">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS Bundle -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
