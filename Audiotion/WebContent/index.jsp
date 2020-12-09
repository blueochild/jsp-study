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
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	
	<% String section = request.getParameter("section") != null ? request.getParameter("section") : ""; %>
	
	<%
		switch(section){
			case "AuditionInput":
				%><%@ include file="page/AuditionInput.jsp" %><%
				break;
			case "UserList":
				%><%@ include file="page/UserList.jsp" %><%
				break;
			case "MentoPoint":
				%><%@ include file="page/MentoPoint.jsp" %><%
				break;
			case "UserRank":
				%><%@ include file="page/UserRank.jsp" %><%
				break;
			default :
				%><%@ include file="static/index.jsp" %><%
				break;
		}
	%>
	
	<%@ include file="static/footer.jsp" %>
	
</body>
</html>