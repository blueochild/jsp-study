<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INDEX</title>
</head>
<body>
	<h2>유저 등록</h2>
	<form action="action/Register.jsp" name="action_form">
		<table>
			<tr>
				<td>유저ID</td>
				<td><input type="text" name="userID"></td>
			</tr>
			<tr>
				<td>유저명</td>
				<td><input type="text" name="userNAME"></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
	
	<h2>가입된 유저</h2>
	<%
			
			String query = "SELECT * FROM CHAT_USER";
		
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
				
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
	%>
	<input type="radio" value="가입된 유저">가입된 유저
	<input type="radio" value="채팅">채팅
	<table border=1>
		<tr>
		
			<td>유저ID</td>
			<td>유저명</td>
		</tr>
		<% 
			while(rs.next()){
		%>
		<tr>
			<td><% out.println(rs.getString(1)); %></td>
			<td><% out.println(rs.getString(2)); %></td>
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