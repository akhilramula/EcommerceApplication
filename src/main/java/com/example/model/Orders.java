package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbutils.DBConnection;

public class Orders implements Serializable {
	private String orderId;
	private int customerId;
	private String invoiceNumber;
	private int productCode;
	private String orderDateTime;
	private int cost;
	private int discountAmount;
	private int quantity;
	private int gstAmount;
	private int billAmount;
	private String orderStatus;

	public Orders() {
		super();
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public String getOrderDateTime() {
		return orderDateTime;
	}

	public void setOrderDateTime(String orderDateTime) {
		this.orderDateTime = orderDateTime;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getDiscountAmount() {
		return discountAmount;
	}

	public void setDiscountAmount(int discountAmount) {
		this.discountAmount = discountAmount;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getGstAmount() {
		return gstAmount;
	}

	public void setGstAmount(int gstAmount) {
		this.gstAmount = gstAmount;
	}

	public int getBillAmount() {
		return billAmount;
	}

	public void setBillAmount(int billAmount) {
		this.billAmount = billAmount;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", customerId=" + customerId + ", invoiceNumber=" + invoiceNumber
				+ ", productCode=" + productCode + ", orderDateTime=" + orderDateTime + ", cost=" + cost
				+ ", discountAmount=" + discountAmount + ", quantity=" + quantity + ", gstAmount=" + gstAmount
				+ ", billAmount=" + billAmount + ", orderStatus=" + orderStatus + "]";
	}

	public int addCustomerOrders() {

		int n = 0;
		try {
			Connection conn = DBConnection.getConnection();

			String qry = "insert into orders(orderId,customerId,invoiceNumber,productCode,orderDateTime,cost,discountAmount,quantity,gstAmount,billAmount,orderStatus)values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(qry);

			pst.setString(1, this.getOrderId());
			pst.setInt(2, this.getCustomerId());
			pst.setString(3, this.getInvoiceNumber());
			pst.setInt(4, this.getProductCode());
			pst.setString(5, this.getOrderDateTime());
			pst.setInt(6, this.getCost());
			pst.setInt(7, this.getDiscountAmount());
			pst.setInt(8, this.getQuantity());
			pst.setInt(9, this.getGstAmount());
			pst.setInt(10, this.getBillAmount());
			pst.setString(11, this.getOrderStatus());

			System.out.println("pst1:=" + pst.toString());
			n = pst.executeUpdate();
		} catch (Exception e) {
			n = 0;
			System.out.println("e:" + e);
		}
		return n;
	}
	//////////////////////////////////////
	///// get order list
	//////////////////////////////////////

	public List<Orders> getAllCustomerOrdersByCustomerId(int customerId) {
		List<Orders> orderList = new ArrayList<Orders>();
		try {
			Connection conn = DBConnection.getConnection();
			String qry = "SELECT orderId,customerId,invoiceNumber,productCode,orderDateTime,cost,discountAmount,quantity,gstAmount,billAmount,orderStatus FROM customerorders WHERE customerId = ? ORDER BY orderId";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, customerId);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Orders corder = new Orders();
				corder.setOrderId(rs.getString("orderId"));
				corder.setCustomerId(rs.getInt("customerId"));
				corder.setInvoiceNumber(rs.getString("invoiceNumber"));
				corder.setProductCode(rs.getInt("productCode"));
				corder.setOrderDateTime(rs.getString("orderDateTime"));
				corder.setCost(rs.getInt("cost"));
				corder.setDiscountAmount(rs.getInt("discountAmount"));
				corder.setQuantity(rs.getInt("quantity"));
				corder.setGstAmount(rs.getInt("gstAmount"));
				corder.setBillAmount(rs.getInt("billAmount"));
				corder.setOrderStatus(rs.getString("orderStatus"));

				orderList.add(corder);
			}

			rs.close();
			pst.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("error:getAllCustomerOrdersByCustomerId():" + e);
		}
		return orderList;
	}

}