<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/css.css">
</head>
<body>
<%
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>

<%@ include file="static/header.jsp"%>
<%@ include file="static/nav.jsp"%> 

<%
	switch(section){
		case "InsertSale":
			%><%@ include file="page/InsertSale.jsp"%><%
			break;
		case "TotalSales":
			%><%@ include file="page/TotalSales.jsp"%><%
			break;
		case "ShopSales":
			%><%@ include file="page/ShopSales.jsp"%><%
			break;
		case "ProductSales":
			%><%@ include file="page/ProductSales.jsp"%><%
			break;
		default :
			%><%@ include file="static/index.jsp"%><%
			break;
	}
%>

<%@ include file="static/footer.jsp"%>
</body>
</html>