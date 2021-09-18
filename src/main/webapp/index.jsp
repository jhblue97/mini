<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<script src="http://192.168.219.101:82/socket.io/socket.io.js"></script>


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
		  close();/				
	  });
}); 


</script>



	<h1>MINI PROJECT - 가상화폐 갤러리 (仮想通貨ギャラリー)</h1>
	<ol>
	<li> <a>개요</a> 
		<ol type= 'A'>
			<li> SNS(카카오톡,구글) 연동 로그인이용하며 현 실시간 비트코인 시세확인 가능과 자유로운 채팅 기능, 자유게시판이 있는 커뮤니티 사이트
			<br> 관리자일 경우 모든 회원 글 조회,삭제 가능
			</li>
		</ol> 
	</li> 
		<li>기능 개요
			<ol type= 'A'>
				<li>공통 :  SNS(카카오톡,구글) 로그인,자동로그인,간편회원가입, 로그아웃,게시판 썸네일 목록 조회, 국내 비트코인과 해외 비트코인 웹소켓을 이용한 시세 차 확인 <br>	
				</li> 
			    <li>회원 :   내 정보 수정,탈퇴하기 , 글 쓰기 , 글 상세보기, 내 글 수정, 내 글 삭제, 글 추천하기,트롤박스채팅 기능</li>
				<li>관리자 : 모든 회원 글 삭제 기능,모든 글 전체 조회<!-- , 계급 기준 등록, 수정, 삭제 기능 --> </li>
			</ol>
		</li> 
		<li>요구 사항 정의
			<ol type= 'A'>
			<li>공통 
				<ul>
					<li> 로그인 : 카카오톡,구글로만 로그인 가능하도록 구현 (카카오톡 id,구글id,SNS구분코드 )  </li>
					<li> 간편회원가입 : 첫 로그인시 간편회원가입 필수 (SNS 구분,아이디,닉네임,성별,이메일,핸드폰번호) </li>		
					<li> 로그아웃 : 로그아웃 여부 확인 후 yes인 경우에만 초기 메뉴 출력 ( 회원ID )</li>
					<li> 게시판 썸네일 목록 조회 : 로그인 상관없이 썸네일 목록은 볼 수 있도록 구현 (작성자,작성자계급,작성일,추천수,글 일부 내용 50자이내)</li>
					<li> 비트코인 현 시세 표 : 웹소켓,업비트 공개api,바이낸스 공개 api를 이용한 현 비트코인 시세 표 보이기(국내 비트코인가격,현시각 환율,해외 비트코인 가격,시세차 % )</li>
				</ul>
			</li>								
			<li>회원 
				<ul>
					<li> 탈퇴하기 : 탈퇴 시 모든 데이터 삭제 기능 구현  (회원ID)</li>			
					<li> 내 정보 수정 : 아이디를 제외한 데이터 수정 가능 (유저ID,닉네임,성별,핸드폰번호,생년월일,이메일)  </li>		
				    <li> 글 쓰기 : 글 쓰기 구현 (제목, 작성자, 내용,이미지소스) </li>		
					<li> 글 상세보기 :  로그인 할 시 상세보기 가능 (글 번호,제목,작성자,내용,작성일,작성자계급,추천수) </li>
					<li> 추천 기능 : 추천버튼을 이용한 추천하기 기능 (유저ID,글 번호,추천 수 ) </li>
					<li> 트롤박스 채팅기능 : 메인화면에 작은 트롤박스를 만들어 실시간 웹소켓을 이용한 채팅 가능하도록 구현 (유저ID,글내용,글 작성 시간)</li>
	
				</ul>
			</li>			
			<li>관리자 
				<ul>
					<li> 회원 글 삭제  :특정 회원 글 삭제 가능 (작성자ID,글 번호) </li>
					<li> 글 전체 조회  :글 전체 목록을 리스트형식으로 보도록 구현 (글넘버,글 제목,유저아이디,작성일,삭제여부) </li>
	<!-- 				<li> 회원 등급 기준 수정 :  회원이 글쓰면서 얻는 포인트로 등급 기준 수정 관리 <br>
						등급 : 빨강 , 노랑 , 초록 , 파랑 , 보라   (5가지)<br>
						등급 기준 : 빨강 0~50pt, 노랑 51~3000pt, 초록 3001pt~ 7000pt , 파랑 7001pt ~ 15000pt , 보라 15001pt ~  
					</li>
					<li> 회원 등급 등록 : 빨강,노랑,초록,파랑,보라 이외의 등급 기준을 더 추가 할 수 있음.  <br> </li>
					<li> 회원 등급 삭제 :  등급을 삭제 할 수 있음. <br> </li> -->
				</ul>
			</li>			
			</ol>
		</li>
	</ol>
</body>


<a href=# id="Kakao">
	   <img src="/resources/images/KakaoTalk.png" height="50" width="50"/>
		</a>

</html>