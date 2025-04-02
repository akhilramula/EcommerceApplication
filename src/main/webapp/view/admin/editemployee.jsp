<%@page import="com.example.model.Employees"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/header.jsp" />
</head>
<body>
	<jsp:include page="adminmenu.jsp" />
	<%
	String employeeId = request.getParameter("employeeId");
	Employees employees = new Employees();
	employees = employees.getEmployeesByEmployeeId(Integer.parseInt(employeeId));
	%>
	<br>
	<h3>Edit Employees</h3>
	<form action="/EcommerceWebsite/UpdateEmployeeServlet" method="post">
		EmployeeId : <input type="number" name="employeeId"
			value="<%=employees.getEmployeeId()%>" readonly><br>
		First Name: <input type="text" name="firstName"
			value="<%=employees.getFirstName()%>" required><br> Last
		Name: <input type="text" name="lastName"
			value="<%=employees.getLastName()%>" required><br>
		Gender: <input type="text" name="gender"
			value="<%=employees.getGender()%>" required><br> Mobile:
		<input type="number" name="mobile" value="<%=employees.getMobile()%>"
			required><br> Email : <input type="text" name="email"
			value="<%=employees.getEmail()%>" required><br>
		Designation: <input type="text" name="designation"
			value="<%=employees.getDesignation()%>" required><br>
		Password: <input type="text" name="password"
			value="<%=employees.getPassword()%>" required><br>
		EmployeePic: <input type="file" name="employeepic"
			value="<%=employees.getEmployeepic()%>" required><br> <input
			type="submit" value="Update Employees">
		<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("0")) {
				out.println("<h4 style='color:red'>Employees not updated</h4>");
			} else {
				out.println("<h4 style='color:green'>Employees updated</h4>");
			}
		}
		%>

	</form>
</body>
</html>