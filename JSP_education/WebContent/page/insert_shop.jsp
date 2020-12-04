<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>INSERT</h3>

<script>
	function reset_form(){
		document.input_form.reset();
	}
</script>

<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
			("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_9", "1234");
		
		%>

<form action="action/insert_shop.jsp" method="post" name="input_form">
	<table border=1>
		<tr>
			<td>매장 코드</td>
			<td><input type="text" name="scode"></td>
		</tr>
		<tr>
			<td>매장 이름</td>
			<td><input type="text" name="shop_name"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록하기">
				<input type="button" value="다시쓰기" onclick="reset_form()">
			</td>
		</tr>
	</table>
</form>
<%
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>