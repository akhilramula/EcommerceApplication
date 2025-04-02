package com.example.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import com.example.model.Customer;
import com.example.model.Wishlist;

/**
 * Servlet implementation class AddToWishListServlet
 */
@WebServlet("/AddToWishlistServlet")
public class AddToWishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToWishlistServlet() {
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
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		int productCode = Integer.parseInt(request.getParameter("productCode"));
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		int customerid = customer.getCustomerId();

		Calendar c = Calendar.getInstance();
		String wishlistDate = String.format("%d-%d-%d %d:%d:%d", c.get(Calendar.YEAR), c.get(Calendar.MONTH),
				c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR), c.get(Calendar.MINUTE), c.get(Calendar.SECOND));

		Wishlist wishlists = new Wishlist();

		wishlists.setProductCode(productCode);
		wishlists.setCustomerId(customerid);
		wishlists.setWishlistDate(wishlistDate);

		int n = wishlists.addwishlist();
		response.sendRedirect("view/customer/customerhome.jsp?=" + n);
		pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
	}
}