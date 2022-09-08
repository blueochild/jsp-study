<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<section class="page">
	<h2>상품별 매출 현황</h2>
	<table border=1>
		<tr>
			<td>피자코드</td>
			<td>피자 명</td>
			<td>총매출액</td>
		</tr>
<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
			
			String query = "SELECT " +
				    			"PIZZA.PCODE, " +
				    			"PIZZA.PNAME, " +
				    			"TO_CHAR(SUM(PIZZA.COST * SALELIST.AMOUNT), 'L999,999,999') " +
							"FROM " +
				    			"PIZZA, SALELIST " +
							"WHERE " +
				    			"PIZZA.PCODE = SALELIST.PCODE " +
							"GROUP BY " +
				    			"PIZZA.PCODE, PIZZA.PNAME " +
							"ORDER BY " +
				    			"SUM(PIZZA.COST * SALELIST.AMOUNT) DESC ";
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
			%>
				<tr>
					<td><% out.println(rs.getString(1)); %></td>
					<td><% out.println(rs.getString(2)); %></td>
					<td><% out.println(rs.getString(3)); %></td>
				</tr>
			<%
			}
			
			stmt.close();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</table>
</section>