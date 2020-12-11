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
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	
	<%
		switch(section){
			case "nowSales":
				%><%@ include file="page/nowSales.jsp" %><%
				break;
			case  "shopSales":
				%><%@ include file="page/shopSales.jsp" %><%
				break;
			case "productSales":
				%><%@ include file="page/productSales.jsp" %><%
				break;
			default:
				%><%@ include file="static/index.jsp" %><%
				break;
		}
	%>
	
	<%@ include file="static/footer.jsp" %>
</body>
</html>