package com.example.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutils.DBConnection;

public class Support {
    private int feedbackId;
    private String date;
    private int customerId;
    private String customerQueries;
    private String feedback;

    public Support() {
        super();
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCustomerQueries() {
        return customerQueries;
    }

    public void setCustomerQueries(String customerQueries) {
        this.customerQueries = customerQueries;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    @Override
    public String toString() {
        return "Support [feedbackId=" + feedbackId + ", date=" + date + ", customerId=" + customerId
                + ", customerQueries=" + customerQueries + ", feedback=" + feedback + "]";
    }

    
    // CRUD OPERATIONS
    public int addFeedback() {
        int n = 0;
        try {
            Connection conn = DBConnection.getConnection();
            String qry = "insert into support(feedbackId, date, customerId, customerQueries, feedback) values (?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(qry);
            pst.setInt(1, this.feedbackId);
            pst.setString(2, this.date);
            pst.setInt(3, this.customerId);
            pst.setString(4, this.customerQueries);
            pst.setString(5, this.feedback);
            System.out.println("pst1:" + pst.toString());
            n = pst.executeUpdate();
        } catch (Exception e) {
            n = 0;
            System.out.println("Error at addFeedback:" + e);
        }
        return n;
    }
    
    public List<Support> getAllFeedback() {
		List<Support> queryList = new ArrayList<Support>();
		try {
			Connection conn = DBConnection.getConnection();

			String qry = "select * from support order by feedbackId";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {
				Support support = new Support();
				support.setFeedbackId(rs.getInt("feedbackId"));
				support.setDate(rs.getString("date"));
		        support.setCustomerId(rs.getInt("customerId")); 
		        support.setCustomerQueries(rs.getString("customerQueries"));
		        support.setFeedback(rs.getString("feedback"));
				queryList.add(support);
				
			}
		} catch (Exception e) {
			System.out.println("error:getAllCarts():" + e);
		}
		return queryList;
	}
    public int updateFeedback() {
        int n = 0;
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            // Get database connection
            conn = DBConnection.getConnection();

            // Corrected SQL query with commas between columns
            String qry = "update support set feedback=? where feedbackId=?";
            pst = conn.prepareStatement(qry);

            // Set parameter values
            pst.setString(1, this.feedback);
            pst.setInt(2, this.feedbackId);

            // Debugging output
            System.out.println("PreparedStatement: " + pst.toString());

            // Execute the update
            n = pst.executeUpdate();
        } catch (Exception e) {
            n = 0;
            // Better error logging
            System.out.println("Error at updateFeedback: " + e.getMessage());
            e.printStackTrace();
        } 
        
        return n;
    }

    
}
