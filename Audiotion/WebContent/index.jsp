<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String section = request.getParameter("section") != null ? request.getParameter("section") : ""; %>
	
	<import file="static/header">
	
	<%
		switch(section){
			case "":
				break;
		}
	%>
	
	<import file="static/footer">
	
</body>
</html>