<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<title>boardList.jsp</title>
<style>


.chatbox {
	position: fixed;
	bottom: 0;
	right: 30px;
	width: 230px;
	height: 400px;
	background-color: #fff;
	font-family: 'Lato', sans-serif;
	-webkit-transition: all 600ms cubic-bezier(0.19, 1, 0.22, 1);
	transition: all 600ms cubic-bezier(0.19, 1, 0.22, 1);
	z-index: 999;
	display: -webkit-flex;
	display: flex;
	-webkit-flex-direction: column;
	flex-direction: column;
}

.chatbox--tray {
	bottom: -350px;
}

.chatbox--closed {
	bottom: -400px;
}

.chatbox .form-control:focus {
	border-color: #1f2836;
}

.chatbox__title, .chatbox__body {
	border-bottom: none;
	color: black; /* 김주현 추가 */
	
}

.chatbox__title {
	background-color: lightseagreen;  
	min-height: 50px;
	padding-right: 10px;
/* 	background-color: #1f2836cc; */
	cursor: pointer;
	display: -webkit-flex;
	display: flex;
	-webkit-align-items: center;
	align-items: center;
}

.chatbox__title h5 {
	height: 50px;
	margin: 0 0 0 15px;
	line-height: 50px;
	position: relative;
	padding-left: 20px;
	-webkit-flex-grow: 1;
	flex-grow: 1;
}

