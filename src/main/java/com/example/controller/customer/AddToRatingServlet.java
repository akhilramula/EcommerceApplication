package com.example.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

import com.example.model.Customer;
import com.example.model.Ratings;

/**
 * Servlet implementation class AddToRatingServlet
 */
@WebServlet("/AddToRatingServlet")
public class AddToRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToRatingServlet() {
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
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		int productCode = Integer.parseInt(request.getParameter("productCode"));
		int rating = Integer.parseInt(request.getParameter("rating"));
		String comments = request.getParameter("comments");

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		int customerid = customer.getCustomerId();

		Ratings ratings = new Ratings();

		ratings.setProductCode(productCode);
		LocalDateTime Datetime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String Date = Datetime.format(formatter);

		ratings.setDate(Date);
		ratings.setCustomerId(customerid);
		ratings.setComments(comments);
		ratings.setRating(rating);
		int n = ratings.addRating();
		response.sendRedirect("view/customer/customerhome.jsp?n=" + n);
		pw.close();

	}

}
