<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<table border=1>
	<tr>
		<td>채점번호</td>
		<td>참가번호</td>
		<td>참가자명</td>
		<td>생년월일</td>
		<td>정수</td>
		<td>평점</td>
		<td>멘토</td>
	</tr>
<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
			
			String query = "SELECT " +
							    "UPOINT.SERIAL_NO, " +
				    			"UPOINT.ARTIST_ID, " +
				    			"ARTIST.ARTIST_NAME, " +
				    			"ARTIST.ARTIST_BIRTH, " +
				    			"UPOINT.POINT, " +
				    			"MENTO.MENTO_NAME " +
							"FROM " +
				    			"TBL_ARTIST_201905 ARTIST, TBL_POINT_201905 UPOINT, TBL_MENTO_201905 MENTO " +
							"WHERE " +
				    			"MENTO.MENTO_ID = UPOINT.MENTO_ID AND ARTIST.ARTIST_ID = UPOINT.ARTIST_ID " +
							"ORDER BY " + 
				    			"UPOINT.SERIAL_NO ";			
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			String Rank = "";
			String Y = "";
			String M = "";
			String D = "";
			
			while(rs.next()){
				if( rs.getInt(5) >= 70){
					Rank = "C";
					if( rs.getInt(5) >= 80){
						Rank = "B";
						if( rs.getInt(5) >= 90){
							Rank = "A";
						}
					}
				}
		%>
			<tr>
				<td><% out.println(rs.getInt(1)); %></td>
				<td><% out.println(rs.getString(2)); %></td>
				<td><% out.println(rs.getString(3)); %></td>
				<td><% 
					Y = rs.getString(3);
					M = Y.substring(4, 6);
					D = Y.substring(6);
					Y = Y.substring(0, 4);
					out.println(Y+"년"+M+"월"+D+"일");  
				%></td>
				<td><% out.println(rs.getInt(5)); %></td>
				<td><% out.println(Rank); %></td>
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