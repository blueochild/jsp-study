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
			<td>판매한 상품</td>
			<td>수량</td>
			<td>판매날짜</td>
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
				    			"TBL_PRODUCT.NAME, " +
				    			"SUM(TBL_SALE.SALE_PRICE), " +
				    			"SUM(TBL_SALE.AMOUNT) " +
							"FROM " +
				    			"TBL_PRODUCT, TBL_SALE " +
							"WHERE " +
				    			"TBL_PRODUCT.product_id = TBL_SALE.product_id " +
							"GROUP BY " +
				    			"TBL_PRODUCT.NAME ";

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
		
			while(rs.next()){
		%>
			<tr>
				<td><% out.println(rs.getString(1)); %></td>
				<td><% out.println(rs.getInt(2)); %></td>
				<td><% out.println(rs.getInt(3)); %></td>
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