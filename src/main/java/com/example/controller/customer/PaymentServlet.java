package com.example.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Cart;
import com.example.model.Customer;
import com.example.model.Invoices;
import com.example.model.Orders;
import com.example.model.Products;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PaymentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();

		// Fetch payment details from request
		String accountNumber = request.getParameter("accountNumber");
		String cardNumber = request.getParameter("cardNumber");
		String cardType = request.getParameter("cardType");
		String cvvNumber = request.getParameter("cvvNumber");
		String expiryDate = request.getParameter("expiryDate");
		// Shipment parameters
		String deliverAddress = request.getParameter("deliverAddress");
		String mobileNumber = request.getParameter("mobileNumber");
		String zipCode = request.getParameter("zipCode");

		// Fetch customer and order details from session
		Customer customer = (Customer) session.getAttribute("customer");
		if (customer == null) {
			System.out.println("Customer object is not found in session.");
			pw.println("Error: Please login again.");
			return;
		}

		String orderId = (String) session.getAttribute("orderId");
		if (orderId == null || orderId.isEmpty()) {
			// Debugging message
			System.out.println("Error: orderId is not set in session.");
			pw.println("Error: Unable to process payment. Please try again.");
			return;
		}

		Integer billAmountObj = (Integer) session.getAttribute("billAmount");
		if (billAmountObj == null) {
			System.out.println("Error: billAmount is not set in session.");
			pw.println("Error: Invalid bill amount.");
			return;
		}

		int billAmount = billAmountObj;

		// Payment processing
		Invoices invoice = new Invoices();
		boolean paymentStatus = invoice.paymentInvoice(customer.getCustomerId(), orderId, accountNumber, cardNumber,
				cardType, cvvNumber, expiryDate, billAmount, deliverAddress, mobileNumber, zipCode);

		if (paymentStatus) {
			// clearing cart after successful payment
			Cart cart = new Cart();
			cart.clearCartByCustomerId(customer.getCustomerId());
			
			//inserting into orders 
			Orders orders = new Orders();
			orders.setOrderId(orderId);
			orders.setCustomerId(customer.getCustomerId());
			orders.setInvoiceNumber(invoice.getInvoiceNumber());
			Products product=new Products();
			List<Products> productList=product.getAllProducts();
 			System.out.println(product);
			
			orders.setProductCode(product.getProductCode());
			LocalDate dateTime = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String date = dateTime.format(formatter);
			orders.setOrderDateTime(date);
			orders.setCost(product.getCost());
			orders.setDiscountAmount((product.getCost() * product.getDiscount()));
			orders.setBillAmount(billAmount);
			int gstAmount = (int) session.getAttribute("gstAmount");
			orders.setGstAmount(gstAmount);
			int quantity = (int) session.getAttribute("productQuantities");
			orders.setQuantity(quantity);
			orders.setOrderStatus("Successfull");
			orders.addCustomerOrders();

			response.sendRedirect("view/customer/paymentSuccess.jsp");
			session.removeAttribute("orderId"); // Clean up session after success
		} else {
			pw.println("<h2 style='red'>Payment failed. Please try again.</h2>");
		}
	}
}
