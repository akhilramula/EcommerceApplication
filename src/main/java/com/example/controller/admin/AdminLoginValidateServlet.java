package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Admin;

/**
 * Servlet implementation class AdminLoginValidateServlet
 */
@WebServlet("/AdminLoginValidateServlet")
public class AdminLoginValidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginValidateServlet() {
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
		
		//reading parameters
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String role=request.getParameter("role");
		
		//use model to validate admin user
		Admin admin=new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		admin.setRole(role);
		
		boolean flag=admin.validateAdminLogin();
		if(flag==true) {
			response.sendRedirect("view/admin/adminhome.jsp");
		}else {
			response.sendRedirect("view/adminlogin.jsp?res=0");
		}
	}

}
