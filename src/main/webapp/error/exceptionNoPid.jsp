<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exceptionNoPid.jsp</title>
</head>
<body>

<div class = "jumbotron">
	<div class = "container">
		<h2 class = "alert alert-danger">
			해당 상품이 존재하지 않습니다.
		</h2>
	</div>

</div>

<div class = "container">
	<p><%= request.getRequestURI()%> ? <%= request.getQueryString() %></p>
	<p> 상품 목록 </p>
</div>


</body>
</html>