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
<jsp:useBean id = "user" class = "edu.mini.dto.Users"/>
<script>
Kakao.init('0eddcf33f74e05ddec2ab39ebbd750cb'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(JSON.stringify(response))
        	  console.log('id-->'+JSON.stringify(response.id))
          
        	    $.ajax ({

        	        "url" : "/User/json/idCheck2.do?snsid="+response.id+"&snsflag=K",
        	        cache : false,
        	        type:"get", 
        	        success : function (data) {
        	        	
        	        	if(data==1){
							location.href = "/main.jsp";
        	        	}else{
        	   			 location.href = 'signUp.jsp?snsID='+JSON.stringify(response.id)+'&snsFlag=K';
        	        	}
        	        }
        	    }); 
             
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
	
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log('id-->'+response.id)
        }, 
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
    
  }  

</script>
<!-- <ul>

	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
          <span><img src="/resources/images/KakaoTalk.png" height="50" width="50"/></span>
      </a>
	</li>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>
 -->
 <div class="container-fluid">
        <div class="login-container text-c animated flipInX">
                <div>
                    <h1 class="logo-badge text-whitesmoke"><span class="fa fa-user-circle"></span></h1>
                </div>
                    <h3 class="text-whitesmoke">Bit Gallery</h3>
                    <p class="text-whitesmoke">Sign In</p>
                <div class="container-content">
                    <form class="margin-t">
                        <div class="form-group">
						<!-- <a href=# id="Kakao"> <img src="/resources/images/KakaoTalk.png" height="50" width="50"/></a> -->	
          			<span><img src="/resources/images/KakaoTalk.png" height="50" width="50" onclick = "kakaoLogin();"/></span>				
                       </div>
                       </form>
                  </div>
            </div>
  </div>          
<%@ include file="../include/footer.jsp" %>
</body>
</html>