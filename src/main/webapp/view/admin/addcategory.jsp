<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/header.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="adminmenu.jsp"></jsp:include>
	<div class="container mt-5 card">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<h3 class="text-center mb-4">Add Category</h3>
				<form action="/EcommerceApplication/AddCategoryServlet"
					method="post">
					<!-- Category Name Field -->
					<div class="mb-3">
						<label for="categoryName" class="form-label">Category Name</label>
						<input type="text" class="form-control" name="categoryName"
							placeholder="Enter category name" required>
					</div>
					<!-- Add Button -->
					<div class="text-center">
						<button type="submit" class="btn btn-primary px-4">Add</button>
					</div>
					<%
					String res = request.getParameter("res");
					if (res != null) {
						if (res.equals("0")) {
							out.println("<h4 style='color:red'>Category not added!</h4>");
						} else {
							out.println("<h4 style='color:green'>Category added successfully!</h4>");
						}
					}
					%>
				</form>
			</div>
		</div>
	</div>
</body>
</html>