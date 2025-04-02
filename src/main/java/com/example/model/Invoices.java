package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import java.util.List;

import dbutils.DBConnection;

public class Invoices implements Serializable {
	private String invoiceNumber;
	private String orderId;
	private int invoiceAmount;
	private String invoiceDate;
	private String invoiceType;
	private String cardNumber;
	private String cardType;
	private String paymentStatus;

	public Invoices() {
		super();
	}

	@Override
	public String toString() {
		return "Invoices [invoiceNumber=" + invoiceNumber + ", orderId=" + orderId + ", invoiceAmount=" + invoiceAmount
				+ ", invoiceDate=" + invoiceDate + ", invoiceType=" + invoiceType + ", cardNumber=" + cardNumber
				+ ", cardType=" + cardType + ", paymentStatus=" + paymentStatus + "]";
	}

	public String getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getInvoiceAmount() {
		return invoiceAmount;
	}

	public void setInvoiceAmount(int invoiceAmount) {
		this.invoiceAmount = invoiceAmount;
	}

	public String getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	public String getInvoiceType() {
		return invoiceType;
	}

	public void setInvoiceType(String invoiceType) {
		this.invoiceType = invoiceType;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public int addInvoice() {
		int n = 0;
		try (Connection conn = DBConnection.getConnection()) {
			String qry = "INSERT INTO invoices (invoiceNumber, orderId, invoiceAmount, invoiceDate, invoiceType, cardNumber, cardType, paymentStatus) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setString(1, this.getInvoiceNumber());
			pst.setString(2, this.getOrderId());
			pst.setInt(3, this.getInvoiceAmount());
			pst.setString(4, this.getInvoiceDate());
			pst.setString(5, this.getInvoiceType());
			pst.setString(6, this.getCardNumber());
			pst.setString(7, this.getCardType());
			pst.setString(8, this.getPaymentStatus());

			System.out.println("Executing: " + pst.toString());
			n = pst.executeUpdate();

			if (n > 0) {
				System.out.println("Invoice added successfully.");
			} else {
				System.out.println("Failed to add invoice.");
			}
		} catch (Exception e) {
			System.out.println("Error in addInvoice(): " + e.getMessage());
			e.printStackTrace();
		}
		return n;
	}

	public boolean paymentInvoice(int customerId, String orderId, String accountNumber, String cardNumber,
			String cardType, String cvvNumber, String expiryDate, int billAmount, String deliverAddress,
			String mobileNumber, String zipCode) {
		boolean status = true;
		try (Connection conn = DBConnection.getConnection()) {
			conn.setAutoCommit(false); // Enable transaction management

			// Step 1: Validate account details
			String qry1 = "SELECT balanceAmount FROM bankaccounts WHERE accountNumber = ? AND cardNumber = ? AND cardType = ? AND cvvNumber = ? AND expiryDate = ? AND balanceAmount >= ?";
			PreparedStatement pst1 = conn.prepareStatement(qry1);
			pst1.setString(1, accountNumber);
			pst1.setString(2, cardNumber);
			pst1.setString(3, cardType);
			pst1.setString(4, cvvNumber);
			pst1.setString(5, expiryDate);
			pst1.setInt(6, billAmount);

			System.out.println("Executing: " + pst1.toString());
			ResultSet rs1 = pst1.executeQuery();

			if (!rs1.next()) {
				System.out.println("Account validation failed.");
				conn.rollback();
				return false;
			}

			// Step 2: Deduct amount from the customer's balance
			int currentBalance = rs1.getInt("balanceAmount");
			int updatedBalance = currentBalance - billAmount;

			String qry2 = "UPDATE bankaccounts SET balanceAmount = ? WHERE accountNumber = ? AND cardNumber = ? AND cardType = ? AND cvvNumber = ? AND expiryDate = ?";
			PreparedStatement pst2 = conn.prepareStatement(qry2);
			pst2.setInt(1, updatedBalance);
			pst2.setString(2, accountNumber);
			pst2.setString(3, cardNumber);
			pst2.setString(4, cardType);
			pst2.setString(5, cvvNumber);
			pst2.setString(6, expiryDate);

			System.out.println("Executing: " + pst2.toString());
			int rowsUpdatedCustomer = pst2.executeUpdate();
			if (rowsUpdatedCustomer <= 0) {
				System.out.println("Failed to update customer balance.");
				conn.rollback();
				return false;
			}

			// Step 3: Add amount to the admin's account
			String adminAccountNumber = "1001"; // Replace with the actual admin account number
			String qry3 = "UPDATE bankaccounts SET balanceAmount = balanceAmount + ? WHERE accountNumber = ?";
			PreparedStatement pst3 = conn.prepareStatement(qry3);
			pst3.setInt(1, billAmount);
			pst3.setString(2, adminAccountNumber);

			System.out.println("Executing: " + pst3.toString());
			int rowsUpdatedAdmin = pst3.executeUpdate();
			if (rowsUpdatedAdmin <= 0) {
				System.out.println("Failed to update admin balance.");
				conn.rollback();
				return false;
			}

			// Step 4: Generate invoice number
			Calendar c = Calendar.getInstance();
			String invoiceNumber = String.format("%d-%d-%d-%d-%d-%d-%d", customerId, c.get(Calendar.DAY_OF_MONTH) + 1,
					c.get(Calendar.MONTH), c.get(Calendar.YEAR), c.get(Calendar.HOUR), c.get(Calendar.MINUTE),
					c.get(Calendar.SECOND));

			// Step 5: Create and store invoice
			this.setInvoiceNumber(invoiceNumber);
			this.setOrderId(orderId);
			this.setInvoiceAmount(billAmount);
			this.setInvoiceDate(String.format("%d-%d-%d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1,
					c.get(Calendar.DAY_OF_MONTH)));
			this.setInvoiceType("online");
			this.setCardNumber(cardNumber);
			this.setCardType(cardType);
			this.setPaymentStatus("successful");

			if (this.addInvoice() == 0) {
				System.out.println("Failed to add invoice.");
				conn.rollback();
				return false;
			}

			// Step 6: Add shipment details
			Shipment shipment = new Shipment();
			shipment.setInvoiceNumber(invoiceNumber);
			shipment.setDeliverAddress(deliverAddress);
			shipment.setMobileNumber(mobileNumber);
			shipment.setZipCode(zipCode);
			shipment.setCustomerId(customerId);

			int n = shipment.addShipment();
			if (n == 0) {
				System.out.println("Failed to add shipment");
				conn.rollback();
				return false;
			} else {
				System.out.println("Shipment added successfully");
			}

			conn.commit(); // Commit the transaction
			System.out.println("Transaction completed successfully.");
		} catch (Exception e) {
			System.out.println("Error in paymentInvoice(): " + e.getMessage());
			e.printStackTrace();
			status = false;
		}
		return status;
	}

}
