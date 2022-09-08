<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<form action="action/insertData.jsp" name="insert_form">
	<table border=1>
		<tr>
			<td>비번호</td>
			<td><input type="text" name="saleno"></td>
		</tr>
		<tr>
			<td>상품코드</td>
			<td><input type="text" name="pcode"></td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input type="text" name="date"></td>
		</tr>
		<tr>
			<td>매장코드</td>
			<td><input type="text" name="scode"></td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="text" name="amount"></td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="submit" value="등록">
				<input type="button" value="다시쓰기" onclick="reset_form()">
			</td>
		</tr>
	</table>
</form>

<script>
	function reset_form(){
		document.insert_form.reset();
	}
</script>