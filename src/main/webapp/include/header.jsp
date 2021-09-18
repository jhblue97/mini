<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script src="/resources/js/script.js"></script>    
<link rel="stylesheet" 
	  href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/common.css">
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/">Home</a>
		</div>
	</div>
	<div>
		<%-- <ul class="navbar-nav mr-auto">
			<!-- 로그인에 여부에 따라 표시 처리 ----------------------->
			<c:choose>
				<c:when test="${ empty sid }">
					<li class="nav-item">
						<a class="nav-link"
							href="/member/loginMember.jsp">로그인</a>
					</li>
						<li class="nav-item">
						<a class="nav-link"
							href="/member/addMember.jsp">회원가입</a>
					</li>
				</c:when>
				로그인한 경우에만 표시 --------------------------
				<c:otherwise>
					<li class="nav-item">
						<span class="nav-link" style="color:white; font-weight: bold;">[ ${sid }님]</span>
					</li>
					<li class="nav-item">
						<a class="nav-link"
							href="/member/updateMember.jsp?id=<%=session.getAttribute("sid")%>">회원수정</a>
					</li>
					<li class="nav-item">
						<a class="nav-link"
							href="/member/logoutMember.jsp">로그아웃</a>
					</li>
				</c:otherwise>
			</c:choose>
			<li class="nav-item">
				<a class="nav-link"
					href="/BoardList.do?pageNum=1">게시판</a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link"
					href="/product/productList.jsp">상품목록</a>
			</li>
			<li class="nav-item">
				<a class="nav-link"
					href="/product/productAdd.jsp">상품등록</a>
			</li>
			<li class="nav-item">
				<a class="nav-link"
					href="/product/productEdit.jsp?edit=modify">상품수정</a>
			</li>
			<li class="nav-item">
				<a class="nav-link"
					href="/product/productEdit.jsp?edit=remove">상품삭제</a>
			</li>
		</ul>	 --%>
	</div>

</nav>