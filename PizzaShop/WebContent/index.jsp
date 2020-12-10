<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>

<%@ include file="static/header.jsp"%>
<%@ include file="static/nav.jsp"%> 

<%
	switch(section){
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