.chatbox__title h5 a {
	color: #fff;
	max-width: 195px;
	display: inline-block;
	text-decoration: none;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.chatbox__title h5:before {
	content: '';
	display: block;
	position: absolute;
	top: 50%;
	left: 0;
	width: 12px;
	height: 12px;
	
	background: white;
	
	border-radius: 6px;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
}

.chatbox__title__tray, .chatbox__title__close {
	width: 24px;
	height: 24px;
	outline: 0;
	border: none;
	background-color: transparent;
	opacity: 0.5;
	cursor: pointer;
	-webkit-transition: opacity 200ms;
	transition: opacity 200ms;
}

.chatbox__title__tray:hover, .chatbox__title__close:hover {
	opacity: 1;
}

.chatbox__title__tray span {
	width: 12px;
	height: 12px;
	display: inline-block;
	border-bottom: 2px solid #fff
}

.chatbox__title__close svg {
	vertical-align: middle;
	stroke-linecap: round;
	stroke-linejoin: round;
	stroke-width: 1.2px;
}

.chatbox__body, .chatbox__credentials {
	padding: 15px;
	border-top: 0;
	background-color: #DCDCDC;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
	-webkit-flex-grow: 1;
	flex-grow: 1;
}

.chatbox__credentials {
	display: none;
}

.chatbox__credentials .form-control {
	-webkit-box-shadow: none;
	box-shadow: none;
}

.chatbox__body {
	overflow-y: auto;
	background-color : black;
}

.chatbox__body > div {
background-color : white;
margin : 5px;
border-radius: 4px; 
}

.chatbox__body__message {
	position: relative;
}

.chatbox__body__message p {
	padding: 15px;
	border-radius: 4px;
	font-size: 14px;
	background-color: #fff;
	-webkit-box-shadow: 1px 1px rgba(100, 100, 100, 0.1);
	box-shadow: 1px 1px rgba(100, 100, 100, 0.1);
}

.chatbox__body__message img {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	border: 2px solid #fcfcfc;
	position: absolute;
	top: 15px;
}

.chatbox__body__message--left p {
	margin-left: 15px;
	padding-left: 30px;
	text-align: left;
	padding-top: 25px;
}

.chatbox__body__message--left img {
	left: -5px;
}

.chatbox__body__message--right p {
	margin-right: 15px;
	padding-right: 30px;
	text-align: right;
}

.chatbox__body__message--right img {
	right: -5px;
}

.chatbox__message {
	padding: 15px;
	min-height: 50px;
	outline: 0;
	resize: none;
	border: none;
	font-size: 12px;
	border: 1px solid #ddd;
	border-bottom: none;
	background-color: #fefefe;
}

.chatbox--empty {
	height: 262px;
}

.chatbox--empty.chatbox--tray {
	bottom: -212px;
}

.chatbox--empty.chatbox--closed {
	bottom: -262px;
}

.chatbox--empty .chatbox__body, .chatbox--empty .chatbox__message {
	display: none;
}

.chatbox--empty .chatbox__credentials {
	display: block;
}

.chatbox_timing {
	position: absolute;
	right: 10px;
	font-size: 12px;
	top: 2px;
}

.chatbox_timing ul {
	padding: 0;
	margin: 0
}

.chatbox_timing ul li {
	list-style: none;
	display: inline-block;
	margin-left: 3px;
	margin-right: 3px;
}

.chatbox_timing ul li a {
	display: block;
	color: #747474
}

.ul_msg {
	padding: 10px !important;
}

.chatbox__body__message--right .ul_section_full {
	margin-right: 15px;
	padding-right: 30px;
	text-align: right;
	border-radius: 4px;
	font-size: 14px;
	background-color: #fff;
	-webkit-box-shadow: 1px 1px rgba(100, 100, 100, 0.1);
	box-shadow: 1px 1px rgba(100, 100, 100, 0.1);
	margin-bottom: 15px;
	padding-bottom: 5px;
	padding-top: 15px;
}

.chatbox__body__message--left .ul_section_full {
	margin-left: 15px;
	padding-left: 15px;
	text-align: left;
	padding-top: 15px;
	padding-bottom: 5px;
	margin-bottom: 15px;
	border-radius: 4px;
	font-size: 14px;
	background-color: #fff;
	-webkit-box-shadow: 1px 1px rgba(100, 100, 100, 0.1);
	box-shadow: 1px 1px rgba(100, 100, 100, 0.1);
}

.ul_msg {
	padding: 0;
	margin: 0px
}

.ul_msg li {
	list-style: none;
	display: block
}

.ul_msg2 {
	padding: 0;
	margin: 0px;
	text-align: right;
}

.ul_msg2 li {
	list-style: none;
	display: inline-block;
	margin-right: 15px;
}

.chatbox__body__message--right .chatbox_timing {
	position: absolute;
	left: 10px;
	font-size: 12px;
	top: 2px;
}

.chatbox__body__message--right .ul_msg2 {
	text-align: left
}

.chatbox__body__message--right .ul_msg2 li {
	list-style: none;
	display: inline-block;
	margin-left: 15px;
	margin-right: 0px
}

.chat_set_height {
	height: 40px;
	margin-top: 1px;
}

.chatbox22 .form-control:focus {
	border-color: #DCDCDC;
}

.width50 {
	width: 50%;
	float: left;
	background: #ECECEC;
}
/*======================Chat Box Ends=====================================================*/
/*======================Message=====================================================*/
.message_check {
	padding-top: 10px;
}

.messsade_date {
	text-align: left;
	padding-top: 9px;
}

.messsade_date a {
	color: #000;
}

.padleftright0 {
	padding-left: 0px;
	padding-right: 0px;
}

.message_box_area {
	color: #000;
	cursor: pointer;
}

.create_m {
	border: 1px solid #ccc !important;
}

.fileinput-button {
	float: left;
	margin-right: 4px;
	overflow: hidden;
	position: relative;
}

.fileinput-button {
	background: none repeat scroll 0 0 #eeeeee;
	border: 1px solid #e6e6e6;
	margin-top: 15px;
}

.fileinput-button {
	float: left;
	margin-right: 4px;
	overflow: hidden;
	position: relative;
}

.fileinput-button input {
	cursor: pointer;
	direction: ltr;
	font-size: 23px;
	margin: 0;
	opacity: 0;
	position: absolute;
	right: 0;
	top: 0;
	transform: translate(-300px, 0px) scale(4);
}

.fileupload-buttonbar .btn, .fileupload-buttonbar .toggle {
	margin-bottom: 5px;
}

.create_m:focus {
	border-color: #66afe9 !important;
	outline: 0 !important;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6) !important;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6) !important;
}

.col-lg-3.control-label {
	text-align: left;
}

/* 모달 start*/
.modal-content {
color : black;
}

