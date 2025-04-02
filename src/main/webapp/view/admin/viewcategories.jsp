<%@page import="java.util.List"%>
<%@page import="com.example.model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
function confirm_delete(categoryid) {
    let ans = confirm("Want to delete this record?");
    if (ans) {
        window.location = "/EcommerceApplication/DeleteCategoryServlet?categoryid=" + categoryid;
    }
}

</script>
</head>
<body>
	<jsp:include page="adminmenu.jsp"></jsp:include>
	<%
	Category category = new Category();
	List<Category> categoryList = category.getAllCategories();
	%>
	<%
	String res = request.getParameter("res");
	if (res != null) {
		if (res.equals("1")) {
	%>
	<div class="alert alert-success alert-dismissible" id="success_id">
		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		<strong>Success!</strong>Category record updated
	</div>
	<%
	} else if (res.equals("0")) {
	%>
	<div class="alert alert-success alert-dismissible" id="success_id">
		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		<strong>Failed!</strong>Category record not updated
	</div>
	<%
	}
	}
	%>


	<h2>Categories</h2>
	<p>Different categories for products</p>
	<table class="table table-striped" id="table_id">
		<thead>
			<tr>
				<th colspan='3'>Operations</th>
				<th>Slno</th>
				<th>Category Id</th>
				<th>Category Name</th>
			</tr>
		</thead>
		<tbody>
			<%
			int slno = 0;
			for (Category categoryOb : categoryList) {
				slno++;
			%>
			<tr>

				<td><a
					href="/EcommerceApplication/DeleteCategoryServlet?categoryId=<%=categoryOb.getCategoryId()%>"
					class="btn btn-sm btn-danger">Delete</a>
				<td><button class='btn btn-sm btn-danger'
						onclick="confirm_delete(<%=categoryOb.getCategoryId()%>)">Delete</button></td>
				<td><a
					href="/EcommerceApplication/view/admin/editcategory.jsp?categoryId=<%=categoryOb.getCategoryId()%>"
					class="btn btn-sm btn-success">Edit</a></td>

				<td><%=slno%></td>
				<td><%=categoryOb.getCategoryId()%></td>
				<td><%=categoryOb.getCategoryName()%></td>
			</tr>

			<%
			}
			%>



		</tbody>
	</table>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#success_id').slideUp(3000);
			$('#table_id').DataTable();
		});
	</script>

</body>
</html>