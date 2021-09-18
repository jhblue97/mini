<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exceptionNoPage.jsp</title>
</head>
<body><%-- 
<%@ include file = "../include/header.jsp" %> --%>

<div class = "jumbotron">
	<div class = "container">
		<h2 class = "alter alter-danger">
			요청 하신 페이지를 찾을 수 없습니다. <br>
			リクエストされたページが見つかりません。
		</h2>
	</div>

</div>

<%-- <div class = "container">
	<p><%= request.getRequestURI()%> ? <%= request.getQueryString() %></p>
	<p> 상품 목록 </p>
</div> --%>
<%-- 
<%@ include file = "../include/footer.jsp" %> --%>

</body>
</html>