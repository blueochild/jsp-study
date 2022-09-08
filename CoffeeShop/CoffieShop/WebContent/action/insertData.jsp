<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	String saleno = request.getParameter("saleno");
	String pcode = request.getParameter("pcode");
	String date = request.getParameter("date");
	String scode = request.getParameter("scode");
	int amount = Integer.parseInt(request.getParameter("amount"));
	
	String query = "INSERT INTO COFFIE_SALELIST(SALENO, PCODE, SALEDATE, SCODE, AMOUNT) "+
						"VALUES('%s', '%s', '%s', '%s', %d)";
	
	try {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection
                            ("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
        
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(String.format(query,saleno, pcode, date, scode, amount));

        stmt.close();
        conn.close();
    }
    catch (Exception e) {
        e.printStackTrace();
    }
	
	response.sendRedirect("../index.jsp");
	
%>