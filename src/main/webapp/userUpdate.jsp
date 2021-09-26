<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style = "height: 100%;">
<head>
<meta charset="UTF-8">

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
<title>login.jsp</title>
<style>
.container-fluid {

background-color: rgba( 0, 0, 0, 0.5 );
height: 80%;
} 
 
</style>


</head>
<body  class="main-bg" style ="    height: 100%;
    margin: 0;
    background-repeat: no-repeat;
    background-attachment: fixed; 
    background-image : url('/resources/images/bitbg.png');
    background-repeat : no-repeat;
    background-size : cover;">
<%@ include file="../include/header.jsp" %>
 <div class="container-fluid">
        <div class="login-container text-c animated flipInX">
<form action="/User/updateUser.do"
		  class="form-horizontal" method="post"
		  id="addMemberFrm">
		<!-- 필수 입력 항목 안내 메시지 -->
		<c:set var="idMsg" 	value="아이디는 필수 입력 항목입니다."/>
			<input type = "hidden"  name = "snsid" value ='${user.snsid}'>
			<input type = "hidden"  name = "snsflag" value ='${user.snsflag}'>	
		
		<div class="form-group row">
			<label class="col-sm-2">ID</label>
			<div class="col-sm-3">
				<input type="text" name="id" id="id" value = "${user.id}" disabled
						 required>
			
			</div>
		</div>	
		<div class="form-group row">
		<label class="col-sm-2">ニックネーム</label>
			<div class="col-sm-3">
				<input type="text" name="name" id="name" value = "${user.name}"
						 required>
						 	
			</div>
	   </div>				
		<div class="form-group row">
			<label class="col-sm-2">email</label>
			<div class="col-sm-5">
				<input type="email" name="mail" id="mail" value = "${user.mail}"
						></div></div>		
						
		<div class="form-group row">
			<label class="col-sm-2">phone</label>
			<div class="col-sm-3">
				<input type="text" name="phone" id="phone" value = "${user.phone}"
						></div></div>
						
		
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
			<input type="button" class="btn btn-secondary" value="CANCEL" onclick="history.back()">
				<input type="submit" class="btn btn-info" value="UPDATE">	</div></div>		
		</form>
            </div>
            
            
            
  </div>          
<%@ include file="../include/footer.jsp" %>

</body>
</html>