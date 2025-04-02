<%@page import="com.example.model.Employees"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script>
function confirm_delete(employeeId){
	let ans = confirm("Want to delete this record?");
	if(ans){
		window.location="/ECommerceApplication/DeleteEmployeeServlet?employeeId="+employeeId;
	}
}
</script>

</head>
<body>
	<jsp:include page="adminmenu.jsp" />
	<%
	Employees employees = new Employees();
	List<Employees> employeesList = employees.getAllEmployees();
	%>

	<div class="container mt-3">
		<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Employee record updated.
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Employee record not updated.
		</div>
		<%
		}
		}
		%>
		<h2>Employees</h2>
		<p>Different employees</p>
		<table class="table table-striped" id="table_id" >
			<thead>
				<tr>
					<th colspan='3'>Operations</th>
					<th>Slno</th>
					<th>EmployeeId</th>
					<th>FirstName</th>
					<th>LastName</th>
					<th>Gender</th>
					<th>Mobile</th>
					<th>Email</th>
					<th>Designation</th>
					<th>Password</th>
					<th>EmployeePic</th>
				</tr>
			</thead>
			<tbody>
				<%
				int slno = 0;
				for (Employees employeesOb : employeesList) {
					slno++;
				%>
				<tr>

					<td><a
						href="/ECommerceApplication/DeleteEmployeeServlet?employeeId=<%=employeesOb.getEmployeeId() %>"
						class='btn btn-sm btn-danger'>Delete</a></td>
					<td><button class='btn btn-sm btn-danger'
							onclick="confirm_delete(<%=employeesOb.getEmployeeId()%>)">Delete</button></td>
					<td><a
						href="/ECommerceApplication/view/admin/Editemployee.jsp?employeeId=<%=employeesOb.getEmployeeId()%>"
						class='btn btn-sm btn-success'>Edit</a></td>
				
					<td><%=slno%></td>
					<td><%=employeesOb.getEmployeeId()%></td>
					<td><%=employeesOb.getFirstName()%></td>
					<td><%=employeesOb.getLastName()%></td>
					<td><%=employeesOb.getGender()%></td>
					<td><%=employeesOb.getMobile()%></td>
					<td><%=employeesOb.getEmail() %></td>
					<td><%=employeesOb.getDesignation()%></td>
					<td><%=employeesOb.getPassword()%></td>
					<td><A href='EditImage.jsp?tableName=employees&setColName=employeepic&whereColName=employeeid&conditionValue=<%=employeesOb.getEmployeepic()%>&colName=employeepic'><img src='../../uploads/<%=employeesOb.getEmployeepic() %>' 
      			style='width:100px;height:100px'/></A></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<script>
$(document).ready(function(){
	$('#success_id').slideUp(3000);
	$('#table_id').DataTable();
	

});
</script>

</body>
</html>