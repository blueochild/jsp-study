<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h2>참가자목록 조회</h2>
<table border=1>
	<tr>
		<td>참가번호</td>
		<td>참가자명</td>
		<td>생년월일</td>
		<td>성별</td>
		<td>특기</td>
		<td>소속사</td>
	</tr>
<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
			
			String query = "SELECT * FROM TBL_ARTIST_201905 ";	
			String Y = "";
			String M = "";
			String D = "";
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
		%>
			<tr>
				<td><% out.println(rs.getString(1)); %></td>
				<td><% out.println(rs.getString(2)); %></td>
				<td><% 
					Y = rs.getString(3);
					M = Y.substring(4, 6);
					D = Y.substring(6);
					Y = Y.substring(0, 4);
					out.println(Y+"년"+M+"월"+D+"일"); 
				%></td>
				<td><% out.println(rs.getString(4).equals("F") ? "여":"남"); %></td>
				<td><% 
					if(rs.getString(5).equals("1")){
						out.println("보컬");	
					}else if(rs.getString(5).equals("2")){
						out.println("댄스");	
					}else if(rs.getString(5).equals("3")){
						out.println("랩");	
					}
				%></td>
				<td><% out.println(rs.getString(6)); %></td>
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