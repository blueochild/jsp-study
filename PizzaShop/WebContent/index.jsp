<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//	String section = request.getParameter(section) != null ? request.getParameter(section) : "";
	String section = "";
%>

<%@ include file="static/header.jsp"%>
<%@ include file="static/nav.jsp"%> 

<%
	switch(section){
		case "":
			%><%@ include file=""%><%
			break;
	}
%>

<%@ include file="static/footer.jsp"%>