<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<h2>참가자등수 조회</h2>
<table border=1>
	<tr>
		<td>참가번호</td>
		<td>참가자명</td>
		<td>총점</td>
		<td>평균</td>
		<td>등수</td>
	</tr>
<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
			
			String query = "SELECT " +
				    			"ARTIST.ARTIST_ID, " +
				    			"ARTIST.ARTIST_NAME, " +
				    			"SUM(UPOINT.POINT), " +
				    			"TO_CHAR(SUM(UPOINT.POINT) / 3, 'FM99.00') " +
							"FROM " +
				    			"TBL_ARTIST_201905 ARTIST, TBL_POINT_201905 UPOINT " +
							"WHERE " +
				    			"ARTIST.ARTIST_ID = UPOINT.ARTIST_ID " +
							"GROUP BY " +
				    			"ARTIST.ARTIST_ID, ARTIST.ARTIST_NAME " +
							"ORDER BY " +	
				    			"SUM(UPOINT.POINT) DESC ";		
			int cnt = 0;
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
		
			while(rs.next()){
				cnt++;
		%>
			<tr>
				<td><% out.println(rs.getString(1)); %></td>
				<td><% out.println(rs.getString(2)); %></td>
				<td><% out.println(rs.getInt(3)); %></td>
				<td><% out.println(rs.getString(4)); %></td>
				<td><% out.println(cnt); %></td>
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