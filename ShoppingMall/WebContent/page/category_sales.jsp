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
	<table>
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
				    			"TBL_SALE.sale_id, " +
				    			"TBL_PRODUCT.name, " +
				    			"TBL_SALE.purchase_date, " +
				    			"TBL_SALE.sale_price, " +
				    			"TBL_SALE.amount " +
							"FROM " +
				    			"TBL_SALE, TBL_PRODUCT " + 
							"WHERE " +
				    			"TBL_SALE.product_id = TBL_PRODUCT.product_id ";		
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
		
			while(rs.next()){
		%>
			<tr>
				<td><% %></td>
				<td><% %></td>
				<td><% %></td>
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