package com.example.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Customer;

/**
 * Servlet implementation class CustomerUpdateServlet
 */
@MultipartConfig
@WebServlet("/CustomerUpdateServlet")
public class CustomerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerUpdateServlet() {
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
		PrintWriter out=response.getWriter();
		
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String mobileNumber=request.getParameter("mobileNumber");
		String password=request.getParameter("password");
		
		HttpSession session=request.getSession();
		Customer customer=(Customer)session.getAttribute("customer");
		customer.setFirstName(firstName);
		customer.setLastName(lastName);
		customer.setMobileNumber(mobileNumber);
		customer.setPassword(password);
		
		int n=customer.updateCustomer();
		
		response.sendRedirect("view/customer/customerprofile.jsp?res="+n);
	}

}