.thumbnail{
border : 1px solid white;
border-radius :  20px;
background-color: ghostwhite;
color: white; 
padding: 10px;
background-color: rgba( 0, 0, 0, 0.5 );
} 

/*search start*/

*, *:before, *:after {
  -webkit-tap-highlight-color: transparent;
  -webkit-tap-highlight-color: rgba(0,0,0,0);
  user-select: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  -o-user-select: none;
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
  padding: 0;
  margin: 0;
}

.search-box {
  position: relative;
  width: 100%;
  max-width: 360px;
  height: 60px;
  border-radius: 120px;
  margin: 0 auto;
}
.search-icon, .go-icon {
  position: absolute;
  top: 0;
  height: 60px;
  width: 86px;
  line-height: 61px;
  text-align: center;
}
.search-icon {
  left: 0;
  pointer-events: none;
  font-size: 1.22em;
  will-change: transform;
  transform: rotate(-45deg);
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  -o-transform: rotate(-45deg);
  transform-origin: center center;
  -webkit-transform-origin: center center;
  -moz-transform-origin: center center;
  -o-transform-origin: center center;
  transition: transform 400ms 220ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -webkit-transition: transform 400ms 220ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -moz-transition: transform 400ms 220ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -o-transition: transform 400ms 220ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
}
.si-rotate {
  transform: rotate(0deg);
  -webkit-transform: rotate(0deg);
  -moz-transform: rotate(0deg);
  -o-transform: rotate(0deg);
}
.go-icon {
  right: 0;
  pointer-events: none;
  font-size: 1.38em;
  will-change: opacity;
  cursor: default;
  opacity: 0;
  transform: rotate(45deg);
  -webkit-transform: rotate(45deg);
  -moz-transform: rotate(45deg);
  -o-transform: rotate(45deg);
  transition: opacity 190ms ease-out, transform 260ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -webkit-transition: opacity 190ms ease-out, transform 260ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -moz-transition: opacity 190ms ease-out, transform 260ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -o-transition: opacity 190ms ease-out, transform 260ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
}
.go-in {
  opacity: 1;
  pointer-events: all;
  cursor: pointer;
  transform: rotate(0);
  -webkit-transform: rotate(0);
  -moz-transform: rotate(0);
  -o-transform: rotate(0);
  transition: opacity 190ms ease-out, transform 260ms 20ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -webkit-transition: opacity 190ms ease-out, transform 260ms 20ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -moz-transition: opacity 190ms ease-out, transform 260ms 20ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -o-transition: opacity 190ms ease-out, transform 260ms 20ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
}
.search-border {
  display: block;
  width: 100%;
  max-width: 360px;
  height: 60px;
}
.border {
  fill: none;
  stroke: #FFFFFF;
  stroke-width: 5;
  stroke-miterlimit: 10;
}
.border {
  stroke-dasharray: 740;
  stroke-dashoffset: 0;
  transition: stroke-dashoffset 400ms cubic-bezier(0.600, 0.040, 0.735, 0.990);
  -webkit-transition: stroke-dashoffset 400ms cubic-bezier(0.600, 0.040, 0.735, 0.990);
  -moz-transition: stroke-dashoffset 400ms cubic-bezier(0.600, 0.040, 0.735, 0.990);
  -o-transition: stroke-dashoffset 400ms cubic-bezier(0.600, 0.040, 0.735, 0.990);
}
.border-searching .border {
  stroke-dasharray: 740;
  stroke-dashoffset: 459;
  transition: stroke-dashoffset 650ms cubic-bezier(0.755, 0.150, 0.205, 1.000);
  -webkit-transition: stroke-dashoffset 650ms cubic-bezier(0.755, 0.150, 0.205, 1.000);
  -moz-transition: stroke-dashoffset 650ms cubic-bezier(0.755, 0.150, 0.205, 1.000);
  -o-transition: stroke-dashoffset 650ms cubic-bezier(0.755, 0.150, 0.205, 1.000);
}
#search {
  font-family: 'Montserrat Alternates', sans-serif;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border-radius: 120px;
  border: none;
  background: rgba(255,255,255,0);
  padding: 0 68px 0 68px;
  color: #FFFFFF;
  font-size: 1.32em;
  font-weight: 400;
  letter-spacing: -0.015em;
  outline: none;
}
#search::-webkit-input-placeholder {color: #FFFFFF;}
#search::-moz-placeholder {color: #FFFFFF;}
#search:-ms-input-placeholder {color: #FFFFFF;}
#search:-moz-placeholder {color: #FFFFFF;}
#search::-moz-selection {color: #FFFFFF; background: rgba(0,0,0,0.25);}
#search::selection {color: #FFFFFF; background: rgba(0,0,0,0.25);}



