<%@page import="java.util.List"%>
<%@page import="com.example.model.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/header.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="adminmenu.jsp"></jsp:include>
	
	<br>
	
	<form action="/EcommerceApplication/UploadImageServlet" method="post" enctype="multipart/form-data">
		<div class='container mt-3 card' style='background-color:#A9DFBF'>
		<h3 class='text-info'>Edit Image</h3>
		
					
			
			<input type='hidden' name='tableName' value='<%=request.getParameter("tableName")%>'>
			<input type='hidden' name='setColName' value='<%=request.getParameter("setColName")%>'>
			<input type='hidden' name='whereColName' value='<%=request.getParameter("whereColName")%>'>
			<input type='hidden' name='conditionValue' value='<%=request.getParameter("conditionValue")%>'>
			
			
			<div class='row'>
				<div class='col-sm-6'>
					<label>Upload Image</label>
					<input type="file" class="form-control" name="image1">
				</div>
				
			</div>
			
			
			<div class='row mt-3'>
				<div class='col-sm-12 text-center'>
					<input type="submit" name="submit" class ='form-control btn btn-md  btn-outline-primary' style='width:150px' value="Upload">
				</div>
			</div>
			<br>
			
		
		</div>
		
		
		
		
		<%
			String res=request.getParameter("res");
			if(res!=null){
				if(res.equals("0")){
					out.println("<h4 style='color:red'>Icategory not added</h4>");
				}else{
					out.println("<h4 style='color:green'>Icategory added</h4>");
				}
			
			}
		%>
	</form>
	
	

</body>
</html>