package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutils.DBConnection;

public class Wishlist implements Serializable {
	private int wishId;
	private int productCode;
	private int customerId;
	private String wishlistDate;
	public Wishlist() {
		super();
	}
	public int getWishId() {
		return wishId;
	}
	public void setWishId(int wishId) {
		this.wishId = wishId;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getWishlistDate() {
		return wishlistDate;
	}
	public void setWishlistDate(String wishlistDate) {
		this.wishlistDate = wishlistDate;
	}
	
	public int addwishlist() {
		int n=0;
		try {
			Connection conn = DBConnection.getConnection();
			
			String qry = "insert into wishlist(productCode,customerId,wishlistDate)values(?,?,?)";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.productCode);
			pst.setInt(2, this.customerId);
			pst.setString(3, this.wishlistDate);
			n=pst.executeUpdate();
			
		}catch(Exception e) {
			n = 0;
			System.out.println("e:" + e);
		}
		return n;
	}
	public List<Wishlist> getAllWishlist(){
		List<Wishlist> WishlistList = new ArrayList<Wishlist>();
		try {
			Connection conn = DBConnection.getConnection();
			String qry = "select wishId,productCode,customerId,wishlistDate from wishlist order by wishId";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);
			while(rs.next()) {
			Wishlist wishlists = new Wishlist();
			wishlists.setWishId(rs.getInt("wishId"));
			wishlists.setProductCode(rs.getInt("productCode"));
			wishlists.setCustomerId(rs.getInt("customerId"));
			wishlists.setWishlistDate(rs.getString("wishlistDate"));
			}
		}catch (Exception e) {
			System.out.println("error:getAllWishlist():" + e);
		}
		return WishlistList;
}

public List<Wishlist> getAllWishlistByCustomerId(int customerId){
	List<Wishlist> WishlistList = new ArrayList<Wishlist>();
	try {
		Connection conn = DBConnection.getConnection();
		String qry = "select wishId,productCode,customerId,wishlistDate from wishlist where  customerId=?";
		PreparedStatement pst = conn.prepareStatement(qry);
		pst.setInt(1, customerId);
		System.out.println("pst=" + pst.toString());
		ResultSet rs = pst.executeQuery();
		while(rs.next()) {
		Wishlist wishlists = new Wishlist();
		wishlists.setWishId(rs.getInt("wishId"));
		wishlists.setProductCode(rs.getInt("productCode"));
		wishlists.setCustomerId(rs.getInt("customerId"));
		wishlists.setWishlistDate(rs.getString("wishlistDate"));
		
		WishlistList.add(wishlists);
		}
	}catch (Exception e) {
		System.out.println("error:getAllWishlistByCustomerId():" + e);
	}
	return WishlistList;
}
public int deleteWishlistByProductCode(int productCode) {
	int n = 0;
	try {
		Connection conn = DBConnection.getConnection();

		String qry = "delete from wishlist where productCode=?";
		PreparedStatement pst = conn.prepareStatement(qry);
		pst.setInt(1, productCode);
		System.out.println("pst:" + pst.toString());
		n = pst.executeUpdate();
	} catch (Exception e) {
		n = 0;
	}
	return n;
}

}