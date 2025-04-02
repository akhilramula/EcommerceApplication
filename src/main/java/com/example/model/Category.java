package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutils.DBConnection;

public class Category implements Serializable {
	private int categoryId;
	private String categoryName;

	public Category() {
		super();
	}

	
	
	
	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryName=" + categoryName + "]";
	}




	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
////CRUD Operations

	/////////////////
	////// Add Category
	/////////////////

	public int addCategory() {
		int n = 0;
		try {
			Connection conn = DBConnection.getConnection();

			String qry = "insert into category (categoryName)values(?)";
			PreparedStatement pst = conn.prepareStatement(qry);
			
			pst.setString(1, this.categoryName);
			System.out.println("pst=" + pst.toString());
			n = pst.executeUpdate();
		} catch (Exception e) {
			n = 0;
			System.out.println("e:" + e);
		}
		return n;
	}
//////////////////
//// Get all Category records as list
///////////////////

	public List<Category> getAllCategories() {
		List<Category> categoryList = new ArrayList<Category>();
		try {
			Connection conn = DBConnection.getConnection();

			String qry = "select categoryId,categoryName from category order by categoryid";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {
				Category category = new Category();
				category.setCategoryId(rs.getInt("categoryId"));
				category.setCategoryName(rs.getString("categoryName"));
				categoryList.add(category);
			}
		} catch (Exception e) {
			System.out.println("error:getAllCategories():" + e);
		}
		return categoryList;
	}

//////////////////
////Get  category by category id
///////////////////

	public Category getCategoryByCategoryId(int categoryId) {
		Category category = null;
		try {

			Connection conn = DBConnection.getConnection();

			String qry = "select categoryId,categoryName from category where categoryId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, categoryId);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				category = new Category();
				category.setCategoryId(rs.getInt("categoryId"));
				category.setCategoryName(rs.getString("categoryName"));

			}

		} catch (Exception e) {

			System.out.println("error:getEmployeeByEmpno():" + e);
		}
		return category;
	}

//////////////////
////Delete category BY categoryid
///////////////////
	public int deleteCategoryByCategoryId(int categoryId) {
		int n = 0;
		try {
			Connection conn = DBConnection.getConnection();

			String qry = "delete from category where categoryId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, categoryId);
			n = pst.executeUpdate();
		} catch (Exception e) {
			n = 0;
			System.out.println("Error at deleteCategoryByCategoryid()"+e);
		}
		return n;
	}

//////////////////
////update employee by empno
///////////////////
	public int updateCategoryByCategoryId() {
		int n = 0;
		try {
			Connection conn = DBConnection.getConnection();

			String qry = "update category set categoryName=? where categoryId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setString(1, this.categoryName);

			pst.setInt(2, this.categoryId);

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
			System.out.println("Error at updateCategoryByCategoryid()");
		}
		return n;
	}
	
	
	public List<String> getAllCategoriesByName() {
		List<String> categoryList = new ArrayList<String>();
		try {
			Connection conn = DBConnection.getConnection();

			String qry = "select categoryName from category order by categoryName";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {
				
				categoryList.add(rs.getString("categoryName"));
				
			}
		} catch (Exception e) {
			System.out.println("error:getAllCategories():" + e);
		}
		return categoryList;
	}
}