<%@page import="com.example.model.Products"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <script>
        function confirm_delete(productCode) {
            let ans = confirm("Want to delete this record?");
            if (ans) {
                window.location = "/ECommerceApplication/DeleteProductServlet?productCode=" + productCode;
            }
        }
    </script>
</head>
<body>
    <jsp:include page="adminmenu.jsp" />
    <%
        // Retrieve product list
        Products products =new Products();
        List<Products> productList = products.getAllProducts();
    %>

    <div class="container mt-3">
        <%
            String res = request.getParameter("res");
            if (res != null) {
                if (res.equals("1")) {
        %>
        <div class="alert alert-success alert-dismissible" id="success_id">
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            <strong>Success!</strong> Product record updated.
        </div>
        <%
                } else if (res.equals("0")) {
        %>
        <div class="alert alert-danger alert-dismissible" id="success_id">
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            <strong>Failed!</strong> Product record not updated.
        </div>
        <%
                }
            }
        %>
        <h2>Products</h2>
        <p>Different products</p>
        <table class="table table-striped" id="table_id">
            <thead>
                <tr>
                    <th colspan="3">Operations</th>
                    <th>Sl. No</th>
                    <th>Product Code</th>
                    <th>Category Name</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Discount</th>
                    <th>Cost</th>
                    <th>Product Image 1</th>
                    <th>Product Image 2</th>
                    <th>Product Image 3</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int slno = 0;
                    for (Products productOb : productList) {
                        slno++;
                %>
                <tr>
                    <!-- Delete and Edit Operations -->
                    <td>
                        <a href="/ECommerceApplication/DeleteProductServlet?productCode=<%= productOb.getProductCode() %>"
                           class="btn btn-sm btn-danger">Delete</a>
                    </td>
                    <td>
                        <button class="btn btn-sm btn-danger"
                                onclick="confirm_delete(<%= productOb.getProductCode() %>)">Delete</button>
                    </td>
                    <td>
                        <a href="/ECommerceApplication/view/admin/editproducts.jsp?productCode=<%= productOb.getProductCode() %>"
                           class="btn btn-sm btn-success">Edit</a>
                    </td>

                    <!-- Product Details -->
                    <td><%= slno %></td>
                    <td><%= productOb.getProductCode() %></td>
                    <td><%= productOb.getCategoryName() %></td>
                    <td><%= productOb.getProductName() %></td>
                    <td><%= productOb.getDescription() %></td>
                    <td><%= productOb.getDiscount() %></td>
                    <td><%= productOb.getCost() %></td>

                    <!-- Product Images -->
                    <td>
                        <a href="EditImage.jsp?tableName=products&setColName=productImage1&whereColName=productCode&conditionValue=<%= productOb.getProductCode() %>&colName=productImage1">
                            <img src="../../uploads/<%= productOb.getProductImage1() %>" style="width:100px; height:100px;" />
                        </a>
                    </td>
                    <td>
                        <a href="EditImage.jsp?tableName=products&setColName=productImage2&whereColName=productCode&conditionValue=<%= productOb.getProductCode() %>&colName=productImage2">
                            <img src="../../uploads/<%= productOb.getProductImage2() %>" style="width:100px; height:100px;" />
                        </a>
                    </td>
                    <td>
                        <a href="EditImage.jsp?tableName=products&setColName=productImage3&whereColName=productCode&conditionValue=<%= productOb.getProductCode() %>&colName=productImage3">
                            <img src="../../uploads/<%= productOb.getProductImage3() %>" style="width:100px; height:100px;" />
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <script>
        $(document).ready(function() {
            // Auto-hide success message
            $('#success_id').slideUp(3000);

            // Initialize DataTables
            $('#table_id').DataTable();
        });
    </script>
</body>
</html>
