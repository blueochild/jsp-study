<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<table border=1>
	<tr>
		<td>비번호</td>
		<td>상품코드</td>
		<td>판매날짜</td>
		<td>매장코드</td>
		<td>상품명</td>
		<td>판매수량</td>
		<td>총판매액</td>
	</tr>
	<%
	try {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection
                            ("jdbc:oracle:thin:@//localhost/xe", "system", "1234");

        String query = "SELECT " +
        	    			"SALELIST.SALENO, " +
        	    			"SALELIST.PCODE, " +
        	    			"SALELIST.SALEDATE, " +
        	    			"SALELIST.SCODE, " +
        	    			"PRODUCT.NAME, " +
        	    			"SALELIST.AMOUNT, " +
        	    			"SALELIST.AMOUNT * PRODUCT.COST " +
        				"FROM " +
        	    			"COFFIE_SALELIST SALELIST, COFFIE_PRODUCT PRODUCT " +
        				"WHERE " +
        	    			"SALELIST.PCODE = PRODUCT.PCODE ";
        
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next()) {
		%>
			<tr>
				<td><% out.println(rs.getString(1)); %></td>
				<td><% out.println(rs.getString(2)); %></td>
				<td><% out.println(rs.getString(3)); %></td>
				<td><% out.println(rs.getString(4)); %></td>
				<td><% out.println(rs.getString(5)); %></td>
				<td><% out.println(rs.getInt(6)); %></td>
				<td><% out.println(rs.getInt(7)); %></td>
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