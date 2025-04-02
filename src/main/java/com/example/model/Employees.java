package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutils.DBConnection;

public class Employees implements Serializable {
	private int employeeId;
	private String firstName;
	private String lastName;
	private String gender;
	private String mobile;
	private String email;
	private String designation;
	private String password;
	private String employeepic;

	public Employees() {
		super();
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmployeepic() {
		return employeepic;
	}

	public void setEmployeepic(String employeepic) {
		this.employeepic = employeepic;
	}
////CRUD Operations

	/////////////////
	////// Add Employees
	/////////////////
	public int addEmployees() {
		int n = 0;
		try {

			Connection conn = DBConnection.getConnection();

			String qry = "insert into employees (employeeId,firstName,lastName,gender,mobile,email,designation,password,employeepic)values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.employeeId);
			pst.setString(2, this.firstName);
			pst.setString(3, this.lastName);
			pst.setString(4, this.gender);
			pst.setString(5, this.mobile);
			pst.setString(6, this.email);
			pst.setString(7, this.designation);
			pst.setString(8, this.password);
			pst.setString(9, this.employeepic);
			n = pst.executeUpdate();
		} catch (Exception e) {
			n = 0;
			System.out.println("e:" + e);
		}
		return n;
	}

//////////////////
////Get all Employees records as list
///////////////////
	public List<Employees> getAllEmployees() {
		List<Employees> employeesList = new ArrayList<Employees>();
		try {

			Connection conn = DBConnection.getConnection();

			String qry = "select employeeId,firstName,lastName,gender,mobile,email,designation,password,employeepic from employees order by employeeId ";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);
			while (rs.next()) {
				Employees employees = new Employees();
				employees.setEmployeeId(rs.getInt("employeeId"));
				employees.setFirstName(rs.getString("firstName"));
				employees.setLastName(rs.getString("lastName"));
				employees.setGender(rs.getString("gender"));
				employees.setMobile(rs.getString("mobile"));
				employees.setEmail(rs.getString("email"));
				employees.setDesignation(rs.getString("designation"));
				employees.setPassword(rs.getString("password"));
				employees.setEmployeepic(rs.getString("employeepic"));
				employeesList.add(employees);
			}
		} catch (Exception e) {
			System.out.println("error:getAllEmployees():" + e);
		}
		return employeesList;
	}

//////////////////
////Get  employees by employeeid
///////////////////
	public Employees getEmployeesByEmployeeId(int employeeId) {
		Employees employees = null;
		try {

			Connection conn = DBConnection.getConnection();
			String qry = "select employeeId,firstName,lastName,gender,mobile,email,designation,password,employeepic from employees where employeeId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, employeeId);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				employees = new Employees();
				employees.setEmployeeId(rs.getInt("employeeId"));
				employees.setFirstName(rs.getString("firstName"));
				employees.setLastName(rs.getString("lastName"));
				employees.setGender(rs.getString("gender"));
				employees.setMobile(rs.getString("mobile"));
				employees.setEmail(rs.getString("email"));
				employees.setDesignation(rs.getString("designation"));
				employees.setPassword(rs.getString("password"));
				employees.setEmployeepic(rs.getString("employeepic"));

			}
		} catch (Exception e) {

			System.out.println("error:getEmployeesByEmployeeId():" + e);
		}
		return employees;
	}

//////////////////
////Delete employees BY employeeid
///////////////////
	public int deleteEmployeesbyEmployeeId(int employeeId) {
		int n = 0;
		try {
			Connection conn = DBConnection.getConnection();

			String qry = "delete from employees where employeeId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, employeeId);
			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}

//////////////////
////update employee by employeeId
///////////////////
	public int updateEmployeesByEmployeeId() {
		int n = 0;
		try {
			Connection conn = DBConnection.getConnection();
			String qry = "update employees set employeeId=?,firstName=?,lastname=?,gender=?,mobile=?,email=?,designation=?,password=?,employeepic=? where employeeId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.employeeId);
			pst.setString(2, this.firstName);
			pst.setString(3, this.lastName);
			pst.setString(4, this.gender);
			pst.setString(5, this.mobile);
			pst.setString(6, this.email);
			pst.setString(7, this.designation);
			pst.setString(8, this.password);
			pst.setString(9, this.employeepic);

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}
}