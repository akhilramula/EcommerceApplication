package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutils.DBConnection;

public class Cart implements Serializable {
	private int cartId;
	private int productCode;
	private String selectedDate;
	private int customerId;
	private int quantity;

	public Cart() {
		super();
	}

	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", productCode=" + productCode + ", selectedDate=" + selectedDate
				+ ", customerId=" + customerId + ", quantity=" + quantity + "]";
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public String getSelectedDate() {
		return selectedDate;
	}

	public void setSelectedDate(String selectedDate) {
		this.selectedDate = selectedDate;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int addCart() {
		int n = 0;
		try {
			Connection conn = DBConnection.getConnection();
			String qry = "insert into cart(productCode,selectedDate,customerId)values(?,?,?)";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.productCode);
			pst.setString(2, this.selectedDate);
			pst.setInt(3, this.customerId);
			n = pst.executeUpdate();
		} catch (Exception e) {
			n = 0;
			System.out.println("e:" + e);
		}
		return n;
	}

	public List<Cart> getAllCarts() {
		List<Cart> cartList = new ArrayList<Cart>();
		try {
			Connection conn = DBConnection.getConnection();

			String qry = "select cartId,productCode,selectedDate,customerId from cart order by cardId";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {
				Cart cart = new Cart();
				cart.setCartId(rs.getInt("cartId"));
				cart.setProductCode(rs.getInt("productCode"));
				cart.setSelectedDate(rs.getString("selectedDate"));
				cart.setCustomerId(rs.getInt("customerId"));
				cartList.add(cart);
			}
		} catch (Exception e) {
			System.out.println("error:getAllCarts():" + e);
		}
		return cartList;
	}

	public List<Cart> getCartByCustomerId(int customerId) {
		List<Cart> cartList = new ArrayList<Cart>();
		try {

			Connection conn = DBConnection.getConnection();

			String qry = "select cartId,productCode,selectedDate,customerId from cart where customerId=?";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, customerId);
			System.out.println("pst11: " + pst.toString());
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Cart cart = new Cart();
				cart.setCartId(rs.getInt("cartId"));
				cart.setProductCode(rs.getInt("productCode"));
				cart.setSelectedDate(rs.getString("selectedDate"));
				cart.setCustomerId(rs.getInt("customerId"));
				cartList.add(cart);

			}

		} catch (Exception e) {

			System.out.println("error:getCartByCustomerId():" + e);
		}
		return cartList;
	}

	public int deleteCartByProductCode(int productCode) {
		int n = 0;
		try {
			Connection conn = DBConnection.getConnection();

			String qry = "delete from cart where productCode=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, productCode);
			n = pst.executeUpdate();
		} catch (Exception e) {
			n = 0;
		}
		return n;
	}

	public int updateCartByCartId() {
		int n = 0;
		try {
			Connection conn = DBConnection.getConnection();

			String qry = "update cart set productCode=?,selectedDate=?,customerId=? where cartId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.productCode);
			pst.setString(2, this.selectedDate);
			pst.setInt(3, this.customerId);
			pst.setInt(4, this.cartId);
			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}

	public int clearCartByCustomerId(int customerId) {
		int n = 0;
		try {
			Connection conn = DBConnection.getConnection();
			String qry = "DELETE FROM cart WHERE customerId = ?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, customerId);
			n = pst.executeUpdate();
		} catch (Exception e) {
			n = 0;
			System.out.println("Error clearing cart for customerId: " + e);
		}
		return n;
	}

}