/*search end*/
</style>



</head>


<body>
	<%@ include file="../include/header.jsp"%>


	  
 <div class="container-fluid">  
<div class="container">

<div class = "row">

		<div class="search-box">
			<div class="search-icon"><i class="fa fa-search search-icon"></i></div>
				<input type="text" placeholder="Search" id="search" autocomplete="off">
		
			<svg class="search-border" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" viewBox="0 0 671 111" style="enable-background:new 0 0 671 111;"
			 xml:space="preserve">
          <path class="border" d="M335.5,108.5h-280c-29.3,0-53-23.7-53-53v0c0-29.3,23.7-53,53-53h280"/>
          <path class="border" d="M335.5,108.5h280c29.3,0,53-23.7,53-53v0c0-29.3-23.7-53-53-53h-280"/>
        </svg>
			<div class="go-icon"><i class="fa fa-arrow-right"></i></div>
		</div>

</div>	
		
<div class = "row">
		
<!-- 모달 start   -->
<button class='btn btn-outline-warning col-md-2' data-toggle="modal" data-target="#myModal" style = "margin-left : 90%;">write</button> 

					
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
        <h4 class="modal-title" id="myModalLabel">write</h4>
      </div>
      <form action="/Board/boardWrite.do" method="post" enctype="multipart/form-data" class="form-horizontal" id = "boardWrite">
         <input type="hidden" class="form-control" id="userid" value="<%=session.getAttribute("userid")%>" name = "userid"><br/>
 			 
      <div class="modal-body">
       			<label for="txt-user-text" class="col-form-label">Subject</label><br/> 
       			   <input type="text" class="form-control" id="subject" value="" placeholder="제목을 입력하세요" name="subject"><br/>
 				
       			<label for="txt-user-text" class="col-form-label">Content</label> <br/> 
 				   <input type="text" class="form-control" id="content" value="" placeholder="내용을 입력하세요" name="content"> <br/>	
 				
 				 <label for="txt-user-text" class="col-form-label">Thumnail</label> <br/>   
 	<input type="file" multiple class="form-control" id="image" name="image">		   
      </div> 
      <div class="modal-footer">
      	<button type="submit" class="btn btn-info"  data-dismiss="modal"  id="btn_add">Upload</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
      </div>
      </form> 
    </div>
  </div></div>	

			<!-- 모달 end   -->
</div>

	
		
<div class="row">

  
	<div class="container">
	<div class="row" id="list" style="padding-left:0; padding-right:0;">
	<c:set var="i" value="0" /> 
	<c:forEach var="obj" items="${list}"> 
	<div class="col-sm-6 col-md-4">  
	<div class="thumbnail" style = "margin-bottom : 30px;">  
		<div style="margin: 10px;">		
			<div class="profileusername">
			&emsp;<strong>${obj.id}</strong>
			</div>
			<br/> 
			<div style="border-top-width: 0.1em; border-top-style: dashed; border-top-color: #7b7b7b;"></div><br/>		
			<img class="img-thumbnail" alt="50x50" data-src="holder.js/100x200" src='/resources/images/${obj.image}' style=" width:200px; height : 200px; margin:auto; display: block;" >
			<br/>			
			<div style="border-top-width: 0.1em; border-top-style: dashed; border-top-color: #7b7b7b;"></div><br/>			
			<div class="caption">
			<c:if test="${fn:length(obj.subject) > 15}">
				<h2>SUBJECT : <br> ${fn:substring(obj.subject,0,15)} ...</h2> <br>
			</c:if>
			<c:if test="${fn:length(obj.subject) <= 15 }">
				<h2>SUBJECT : <br> ${obj.subject}</h2><br>
			</c:if>
			<c:if test="${fn:length(obj.content) > 20 }">
				<p>CONTENT : ${fn:substring(obj.content,0,20)} ...</p>
			</c:if> 
			<c:if test="${fn:length(obj.content) <= 20 }"> 
				<p>CONTENT :${obj.content}</p>  
			</c:if>	
			<p><img src = "/resources/images/hit.png"; style=" width:50px; height : 50px;">  ${obj.hit} &nbsp; </p>

			</div>	 
			<div style="text-align: right;"> 
			<!-- <button type="button" class="btn btn-b" name="get" data-param="" onclick = >view</button> -->
			<button id = "view" class='btn btn-outline-warning' data-toggle="modal" data-target="#myModal2" data-num ="${obj.num}">view</button> 
			</div>		
		</div>  
	</div>
