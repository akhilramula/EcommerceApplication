package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


import com.example.model.Products;

/**
 * Servlet implementation class UpdateProductServlet
 */
@MultipartConfig
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		int productCode = Integer.parseInt(request.getParameter("productCode"));
		String categoryName=request.getParameter("categoryName");
		String productName=request.getParameter("productName");
		String description=request.getParameter("description");
		int discount = Integer.parseInt(request.getParameter("discount"));
		int cost = Integer.parseInt(request.getParameter("cost"));

		Products products = new Products();
		products.setProductCode(productCode);
		products.setCategoryName(categoryName);
		products.setProductName(productName);
		products.setDescription(description);
		products.setDiscount(discount);
		products.setCost(cost);

		int n = products.updateProductsById();

		response.sendRedirect("view/admin/viewproducts.jsp?res=" + n);
		out.close();
	}

}
