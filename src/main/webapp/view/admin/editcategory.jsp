<!DOCTYPE html>
<%@page import="com.example.model.Category"%>
<html lang="en">
<head>
    <jsp:include page="/header.jsp"></jsp:include>
    <title>Update Category</title>
</head>
<body>
    <jsp:include page="adminmenu.jsp"></jsp:include>
    <%
        String categoryId = request.getParameter("categoryId");
        Category category = new Category();
        category = category.getCategoryByCategoryId(Integer.parseInt(categoryId));
       // System.out.println("Category name="+category.getCategoryName());
    %>
    <div class="container mt-5 card">
        <h2 class="text-center mb-4 mt-3">Update Category</h2>
        <form action="/EcommerceApplication/UpdateCategoryServlet" method="POST">
            <!-- Category Id Field -->
            <div class="mb-3">
                <label for="categoryId" class="form-label">Category Id</label>
                <input type="text" class="form-control" id="categoryId" name="categoryId" value="<%= category.getCategoryId() %>" readonly>
            </div>

            <!-- Category Name Field -->
            <div class="mb-3">
                <label for="categoryName" class="form-label">Category Name</label>
                <input type="text" class="form-control" id="categoryName" name="categoryName" value="<%= category.getCategoryName() %>" required>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary px-4 mb-4">Update</button>
            </div>
        <%
                String res = request.getParameter("res");
                if (res != null) {
                    if (res.equals("0")) {
                        out.println("<h4 style='color:red'>Category not updated!</h4>");
                    } else {
                        out.println("<h4 style='color:green'>Category updated successfully!</h4>");
                    }
                }
            %>
        </form>
    </div>
</body>
</html>
