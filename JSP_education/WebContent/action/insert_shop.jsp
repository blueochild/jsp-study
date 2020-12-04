<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
 
<%
	request.setCharacterEncoding("UTF-8");
	String SCODE = request.getParameter("scode");
	String SNAME = request.getParameter("shop_name");
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
			("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_9", "1234");

		Statement stmt = conn.createStatement();
		
		String query = "INSERT INTO TBL_SHOP_01(SCODE, SNAME) VALUES('%s', '%s')";
		
		ResultSet rs = stmt.executeQuery(String.format(query, SCODE, SNAME)); 

		conn.commit();
		
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("../index.jsp");
%>