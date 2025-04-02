package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutils.DBConnection;

public class Products implements Serializable {
	private int productCode;
	private String categoryName;
	private String productName;
	private String description;
	private int discount;
	private int cost;
	private String productImage1;
	private String productImage2;
	private String productImage3;

	public Products() {
		super();
	}

	
	
	@Override
	public String toString() {
		return "Products [productCode=" + productCode + ", categoryName=" + categoryName + ", productName="
				+ productName + ", description=" + description + ", discount=" + discount + ", cost=" + cost
				+ ", productImage1=" + productImage1 + ", productImage2=" + productImage2 + ", productImage3="
				+ productImage3 + "]";
	}



	// setter and getters
	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public String getProductImage1() {
		return productImage1;
	}

	public void setProductImage1(String productImage1) {
		this.productImage1 = productImage1;
	}

	public String getProductImage2() {
		return productImage2;
	}

	public void setProductImage2(String productImage2) {
		this.productImage2 = productImage2;
	}

	public String getProductImage3() {
		return productImage3;
	}

	public void setProductImage3(String productImage3) {
		this.productImage3 = productImage3;
	}

	// CRUD OPERATIONS
	public int addProducts() {
		int n = 0;
		try {
			Connection conn = DBConnection.getConnection();

			String qry = "insert into products(productCode,categoryName,productName,description,discount,cost,productImage1,productImage2,productImage3) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.productCode);
			pst.setString(2, this.categoryName);
			pst.setString(3, this.productName);
			pst.setString(4, this.description);
			pst.setInt(5, this.discount);
			pst.setInt(6, this.cost);
			pst.setString(7, this.productImage1);
			pst.setString(8, this.productImage2);
			pst.setString(9, this.productImage3);
			System.out.println("pst=" + pst.toString());
			n = pst.executeUpdate();
		} catch (Exception e) {
			n = 0;
			System.out.println("e:" + e);
		}
		return n;
	}

	public List<Products> getAllProducts() {
	    List<Products> productList = new ArrayList<Products>();
	    try {
	        Connection conn = DBConnection.getConnection(); // Establish DB connection
	        String sql = "SELECT * FROM products"; // Ensure this retrieves all rows
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();

	        // Iterate through all rows and add them to the productList
	        while (rs.next()) {
	            Products products = new Products();
	            products.setProductCode(rs.getInt("productCode"));
	            products.setCategoryName(rs.getString("categoryName"));
	            products.setProductName(rs.getString("productName"));
	            products.setDescription(rs.getString("description"));
	            products.setDiscount(rs.getInt("discount"));
	            products.setCost(rs.getInt("cost"));
	            products.setProductImage1(rs.getString("productImage1"));
	            products.setProductImage2(rs.getString("productImage2"));
	            products.setProductImage3(rs.getString("productImage3"));
	            productList.add(products);
	        }
	        conn.close(); // Close the connection
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return productList;
	}

	public Products getProductsById(int productCode) {
		Products products = null;
		try {
			Connection conn = DBConnection.getConnection();
			String qry = "select * from products where productCode =?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, productCode);
			System.out.println("pst:"+pst.toString());
			ResultSet rs = pst.executeQuery();

			if(rs.next()) {
				products = new Products();
				products.setProductCode(rs.getInt("productCode"));
				products.setCategoryName(rs.getString("productCode"));
				products.setProductName(rs.getString("productName"));
				products.setDescription(rs.getString("description"));
				products.setDiscount(rs.getInt("discount"));
				products.setCost(rs.getInt("cost"));
				products.setProductImage1(rs.getString("productImage1"));
				products.setProductImage2(rs.getString("productImage2"));
				products.setProductImage3(rs.getString("productImage3"));
			}

		} catch (Exception e) {
			products = null;
			System.out.println("Error at getProductsById()" + e);
		}
		return products;
	}
	
	
	public int deleteProductsById(int productCode) {
		int n=0;
		try {
			Connection conn=DBConnection.getConnection();
			String qry="delete from products where productCode=?";
			PreparedStatement pst=conn.prepareStatement(qry);
			pst.setInt(1, productCode);
			System.out.println("pst:"+pst.toString());
			 n=pst.executeUpdate();
		} catch (Exception e) {
			n=0;
			System.out.println("Error at deleteProductsById()"+e);
		}
		return n;
	}
	
	public int updateProductsById() {
		int n=0;
		try {
			Connection conn=DBConnection.getConnection();
			String qry="update products set categoryName=?,productName=?,description=?,discount=?,cost=? where productCode=?";
			PreparedStatement pst=conn.prepareStatement(qry);
			pst.setString(1, this.categoryName);
			pst.setString(2, this.productName);
			pst.setString(3, this.description);
			pst.setInt(4, this.discount);
			pst.setInt(5, this.cost);
			pst.setInt(6, productCode);
			System.out.println("pst:"+pst.toString());
			 n=pst.executeUpdate();
		} catch (Exception e) {
			n=0;
			System.out.println("Error at updateProductsById()"+e);
		}
		return n;
	}
	
	//get records from products table(view)
	public List<Products> getAllProducts(String search){
		
		List<Products> productList=new ArrayList<Products>();
	
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
		    String qry="";
		    if(search==null) {
		     qry="select productCode,categoryName,productName,description,discount,cost,productImage1,productImage2,productImage3 from products order by productName";
		    }else {  //for search products
		    	search = search.toLowerCase();
		    	String words[] = search.split(" ");
		    	String columnNames[] = {"categoryName", "productName", "description"};
		    	qry="select productCode,categoryName,productName,description,discount,cost,productImage1,productImage2,productImage3 from products where ";
		    	
		    	for(String word: words) {
		    		for (String colName: columnNames) {
		    			qry+= "lower("+colName +") like '%" + word + "%' or ";
		    		}
		    	}
		    	
		    	qry = qry.substring(0, qry.length()-3);
		    	
		    	qry +=" order by categoryName, productName";
		    	System.out.println("qry=" + qry);	
		    	
		    }
		    
		    
		    Statement st=(Statement) conn.createStatement();
		    ResultSet rs=st.executeQuery(qry);
		    
		    while(rs.next()) {
		    	Products product= new Products();
		    	product.setProductCode(rs.getInt("productCode"));
		    	product.setCategoryName(rs.getString("categoryName"));
				product.setProductName(rs.getString("productName"));
				product.setDescription(rs.getString("description")); // Set the description parameter
				product.setDiscount(rs.getInt("discount"));
				product.setCost(rs.getInt("cost"));
				product.setProductImage1(rs.getString("productImage1"));
				product.setProductImage2(rs.getString("productImage2"));
				product.setProductImage3 (rs.getString("productImage3"));

			
		    	productList.add(product);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllProducts..:" +e);
			
		}
		return productList;
	}

}
