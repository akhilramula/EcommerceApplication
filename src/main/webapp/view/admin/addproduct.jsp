<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Category"%>
<html lang="en">
<head>
</head>
<body>
<jsp:include page="adminmenu.jsp"></jsp:include>
    <div class="container mt-5">
        <h2 class="mb-4">Add Product</h2>
        <form  action="/EcommerceApplication/AddProductServlet" method="post" enctype="multipart/form-data">
        
        <%
	Category category= new Category();
	List<String> categoryList=category.getAllCategoriesByName();
	System.out.println(categoryList);
	%>

	<div class="container mt-5 card">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<h1 class="mb-4 text-center">Add Product</h1>
				<form action="/ECommerceWebsite/AddProductServlet" method="post"
					enctype="multipart/form-data">
					<div class='container at 3 card' style ='background-color:green'>
					<h3 class='text-info'>Add Product</h3>
					<div class="row">
						<div class='col-sm-6'>
							<label>Product Code</label>
							<input type="number" class="form-control" name="productCode">
						</div>
						<div class="col-sm-6">
						<label>Category Name</label>
						<select name="categoryName" class="form-control">
						<%
						for(String categoryName : categoryList){ %>
						<option value='<%=categoryName%>'><%=categoryName%></option>;
						<% }
						
							%>
</select>
</div>
</div>
            
            
            <div class="mb-3">
                <label for="productName" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="productName" name="productName" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
            </div>
            <div class="mb-3">
                <label for="discount" class="form-label">Discount (%)</label>
                <input type="number" class="form-control" id="discount" name="discount" min="0" max="100" required>
            </div>
            <div class="mb-3">
                <label for="cost" class="form-label">Cost</label>
                <input type="number" class="form-control" id="cost" name="cost" step="0.01" required>
            </div>
            <div class="mb-3">
                <label for="productImage1" class="form-label">Product Image 1</label>
                <input type="file" class="form-control" id="productImage1" name="productImage1" accept="image/*" >
            </div>
            <div class="mb-3">
                <label for="productImage2" class="form-label">Product Image 2</label>
                <input type="file" class="form-control" id="productImage2" name="productImage2" accept="image/*">
            </div>
            <div class="mb-3">
                <label for="productImage3" class="form-label">Product Image 3</label>
                <input type="file" class="form-control" id="productImage3" name="productImage3" accept="image/*">
            </div>
            <button type="submit" class="btn btn-primary">Add Product</button>
        </form>
    </div>
   
    <%
					String res = request.getParameter("res");
					if (res != null) {
						if (res.equals("0")) {
							out.println("<h4 style='color:red'>Product not added!</h4>");
						} else {
							out.println("<h4 style='color:green'>Product added successfully!</h4>");
						}
					}
					%>
					
</body>
</html>
