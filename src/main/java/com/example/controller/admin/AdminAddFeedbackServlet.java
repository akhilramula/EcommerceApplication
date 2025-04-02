package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Support;

/**
 * Servlet implementation class AdminAddFeedbackServlet
 */
@WebServlet("/AdminAddFeedbackServlet")
public class AdminAddFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminAddFeedbackServlet() {
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
		PrintWriter out = response.getWriter();

		String feedback = request.getParameter("feedback");
		HttpSession session = request.getSession();
		Support support = (Support) session.getAttribute("support");

		support.setCustomerId(support.getCustomerId());
		support.setCustomerQueries(support.getCustomerQueries());
		support.setDate(support.getDate());
		support.setFeedback(feedback);
		int n = support.addFeedback();

		response.sendRedirect("view/admin/adminaddsupport.jsp?res=" + n);
	}

}
