<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String section = request.getParameter("section") != null ? request.getParameter("section") : "";
		int[] array = {1,2,3,11,12,13,21,22,23,31,32,33,41,42,43};
	%>
	<a href="index.jsp?section=A">A</a>
	<a href="index.jsp?section=B">B</a>
	<a href="index.jsp?section=C">C</a>
	<%
		switch(section){
			case "A":
				%><%@ include file="pages/A.jsp"%><%
				break;
			case "B":
				%><%@ include file="pages/B.jsp"%><%
				break;
			case "C":
				%><%@ include file="pages/C.jsp"%><%
				break;
			default:
				%><h2>메인 페이지입니다.</h2><%
		}
	%>
	<table border=1>
		<tr>
		<% 
		int cnt = 0;
		for(int number : array){
			cnt++;
			%><td><%= number %></td><%
			if(cnt % 3 == 0){
				%></tr><tr><%	
			}
		}
		%>
	</table>
</body>
</html>