</div>
</c:forEach>
</div> 
</div>

</div> <!-- list end  -->

<!-- view modal  -->		 
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
        <h4 class="modal-title" id="myModalLabel">View</h4> <br>
      </div>
      <form action="/Board/boardUpdate.do" method="post" enctype="multipart/form-data" class="form-horizontal"  id = "boardUpdate">
         <input type="hidden" class="form-control" id="view_userid" value="" name = "view_userid"><br/>
 	 
 	    <input type="hidden" class="form-control" id="view_num" value="" name = "view_num"><br/>
 	   <input type="hidden" class="form-control" id="view_img_bak" value="" name = "view_img_bak"><br/>
 	
 	
 	  <span>  RegDate </span> <a id = "view_regdate"></a>						
      <div class="modal-body">  
      
        <img class = "close_icon" src='/resources/images/close.png' style=" width:25px; height : 25px; margin:auto; display: block;" >
    
      <img class="img-thumbnail" id = "view_img" alt="50x50"  data-src="holder.js/100x200" src='/resources/images/' style=" width:200px; height : 200px; margin:auto; display: block;" >
      
      
       			<label for="txt-user-text" class="col-form-label">Subject</label><br/> 
       			   <input type="text" class="form-control" id="view_subject" value="" placeholder="제목을 입력하세요" name="view_subject"><br/>
 				
       			<label for="txt-user-text" class="col-form-label">Content</label> <br/> 
 				   <input type="text" class="form-control" id="view_content" value="" placeholder="내용을 입력하세요" name="view_content"> <br/>	
 				
 				 <label for="txt-user-text" class="col-form-label">Thumnail</label> <br/>   
 				  <input type="file" multiple class="form-control" id="view_image" name="view_image" onchange="setThumbnail(event);">	
 				  
 				   <label for="txt-user-text" class="col-form-label">  hit  : </label>  <a id="view_hit"></a>   
      </div> 
      <div class="modal-footer">
        <button type="button" class="btn btn-danger"  id="btn_delete" >delete</button>
      	<button type="submit" class="btn btn-info"    data-dismiss="modal" id="btn_update"  >Upload</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
      </div> 
      </form>
    </div>
  </div></div>	
	<!-- view modal  END-->		 
		
</div>
	</div> 
<!-- CONTINER  -->

	<div class="chatbox chatbox22 chatbox--tray">
		<div class="chatbox__title">
			<h5>
				<a href="javascript:void()">Leave a message</a>
			</h5>
			<button class="chatbox__title__close">
				<span> <svg viewBox="0 0 12 12" width="12px" height="12px">
                    <line stroke="#FFFFFF" x1="11.75" y1="0.25"
							x2="0.25" y2="11.75"></line>
                    <line stroke="#FFFFFF" x1="11.75" y1="11.75"
							x2="0.25" y2="0.25"></line>
                </svg>
				</span>
			</button>
		</div>
		<div class="chatbox__body">
		</div>
		<div class="panel-footer">
			<div class="input-group">
				<input id="btn-input" type="text"
					class="form-control input-sm chat_set_height"
					placeholder="Type your message here..." tabindex="0" dir="ltr"
					spellcheck="false" autocomplete="off" autocorrect="off"
					autocapitalize="off" contenteditable="true" /> <span
					class="input-group-btn">
					<button class="btn bt_bg btn-sm" id="btn-chat"
						onclick="sendMessage()">Send</button>
				</span>
				<%
				session = request.getSession();
				%>

				<input type="hidden" id="user"
					value="<%out.println(session.getAttribute("userid"));%>">
			</div>
		</div>                      
		<script>

