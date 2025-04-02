<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%
    // Invalidate the user session
    session = request.getSession(false); // Get the current session if it exists
    if (session != null) {
        session.invalidate(); // Invalidate the session to log out the user
    }
    // Redirect the user to the login page
    response.sendRedirect("index.jsp");
%>
