<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
</head>
<h3>SELECT</h3>
<body>

<table border=1>
	<tr>
		<td>피자명</td>
		<td>피자별 판매수익</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_9", "1234");
		if (conn != null) {
			out.println("Database Connected!");
		}
		else {
			out.println("Database Connect Fail!");
		}
		Statement stmt = conn.createStatement();
		String query = "SELECT " +  
    						"PIZZA.PNAME, " +
    						"PIZZA.COST * SUM( SALELIST.AMOUNT ) " +
						"FROM " + 
    						"TBL_PIZZA_01 PIZZA, TBL_SALELIST_01 SALELIST " +
						"WHERE " +
    						"SALELIST.PCODE = PIZZA.PCODE " +
						"GROUP BY " +
    						"PIZZA.PNAME, " +
    						"PIZZA.COST" +
						"ORDER BY " +
    						"PIZZA.COST * SUM( SALELIST.AMOUNT ) desc ";		
		ResultSet rs = stmt.executeQuery(query);
		%>
		<%
		while (rs.next()) {
			%>
					<tr>
						<td><% out.println(rs.getString(1));%></td>
						<td><% out.println(rs.getInt(2));%></td>
					</tr>
			<%
		}
		%>
		<%
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
