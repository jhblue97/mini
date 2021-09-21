<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script src="/resources/js/script.js"></script>    
<link rel="stylesheet" 
	  href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/common.css">
<!-- <nav class="navbar navbar-expand navbar-dark bg-dark"> -->
<nav class="navbar navbar-expand">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/"><img src = "../resources/images/bitcoin.png" width = "40">&nbsp; Bit Gallery</a>
		</div>
	</div>
	<div>
	
		<ul class="navbar-nav mr-auto">
			<!-- 로그인에 여부에 따라 표시 처리 ----------------------->
				<c:choose>
				<c:when test="${ empty userid}">
					<li class="nav-item">
						<a class="nav-link"
							href="/login.jsp">Login</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item">
						<span class="nav-link" style="color:white; font-weight: bold;">[ Hello ! ${name}]</span>
					</li>
					<li class="nav-item">
						<a class="nav-link"
							href="/member/updateMember.jsp?id=<%=session.getAttribute("sid")%>">UPDATE</a>
					</li>
					<li class="nav-item">
						<a class="nav-link"
							href="logout.jsp">logout</a>
					</li>
				</c:otherwise>
			</c:choose>
			
		</ul>	
	</div>

</nav>