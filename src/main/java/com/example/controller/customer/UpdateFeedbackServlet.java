package com.example.controller.customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Customer;
import com.example.model.Support;

/**
 * Servlet implementation class UpdateFeedbackServlet
 */
@WebServlet("/UpdateFeedbackServlet")
public class UpdateFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateFeedbackServlet() {
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
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();

	    String date = request.getParameter("date");
	    String customerQueries = request.getParameter("customerQueries"); // Corrected parameter name
	    String feedback = request.getParameter("feedback");

	    int feedbackId = 0;
	    int customerID = 0;

	    try {
	        feedbackId = Integer.parseInt(request.getParameter("feedbackId"));
	        customerID = Integer.parseInt(request.getParameter("customerId")); // Corrected parameter name
	    } catch (NumberFormatException e) {
	        System.out.println("Error parsing feedbackId or customerId: " + e.getMessage());
	        e.printStackTrace();
	        response.sendRedirect("view/customer/viewfeedbacks.jsp?res=0"); // Redirect with error
	        return;
	    }

	    Support support = new Support();
	    support.setDate(date);
	    support.setCustomerQueries(customerQueries);
	    support.setFeedback(feedback);
	    support.setCustomerId(customerID);
	    support.setFeedbackId(feedbackId);

	    HttpSession session = request.getSession();
	    session.setAttribute("support", support);

	    int n = support.updateFeedback();

	    response.sendRedirect("view/customer/viewfeedbacks.jsp?res=" + n);
	}

}
