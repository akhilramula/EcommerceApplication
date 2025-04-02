package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbutils.DBConnection;

public class Admin implements Serializable {
	// table columns
	private String username;
	private String password;
	private String role;

	
	@Override
	public String toString() {
		return "Admin [username=" + username + ", password=" + password + ", role=" + role + "]";
	}

	// default constructor
	public Admin() {
		super();
	}

	// setters and getters
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean validateAdminLogin() {
		boolean flag = false;
		try {
			Connection conn = DBConnection.getConnection();
			if(conn==null) {
				return flag;
			}
			
			String qry = String.format(
					"select * from admin where username=? and password=? and role=?");
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setString(1, this.username);
			pst.setString(2, this.password);
			pst.setString(3, this.role);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				flag = true; // user exists
			} else {
				flag = false;// user does not exists
			}
			
			pst.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
			System.out.println("Error at validateAdminLogin():" + e);
		}
		return flag;
	}

}
