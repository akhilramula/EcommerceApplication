package com.example.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.example.model.Cart;
import com.example.model.Customer;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		HttpSession session = request.getSession();
		Customer customer =(Customer) session.getAttribute("customer");
		int customerid = customer.getCustomerId();
		
		Cart cart=new Cart();
		
		
		cart.setProductCode(productCode);
		//SimpleDateFormat ensures the selectedDate is properly
		//formatted to match the MySQL DATETIME format (yyyy-MM-dd HH:mm:ss).
		//Single-digit values for day, hour, minute, and second are 
		//zero-padded to meet MySQL's DATETIME requirements.
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String selectedDate = sdf.format(c.getTime());

		cart.setSelectedDate(selectedDate);
		cart.setCustomerId(customerid);
		
		
		int n=cart.addCart();
		response.sendRedirect("view/customer/customerhome.jsp?n=" +n);
		pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
