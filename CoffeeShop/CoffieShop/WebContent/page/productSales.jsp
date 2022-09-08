<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<table border=1>
	<tr>
		<td>상품코드</td>
		<td>상품명</td>
		<td>상품별 판매액</td>
	</tr>
	<%
	try {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection
                            ("jdbc:oracle:thin:@//localhost/xe", "system", "1234");

        String query = "SELECT " +
    						"PRODUCT.PCODE, " +
    						"PRODUCT.NAME, " +
    						"SUM(PRODUCT.COST * SALELIST.AMOUNT) " +
						"FROM " +
    						"COFFIE_PRODUCT PRODUCT, COFFIE_SALELIST SALELIST " +
						"WHERE " +
    						"PRODUCT.PCODE = SALELIST.PCODE " +
						"GROUP BY " +
    						"PRODUCT.PCODE, PRODUCT.NAME ";
        
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next()) {
		%>
			<tr>
				<td><% out.println(rs.getString(1)); %></td>
				<td><% out.println(rs.getString(2)); %></td>
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