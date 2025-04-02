package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbutils.DBConnection;

public class Ratings implements Serializable {
	private int ratingId;
	private int productCode;
	private int rating;
	private String comments;
	private int customerId;
	private String date;

	public Ratings() {
		super();
	}
	

	@Override
	public String toString() {
		return "Ratings [ratingId=" + ratingId + ", productCode=" + productCode + ", rating=" + rating + ", comments="
				+ comments + ", customerId=" + customerId + ", date=" + date + "]";
	}


	// Getters and Setters
	public int getRatingId() {
		return ratingId;
	}

	public void setRatingId(int ratingId) {
		this.ratingId = ratingId;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	// Add Rating
	public int addRating() {
		int result = 0;
		String query = "INSERT INTO rating (productCode, rating, comments, customerId, date) VALUES (?, ?, ?, ?, ?)";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement pst = conn.prepareStatement(query)) {

			pst.setInt(1, this.productCode);
			pst.setInt(2, this.rating);
			pst.setString(3, this.comments);
			pst.setInt(4, this.customerId);
			pst.setString(5, this.date);

			result = pst.executeUpdate();
		} catch (Exception e) {
			System.err.println("Error in addRating: " + e.getMessage());
		}
		return result;
	}

	// Retrieve Ratings by Product Code
	public List<Ratings> getRatingsByCustomerId(int customerId) {
		List<Ratings> ratingsList = new ArrayList<>();
		String query = "SELECT * FROM rating WHERE customerId = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement pst = conn.prepareStatement(query)) {

			pst.setInt(1, customerId);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Ratings rating = new Ratings();
				rating.setRatingId(rs.getInt("ratingId"));
				rating.setProductCode(rs.getInt("productCode"));
				rating.setRating(rs.getInt("rating"));
				rating.setComments(rs.getString("comments"));
				rating.setCustomerId(rs.getInt("customerId"));
				rating.setDate(rs.getString("date"));

				ratingsList.add(rating);
			}
		} catch (Exception e) {
			System.err.println("Error in getRatingsByProductCode: " + e.getMessage());
		}
		return ratingsList;
	}
}