package com.example.controller.customer;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Calendar;

import com.example.model.Customer;
import com.mysql.fabric.Response;

/**
 * Servlet implementation class CustomerRegistrationServlet
 */
@MultipartConfig
@WebServlet("/CustomerRegistrationServlet")
public class CustomerRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerRegistrationServlet() {
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
		String emailId=request.getParameter("emailId");
		String password=request.getParameter("password");
		Part profilePic=request.getPart("profilePic");
		
		
//////////
		 //////creation of uploads directory in webapp folder
		 /////////
		 
		 ServletContext sc = getServletContext();
			String path = sc.getRealPath("/");
			System.out.println("path = " +path);
			
			String str = path.substring(0,path.indexOf(".metadata")-1);
			System.out.println("str = "+str);
			//get application name
			String appName = path.substring(path.lastIndexOf("\\",path.length()-2));
			System.out.println("appName = "+appName);
			
			//Concatenate root directory with application name
			String uploadDirectory = str+appName+"\\src\\main\\webapp\\uploads";
			System.out.println("uploadDirectory :" +uploadDirectory);
			
			Path uploadPath = Path.of(uploadDirectory);
			
			//Create the directory if it doesnt't exist
			if(!Files.exists(uploadPath)) {
				Files.createDirectories(uploadPath);
					System.out.println("directory Created");
				}else {
					System.out.println("directory not Created");
			}
		 
		 //////////////////////////		 
		 //////upload productImage1
		 ////////////////////////////
			
			// Get the input stream of the uploaded file
	        InputStream inputStream1 = profilePic.getInputStream();

	       //Generate the unique filename or use the original file name
			String fileName1 = System.currentTimeMillis() + "_"+profilePic.getSubmittedFileName();
			
			//Save file to the server
			Path filePath1 =uploadPath.resolve(fileName1);
			Files.copy(inputStream1, filePath1,StandardCopyOption.REPLACE_EXISTING);
			
			Calendar c=Calendar.getInstance();
			String dateTime=String.format("%d-%d-%d %d:%d:%d",c.get(Calendar.YEAR),c.get(Calendar.MONTH),c.get(Calendar.DAY_OF_MONTH),c.get(Calendar.HOUR),c.get(Calendar.MINUTE),c.get(Calendar.SECOND));
			
		Customer customer=new Customer();
		customer.setFirstName(firstName);
		customer.setLastName(lastName);
		customer.setMobileNumber(mobileNumber);
		customer.setEmailId(emailId);
		customer.setPassword(password);
		customer.setProfilePic(fileName1);
		customer.setRegisterDate(dateTime);
		
		int n=customer.addCustomers();
		
		response.sendRedirect("EcommerceApplication/customerlogin.jsp?res="+n);
	}

}
