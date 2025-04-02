<%@page import="com.example.model.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Orders"%>
<%@page import="com.example.model.CustomerOrders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/header.jsp" />
</head>
<body>
	<jsp:include page="customermenu.jsp" />
	<%
	// Debug: Print Customer ID
	Customer customer = (Customer) session.getAttribute("customer");
	if (customer == null) {
		System.out.println("Customer object is not found in session.");
	} else {
		Orders corder = new Orders();
		int customerId = customer.getCustomerId(); // Ensure customer ID is set
		List<Orders> corders = corder.getAllCustomerOrdersByCustomerId(customerId);
		System.out.println("Orders List: " + corders); // Debug: Print Orders List
	%>
	<div class="container-fluid mt-3">
		<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Product record updated.
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Error!</strong> Product record not updated.
		</div>
		<%
		}
		}
		%>
		<center>
			<h2 class='text-danger'>Orders</h2>
		</center>
		<table id='table1' class='table table-hover table-light'>
			<thead>
				<tr>
					<th>Action</th>
					<th>slno</th>
					<th>OrderId</th>
					<th>CustomerId</th>
					<th>InvoiceNumber</th>
					<th>productCode</th>
					<th>OrderDateTime</th>
					<th>Cost</th>
					<th>DiscountAmount</th>
					<th>Quantity</th>
					<th>gstAmount</th>
					<th>billAmount</th>
					<th>OrderStatus</th>
				</tr>
			</thead>
			<tbody>
				<%
				int slno = 0;
				for (Orders cordersob : corders) {
					slno++;
				%>
				<tr>
					<td><a
						href="/EcommerceWebsite/DeleteOrderServlet?productCode=<%=cordersob.getProductCode()%>"
						class='btn btn-sm btn-danger'>Delete</a></td>
					<td><%=slno%></td>
					<td><%=cordersob.getOrderId()%></td>
					<td><%=cordersob.getCustomerId()%></td>
					<td><%=cordersob.getInvoiceNumber()%></td>
					<td><%=cordersob.getProductCode()%></td>
					<td><%=cordersob.getOrderDateTime()%></td>
					<td><%=cordersob.getCost()%></td>
					<td><%=cordersob.getDiscountAmount()%></td>
					<td><%=cordersob.getQuantity()%></td>
					<td><%=cordersob.getGstAmount()%></td>
					<td><%=cordersob.getBillAmount()%></td>
					<td><%=cordersob.getOrderStatus()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<%
	}
	%>
	<!-- Include jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<!-- Include DataTables JS -->
	<script
		src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#success_id').slideUp(3000);
			$('#table1').DataTable();
		});
	</script>
</body>
</html>