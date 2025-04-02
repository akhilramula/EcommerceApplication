<!DOCTYPE html>
<%@page import="com.example.model.Customer"%>
<html lang="en">
<head>
<jsp:include page="/header.jsp"></jsp:include>
<title>Customer Profile</title>
<style>
body {
	background-color: #f8f9fa;
}

.card {
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

.profile-pic {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	object-fit: cover;
	margin-top: -60px;
	border: 3px solid white;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.profile-header {
	text-align: center;
	background-color: #007bff;
	color: white;
	padding: 50px 10px 20px;
	border-radius: 10px 10px 0 0;
}

.form-label {
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="customermenu.jsp"></jsp:include>
	<%
	// Fetch the customer object from the session
	Customer customer = (Customer) session.getAttribute("customer");
	if (customer == null) {
	%>
	<div class="container mt-5">
		<div class="alert alert-danger text-center">
			<strong>Error:</strong> Customer data not found. Please log in to
			view your profile.
		</div>
	</div>
	<%
	return; // Stop further processing if customer data is not found
	}
	%>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="profile-header">
						<a
							href="EditImage.jsp?tableName=customers&setColName=profilePic&whereColName=customerId&conditionValue=<%=customer.getCustomerId()%>&colName=profilePic">
							<img src="../../uploads/<%=customer.getProfilePic()%>"
							class="profile-pic" style="width: 100px; height: 100px;" />
						</a>
						<h3 class="mt-3"><%=customer.getFirstName()%>
							<%=customer.getLastName()%></h3>
						<p><%=customer.getEmailId()%></p>
					</div>

					<div class="card-body">
						<form method="post"
							action="/EcommerceApplication/CustomerUpdateServlet"
							enctype="multipart/form-data">
							<div class="mb-3">
								<label for="customerId" class="form-label">Customer ID</label> <input
									type="text" class="form-control" id="customerId"
									name="customerId" value="<%=customer.getCustomerId()%>"
									readonly>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="firstName" class="form-label">First Name</label> <input
										type="text" class="form-control" id="firstName"
										name="firstName" value="<%=customer.getFirstName()%>">
								</div>
								<div class="col-md-6 mb-3">
									<label for="lastName" class="form-label">Last Name</label> <input
										type="text" class="form-control" id="lastName" name="lastName"
										value="<%=customer.getLastName()%>">
								</div>
							</div>
							<div class="mb-3">
								<label for="mobileNumber" class="form-label">Mobile
									Number</label> <input type="tel" class="form-control" id="mobileNumber"
									name="mobileNumber" value="<%=customer.getMobileNumber()%>">
							</div>
							<div class="mb-3">
								<label for="emailId" class="form-label">Email ID</label> <input
									type="email" class="form-control" id="emailId" name="emailId"
									value="<%=customer.getEmailId()%>" readonly>
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">Password</label> <input
									type="password" class="form-control" id="password"
									name="password" value="<%=customer.getPassword()%>">
							</div>
							<div class="mb-3">
								<label for="registerDate" class="form-label">Register
									Date</label> <input type="text" class="form-control" id="registerDate"
									name="registerDate" value="<%=customer.getRegisterDate()%>"
									readonly>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary" name="update">Update
									Profile</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
