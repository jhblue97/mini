<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signUp.jsp</title>
</head>
<body>
<script>

function idCheck2(){
	
	console.log($('#id').val());
	
    $.ajax ({

        "url" : "/User/json/idCheck.do?userid="+$('#id').val(),
        cache : false,
        type:"get", 
        success : function (data) {
        	console.log(data);
        	if(data==0){
        		alert('사용 가능합니다.');       		
        		$('#idCheck').val('Y');
        	}else{
        		alert('이미 존재합니다.');
        		$('#idCheck').val('N');
        	}
        }
    }); 
}

</script>
<%@ include file="../include/header.jsp" %>
	<div class = "container">
	<h1 class ="display-3"> 간편 회원 가입 </h1>		
	</div> 
<div class="container">
	<form action="/User/addUser.do"
		  class="form-horizontal" method="post"
		  id="addMemberFrm">
		<!-- 필수 입력 항목 안내 메시지 -->
		<c:set var="idMsg" 	value="아이디는 필수 입력 항목입니다."/>
			<input type = "hidden"  name = "snsid" value ='${param.snsID}'>
			<input type = "hidden"  name = "snsflag" value ='${param.snsFlag}'>			
			<input type = "hidden"  name = "idCheck" id = "idCheck" value ='N'>
		
		<div class="form-group row">
			<label class="col-sm-2">ID</label>
			<div class="col-sm-3">
				<input type="text" name="id" id="id" 
						 required>
				 <input type="button" class="btn btn-secondary" value="중복체크" onclick="idCheck2()">
			</div>
		</div>	
		<div class="form-group row">
		<label class="col-sm-2">ニックネーム</label>
			<div class="col-sm-3">
				<input type="text" name="name" id="name"
						 required>
						 	
			</div>
	   </div>				
		<div class="form-group row">
			<label class="col-sm-2">email</label>
			<div class="col-sm-5">
				<input type="email" name="mail" id="mail"
						></div></div>		
						
		<div class="form-group row">
			<label class="col-sm-2">phone</label>
			<div class="col-sm-3">
				<input type="text" name="phone" id="phone"
						></div></div>
						
		
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
			<input type="button" class="btn btn-secondary" value="취소" onclick="history.back()">
				<input type="submit" class="btn btn-info" value="등록"
					   onclick="checkUser()">	</div></div>		
	</form>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>