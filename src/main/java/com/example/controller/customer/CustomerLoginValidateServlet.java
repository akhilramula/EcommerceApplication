package com.example.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Customer;

/**
 * Servlet implementation class CustomerLoginValidateServlet
 */
@WebServlet("/CustomerLoginValidateServlet")
public class CustomerLoginValidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerLoginValidateServlet() {
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
		
		String emailId=request.getParameter("email");
		String password=request.getParameter("password");
		
		Customer customer =new Customer();
		customer.setEmailId(emailId);
		customer.setPassword(password);
		
		customer=customer.validateCustomerLogin();
		System.out.println("customer:"+customer);
		if(customer==null) {
			response.sendRedirect("view/customerlogin.jsp?res=0");	
		}else {
			HttpSession session=request.getSession();
			session.setAttribute("customer", customer);
			
			response.sendRedirect("view/customer/customerhome.jsp");
		}
	}

}
