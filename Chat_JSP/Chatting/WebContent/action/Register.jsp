<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	String ID = request.getParameter("userID");
	String NAME = request.getParameter("userNAME");
	String query = "INSERT INTO CHAT_USER(USER_ID, USER_NAME) VALUES('%s', '%s') ";
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(String.format(query, ID, NAME));

		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("../index.jsp");
%>