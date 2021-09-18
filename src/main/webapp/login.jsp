<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<script>

/////=========Kakao Login View popup ==========////////////

$(function() {
	
	  $("#Kakao").on("click", function() {
		   
		  var  URL = "https://kauth.kakao.com/oauth/authorize?client_id=0eddcf33f74e05ddec2ab39ebbd750cb&redirect_uri=http://192.168.219.101:8080/main.jsp&response_type=code"
		  popWin
		  = window.open(URL,   "popWin",  "left=300,top=200,width=780,height=500,marginwidth=0,marginheight=0,"+
					"scrollbars=no,scrolling=no,menubar=no,resizable=no") 
					 opener.window.location = url;
		  close();
					
					
	  });
	
	  
	  
		$('button[name="get"]').on("click", function() {
			var streamer = $(this).data("param");
			//alert(streamer);
		 	 $.ajax({
	             url : '/stream/json/checkBan?userNo=${user.userNo}&streamer='+streamer,   
	             method : 'get', 
	             headers: {
	   	            "Accept": "application/json",
	   	            "Content-Type": "application/json"
	   	        }, 
	             success : function (JSONData,status) {
	           if(JSONData==1){
	        	   swal("강퇴 당하셔서 입장 불가능 하십니다 ","다음기회에...~", "error");
	           }else{
	        		 window.open("https://192.168.0.43:443/stream/join?streamer="+streamer+"&userNo=${user.userNo}&userNickname=${user.userNickname}&userProfile=${user.profile}", "popup_window", "width=1450, height=900, scrollbars=no");
	           }  	                    
	             },  
	             error : function (err) { 
	             	alert('실패 ㅠㅠ');
	                 } 
	         });
		}); 
	  
}); 

</script>


<div class="jumbotron">
	<div class="container">
		<h1 class="display-3"><!-- 상품 등록 -->
로그인
		</h1></div>
		
</div>

	
	
</body>
</html>