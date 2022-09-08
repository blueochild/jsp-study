<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/css.css">
<%
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>
</head>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	
	<%
		switch(section){
		case "sale_push":
			%><%@ include file="page/sale_push.jsp" %><%
			break;
		case "total_sales":
			%><%@ include file="page/total_sales.jsp" %><%
			break;
		case "product_sales":
			%><%@ include file="page/product_sales.jsp" %><%
			break;
		case "category_sales":
			%><%@ include file="page/category_sales.jsp" %><%
			break;
		default:
			%><%@ include file="static/index.jsp" %><%
		}
	%>
	
	<%@ include file="static/footer.jsp" %>
</body>
</html>