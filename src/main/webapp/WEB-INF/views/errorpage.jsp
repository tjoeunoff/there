<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div{width: 660px; margin:0 auto; margin-top:150px;}
</style>
</head>

<body>
	<div>
		<img src="${pageContext.servletContext.contextPath }/resources/img/errorpage.png" alt="errorpage.png" />
	</div>
</body>
</html>