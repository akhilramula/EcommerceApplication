package com.example.controller.admin;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import dbutils.DBConnection;

/**
 * Servlet implementation class UploadImageServlet
 */
@WebServlet("/UploadImageServlet")
@MultipartConfig
public class UploadImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		// read data from view
		
		String tableName = request.getParameter("tableName");
		
		String setColName = request.getParameter("setColName");
		String whereColName = request.getParameter("whereColName");
		
		String conditionValue = request.getParameter("conditionValue");
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
			
		 //////////////////////////		 
		 //////upload productImage1
		 ////////////////////////////
			Part image1 = request.getPart("image1");
			// Get the input stream of the uploaded file
	        InputStream inputStream1 = image1.getInputStream();

	       //Generate the unique filename or use the original file name
			String fileName1 = System.currentTimeMillis() + "_"+image1.getSubmittedFileName();
			
			//Save file to the server
			Path filePath1 =uploadPath.resolve(fileName1);
			Files.copy(inputStream1, filePath1,StandardCopyOption.REPLACE_EXISTING);
			
			try {
				DBConnection db = new DBConnection();
				Connection conn = db.getConnection();
				
    //String qry="update %s set %s='%s' where %s='%s'".format(tableName, setColName, fileName1, whereColName, conditionValue);
	String qry="update "+tableName+" set "+setColName+"= '"+fileName1+"' where "+ whereColName +"='"+ conditionValue +"'";
				System.out.println("qry=" + qry);
				
				PreparedStatement pst= conn.prepareStatement(qry);
				int n = pst.executeUpdate();
				
					response.sendRedirect("view/admin/viewproducts.jsp?res=" + n);
				
				
				
				
			}catch(Exception ee) {
				
				System.out.println("Error: " + ee);
			}
			
			
			
		
	}

}
