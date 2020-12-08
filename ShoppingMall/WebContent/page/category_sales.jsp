<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<tr>
			<td>상품명</td>
			<td>총 판매 금액</td>
			<td>판매 개수</td>
		</tr>
		<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
			if (conn != null) {
			System.out.println("Database Connected!");
			}
			else {
			System.out.println("Database Connect Fail!");
			}
			
			String query = "SELECT " +
				    			"TBL_CATEGORY.NAME, " +
				   				"SUM(TBL_PRODUCT.PRICE * TBL_SALE.AMOUNT), " +
				    			"SUM(TBL_SALE.AMOUNT) " +
							"FROM " +
				    			"TBL_CATEGORY, TBL_SALE, TBL_PRODUCT " +
							"WHERE " +
				    			"TBL_CATEGORY.CATEGORY_ID = TBL_PRODUCT.CATEGORY_ID AND " +
				    			"TBL_PRODUCT.PRODUCT_ID = TBL_SALE.PRODUCT_ID " + 
							"GROUP BY " +
				    			"TBL_CATEGORY.NAME ";		
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
		
			while(rs.next()){
		%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getInt(2) %></td>
				<td><%= rs.getInt(3)%></td>
			</tr>
		<%
			}
			stmt.close();
			conn.close();
			}
			catch (Exception e) {
			e.printStackTrace();
			}
		%>
	</table>
</body>
</html>