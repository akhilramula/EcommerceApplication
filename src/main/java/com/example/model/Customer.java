package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutils.DBConnection;

public class Customer implements Serializable {

	private int customerId;
	private String firstName;
	private String lastName;
	private String mobileNumber;
	private String emailId;
	private String password;
	private String profilePic;
	private String registerDate;

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", mobileNumber=" + mobileNumber + ", emailId=" + emailId + ", password=" + password + ", profilePic="
				+ profilePic + ", registerDate=" + registerDate + "]";
	}

	public Customer() {
		super();
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	// crud operations
	public Customer validateCustomerLogin() {
	    Customer customer = null;  // Initialize as null
	    try {
	        Connection conn = DBConnection.getConnection();

	        String qry = "select customerId from customers where emailId=? and password=?";
	        PreparedStatement pst = conn.prepareStatement(qry);
	        pst.setString(1, this.emailId);
	        pst.setString(2, this.password);
	        System.out.println("pst1=" + pst.toString());
	        ResultSet rs = pst.executeQuery();

	        if (rs.next()) {
	            // Get the customerId from the result set
	            int customerId = rs.getInt("customerId");
	            
	            // Now fetch the full customer object based on customerId
	            customer = getCustomerByCustomerId(customerId);
	        } else {
	            // No matching customer found
	            customer = null;
	        }

	        pst.close();
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("Error at validateCustomerLogin():" + e);
	    }
	    return customer;
	}

	public int addCustomers() {
		int n = 0;
		try {
			Connection conn = DBConnection.getConnection();

			String qry = "insert into customers(firstName,lastName,mobileNumber,emailId,password,profilePic)values(?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setString(1, this.firstName);
			pst.setString(2, this.lastName);
			pst.setString(3, this.mobileNumber);
			pst.setString(4, this.emailId);
			pst.setString(5, this.password);
			pst.setString(6, this.profilePic);

			System.out.println("pst2=" + pst.toString());
			n = pst.executeUpdate();
		} catch (Exception e) {
			n = 0;
			System.out.println("e:" + e);
		}
		return n;
	}

	public Customer getCustomerByCustomerId(int customerId) {
		Customer customer = new Customer();
		try {
			Connection conn = DBConnection.getConnection();
			String qry = "select * from customers where customerId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			System.out.println("pst3:" + pst.toString());
			pst.setInt(1, customerId);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				customer.setCustomerId(rs.getInt("customerId"));
				customer.setFirstName(rs.getString("firstName"));
				customer.setLastName(rs.getString("lastName"));
				customer.setMobileNumber(rs.getString("mobileNumber"));
				customer.setEmailId(rs.getString("emailId"));
				customer.setPassword(rs.getString("password"));
				customer.setProfilePic(rs.getString("profilePic"));
				customer.setRegisterDate(rs.getString("registerDate"));
			}
			conn.close();
			pst.close();
		} catch (Exception e) {
			customer = null;
			e.printStackTrace();
		}
		return customer;

	}
	
	public int updateCustomer() {
		int n=0;
		try {
			Connection conn=DBConnection.getConnection();
			String qry="update customers set firstName=?,lastName=?,mobileNumber=?,password=? where customerId=?";
			PreparedStatement pst=conn.prepareStatement(qry);
			pst.setString(1, this.firstName);
			pst.setString(2, this.lastName);
			pst.setString(3, this.mobileNumber);
			pst.setString(4, this.password);
			pst.setInt(5,this.customerId);
			System.out.println("pst4:"+pst.toString());
			 n=pst.executeUpdate();
		} catch (Exception e) {
			n=0;
			System.out.println("Error at updateCustomer()"+e);
		}
		return n;
	}
	
	

}