/* 	function recommend(e){
		console.log($(e).data('num'));
		
		 $.ajax ({
		        "url" : "/Board/json/getBoard.do?num="+recipient,
		        cache : false,
		        type:"get", 
		        dataType: "json",
		        success : function (data) 	        
		        {	
		        	$('#view_num').val (data.num);
		        	$('#view_regdate').text(data.regDate);
		        	$('#view_subject').val(data.subject);
		        	$('#view_content').val(data.content);
		        	$('#view_recommend').text(data.recommend);
		        	$('#view_hit').text(data.hit);	        	
		        }
	   	 });	
		 
		
		//alert(ss); 
	} */

	function setThumbnail(event) { 
		var reader = new FileReader(); reader.onload = function(event) { 
		var img = document.getElementById("view_img"); 
		var img_bak = document.getElementById("view_img_bak"); 
		img.setAttribute("src", event.target.result); 
		//img_bak.value =event.target.result;   
		//document.querySelector("div#image_container").appendChild(img);
		}; 
		reader.readAsDataURL(event.target.files[0]); 
		}

	
	$('.close_icon').on('click',function(){ 
		var img = document.getElementById("view_img"); 
		img.setAttribute("src","null");
		
		var img_bak = document.getElementById("view_img_bak"); 
		img_bak.value = null;
		
	});
	
		$('#btn_add').on('click',function(){
			
			$('#boardWrite').submit();
		});

		$('#btn_update').on('click',function(){
		
			$('#boardUpdate').submit();
		});

		 
		$('#btn_delete').on('click',function(e){
			location.href = "/Board/boardDelete.do?num="+$('#view_num').val();
		});

		
		
 	$('#myModal2').on('shown.bs.modal', function (event) {
				
 		
 		
 		
		  var button = $(event.relatedTarget); // Button that triggered the modal
		  var recipient = button.data('num'); // Extract info from data-* attributes
		  var board_id;
		  $.ajax ({
			        "url" : "/Board/json/getBoard.do?num="+recipient,
			        cache : false,
			        type:"get", 
			        dataType: "json",
			        success : function (data) 
			        
			        {	 
			        	
			        	$('#view_img_bak').val(data.image);
			        	$('#view_userid').val(data.id);
			        	$('#view_num').val(data.num);
			        	$('#view_regdate').text(data.regdate);
			        	$('#view_subject').val(data.subject);
			        	$('#view_content').val(data.content);
			        	$('#view_hit').text(data.hit);
			        	$('#view_img').attr('src','/resources/images/'+data.image);
			     		
			        	
			        	
						//로그인아이디랑 글쓴이랑 같지 않을 경우 조회수 증가
			 		   if(data.id!=$('#userid').val()){
			 				 $.ajax ({
			 				        "url" : "/Board/json/updateHit.do?num="+recipient,
			 				        cache : false,
			 				        type:"get", 
			 				        dataType: "json",
			 				        success : function (data) 
			 				        {	
			 				        
			 				        }
			 			   	 });
			 			   } 
			 		   
						
						
			 		   if(data.id!=$('#userid').val()){
			 			   
			 			   $('#btn_delete').hide();
			 			   $('#btn_update').hide();
			 			   
			 			   
			 		   }
						
						
			        	
			        }
		   	 });	
		 

		  
	});   
		 
			$(document).ready( function() {
								var $chatbox = $('.chatbox'), $chatboxTitle = $('.chatbox__title'), $chatboxTitleClose = $('.chatbox__title__close'), $chatboxCredentials = $('.chatbox__credentials');
								$chatboxTitle.on('click', function() {
									$chatbox.toggleClass('chatbox--tray');
								});
								$chatboxTitleClose.on('click', function(e) {
									e.stopPropagation();
									$chatbox.addClass('chatbox--closed');
								});
								$chatbox.on('transitionend', function() {
									if ($chatbox.hasClass('chatbox--closed'))
										$chatbox.remove();
								});

				});
			
			 $("#btn-input").on("keyup",function(key){
			        if(key.keyCode==13) {
			        	sendMessage();
			        }
			    });

				
			 $("#search").on("keyup",function(key){
				 
			        if(key.keyCode==13) {
			        
			        	location.href= '/Board/boardList.do?text='+$("#search").val();
			        }
			    });
			 
			
		</script>
		<script type="text/javascript">
			// 「WebSocketEx」는 프로젝트 명
			// 「broadsocket」는 호스트 명
			// WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
			var webSocket = new WebSocket("ws://localhost:8080/Chat");
			// 콘솔 텍스트 에리어 오브젝트
			//var messageTextArea = document.getElementById("messageTextArea");
			// WebSocket 서버와 접속이 되면 호출되는 함수
			webSocket.onopen = function(message) {
				// 콘솔 텍스트에 메시지를 출력한다.
				//messageTextArea.value += "Server connect...\n";
			};
			// WebSocket 서버와 접속이 끊기면 호출되는 함수
			webSocket.onclose = function(message) {
				// 콘솔 텍스트에 메시지를 출력한다.
				//messageTextArea.value += "Server Disconnect...\n";
			};
			// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
			webSocket.onerror = function(message) {
				// 콘솔 텍스트에 메시지를 출력한다.
				//messageTextArea.value += "error...\n";
			};
			/// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
			webSocket.onmessage = function(message) {
				// 콘솔 텍스트에 메시지를 출력한다.
				//messageTextArea.value += message.data + "\n";

				$('.chatbox__body').append(message.data);
			};
			// Send 버튼을 누르면 호출되는 함수
			function sendMessage() {
				// 유저명 텍스트 박스 오브젝트를 취득
		<%if (session.getAttribute("userid") == null) {%>
			alert("Please login");
				return;
		<%}%>
			var user = document.getElementById("user");
				// 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득
				//var message = document.getElementById("textMessage");
				var message = document.getElementById("btn-input");
				/////////test//////////////
				//var html = '<div class="chatbox__body__message chatbox__body__message--left"><div class="chatbox_timing"><ul><li><a href="#"><i class="fa fa-calendar"></i> 22/11/2018</a></li><li><a href="#"><i class="fa fa-clock-o"></i> 7:00 PM</a></a></li></ul></div><div class="clearfix"></div><div class="ul_section_full"><ul class="ul_msg"><li><strong>Person Name</strong></li><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </li></ul><div class="clearfix"></div><ul class="ul_msg2"><li><a href="#"><i class="fa fa-pencil"></i> </a></li></ul></div></div>';

				///////////////////////

				// 콘솔 텍스트에 메시지를 출력한다.
				//messageTextArea.value += user.value + "(me) => " + message.value + "\n";
				$('.chatbox__body')
						.append(
								'<div>' + user.value + ' : ' + message.value
										+ '</div>');
				// WebSocket 서버에 메시지를 전송(형식 「{{유저명}}메시지」)
				webSocket.send('<div>' + user.value + ' : ' + message.value
						+ '</div>');
				// 송신 메시지를 작성한 텍스트 박스를 초기화한다.
				message.value = "";
			}
			// Disconnect 버튼을 누르면 호출되는 함수
			function disconnect() {
				// WebSocket 접속 해제
				webSocket.close();
			}
		</script>

	</div>

	<%@ include file="../include/footer.jsp"%>
	<script>
	
	
		$(function() {
			$('[data-toggle="popover"]').popover()
		})
		
		
		$(document).ready(function(){
    $("#search").focus(function() {
      $(".search-box").addClass("border-searching");
      $(".search-icon").addClass("si-rotate");
    });
    $("#search").blur(function() {
      $(".search-box").removeClass("border-searching");
      $(".search-icon").removeClass("si-rotate");
    });

});
	</script>


</body>
</html>