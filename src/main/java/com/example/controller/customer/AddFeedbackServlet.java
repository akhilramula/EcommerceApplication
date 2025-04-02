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

import com.example.model.Customer;
import com.example.model.Support;

/**
 * Servlet implementation class AddFeedbackServlet
 */
@WebServlet("/AddFeedbackServlet")
public class AddFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFeedbackServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Do nothing here if you're not using it
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    // Servlet Implementation
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
        // Get the session object to retrieve customer details
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");

        if (customer == null) {
            // If the customer is not logged in, redirect to login page
            out.println("<h2 style='color:red'>Please login again to continue!</h2>");
            return;
        }

        // Retrieve the customer query from the form
        String customerQueries = request.getParameter("customerQueries");
        if (customerQueries == null || customerQueries.trim().isEmpty()) {
            // Redirect to an error page if the query is empty
        	out.println("<h2 style='color:red'>Your Query is empty!</h2>");
            return;
        }

        // Prepare the data to be stored
        Support support = new Support();
        support.setCustomerId(customer.getCustomerId()); // Set the customer ID from session
        support.setCustomerQueries(customerQueries); // Set the query entered by the customer
     // Format the date to the MySQL 'yyyy-MM-dd' format
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(new java.util.Date());  // Current date in correct format
        support.setDate(formattedDate);
        support.setFeedback(""); // Initially, the admin's response is empty
        
        //setting support to a session
        HttpSession session1=request.getSession();
        session.setAttribute("support", support);
        // Save feedback to the database
        int result = support.addFeedback();

        response.sendRedirect("view/customer/support.jsp?res="+result);
    }
}
