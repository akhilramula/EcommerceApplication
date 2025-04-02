package com.example.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dbutils.DBConnection;

public class Shipment {
	private int shipmentId;
	private String invoiceNumber;
	private int customerId;
	private String deliverAddress;
	private String mobileNumber;
	private String zipCode;

	public Shipment() {
		super();
	}

	public int getShipmentId() {
		return shipmentId;
	}

	public void setShipmentId(int shipmentId) {
		this.shipmentId = shipmentId;
	}

	public String getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getDeliverAddress() {
		return deliverAddress;
	}

	public void setDeliverAddress(String deliverAddress) {
		this.deliverAddress = deliverAddress;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	@Override
	public String toString() {
		return "Shipment [shipmentId=" + shipmentId + ", invoiceNumber=" + invoiceNumber + ", customerId=" + customerId
				+ ", deliverAddress=" + deliverAddress + ", mobileNumber=" + mobileNumber + ", zipCode=" + zipCode
				+ "]";
	}

	// CRUD OPERATIONS
	public int addShipment() {
		int n = 0;
		try {
			Connection conn = DBConnection.getConnection();
			String qry = "insert into shipment(invoiceNumber,customerId,deliverAddress,mobileNumber,zipCode)values(?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setString(1, this.invoiceNumber);
			pst.setInt(2, this.customerId);
			pst.setString(3, this.deliverAddress);
			pst.setString(4, this.mobileNumber);
			pst.setString(5, this.zipCode);
			System.out.println("pst1:" + pst.toString());
			n = pst.executeUpdate();
		} catch (Exception e) {
			n = 0;
			System.out.println("Error at addShipment:" + e);
		}
		return n;
	}

	public int updateShipment() {
		int n = 0;
		try {
			Connection conn = DBConnection.getConnection();

			String qry = "update shipment set deliverAddress=?,mobileNumber=?,zipCode=? where customerId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setString(1, this.deliverAddress);
			pst.setString(2, this.mobileNumber);
			pst.setString(3, this.zipCode);
			pst.setInt(4, this.customerId);
			System.out.println("pst2:" + pst.toString());
			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
			System.out.println("Error at updateShipment:" + e);
		}
		return n;
	}
}
