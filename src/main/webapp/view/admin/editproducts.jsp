<!DOCTYPE html>
<%@page import="com.example.model.Products"%>
<html lang="en">
<head>
	<jsp:include page="/header.jsp"></jsp:include>
    <title>Update Product Form</title>
</head>
<body>
	<jsp:include page="adminmenu.jsp"></jsp:include>
	 <%
        String productCode = request.getParameter("productCode");
        Products products = new Products();
        products = products.getProductsById(Integer.parseInt(productCode));
       
    %>
    <div class="container mt-5">
        <h2 class="mb-4">Update Product</h2>
        <form action="/EcommerceApplication/UpdateProductServlet" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="productCode" class="form-label">Product Code</label>
                <input type="text" class="form-control" id="productCode" name="productCode" value="<%=products.getProductCode() %>" required>
            </div>
            <div class="mb-3">
                <label for="categoryName" class="form-label">Category Name</label>
                <input type="text" class="form-control" id="categoryName" name="categoryName" value="<%=products.getCategoryName() %>" required>
            </div>
            <div class="mb-3">
                <label for="productName" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="productName" name="productName"  value="<%=products.getProductName() %>" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3"  value="<%=products.getDescription()%>" required></textarea>
            </div>
            <div class="mb-3">
                <label for="discount" class="form-label">Discount</label>
                <input type="number" class="form-control" id="discount" name="discount"  value="<%=products.getDiscount() %>"required>
            </div>
            <div class="mb-3">
                <label for="cost" class="form-label">Cost</label>
                <input type="number" class="form-control" id="cost" name="cost" value="<%=products.getCost()%>" required>
            </div>
            <button type="submit" class="btn btn-primary" value="update">Update</button>
        </form>
    </div>
</body>
</html>
