<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />   
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<style>

.chatbox {
    position: fixed;
    bottom: 0;
    right: 30px;
    width: 300px;
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

.chatbox__title,
.chatbox__body {
    border-bottom: none;
}

.chatbox__title {
    min-height: 50px;
    padding-right: 10px;
    background-color: #1f2836cc;
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
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
    background: #4CAF50;
    border-radius: 6px;

    -webkit-transform: translateY(-50%);
    transform: translateY(-50%);
}

.chatbox__title__tray,
.chatbox__title__close {
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

.chatbox__title__tray:hover,
.chatbox__title__close:hover {
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

.chatbox__body,
.chatbox__credentials {
    padding: 15px;
    border-top: 0;
    background-color:#DCDCDC;
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
    text-align: left;padding-top: 25px;
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

.chatbox--empty .chatbox__body,
.chatbox--empty .chatbox__message {
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
.chatbox_timing ul{padding:0;margin:0}
.chatbox_timing ul li {
    list-style: none;
    display: inline-block;
    margin-left: 3px;
    margin-right: 3px;
}
.chatbox_timing ul li a{display:block;color:#747474}
.ul_msg {

    
    padding: 10px !important;

}
.chatbox__body__message--right .ul_section_full{
	margin-right: 15px;
padding-right: 30px;
text-align: right;
border-radius: 4px;
    font-size: 14px;
    background-color: #fff;
    -webkit-box-shadow: 1px 1px rgba(100, 100, 100, 0.1);
    box-shadow: 1px 1px rgba(100, 100, 100, 0.1);margin-bottom: 15px;
padding-bottom: 5px;padding-top:15px;
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
.ul_msg{padding:0;margin:0px}
.ul_msg li{list-style:none;display:block}
.ul_msg2{padding:0;margin:0px;text-align: right;}
.ul_msg2 li{list-style:none;display:inline-block;margin-right: 15px;}
.chatbox__body__message--right .chatbox_timing  {
    position: absolute;
    left: 10px;
    font-size: 12px;
    top: 2px;
}
.chatbox__body__message--right .ul_msg2{text-align:left}
.chatbox__body__message--right .ul_msg2 li {
    list-style: none;
    display: inline-block;
    margin-left: 15px;margin-right:0px
}
.chat_set_height {
    height: 40px;
    margin-top: 1px;
}
.chatbox22 .form-control:focus {
    border-color: #DCDCDC;
}
.width50{width:50%;float:left;background:#ECECEC;}
/*======================Chat Box Ends=====================================================*/
/*======================Message=====================================================*/
.message_check{padding-top:10px;}
.messsade_date {
    text-align: left;
    padding-top: 9px;
}
.messsade_date a{color:#000;}
.padleftright0{padding-left:0px;padding-right:0px;}
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
    border: 1px solid #e6e6e6;margin-top: 15px;
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
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6) !important;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6) !important;
}
.col-lg-3.control-label {
    text-align: left;
}

</style>
<script>
(function($) {
    $(document).ready(function() {
        var $chatbox = $('.chatbox'),
            $chatboxTitle = $('.chatbox__title'),
            $chatboxTitleClose = $('.chatbox__title__close'),
            $chatboxCredentials = $('.chatbox__credentials');
        $chatboxTitle.on('click', function() {
            $chatbox.toggleClass('chatbox--tray');
        });
        $chatboxTitleClose.on('click', function(e) {
            e.stopPropagation();
            $chatbox.addClass('chatbox--closed');
        });
        $chatbox.on('transitionend', function() {
            if ($chatbox.hasClass('chatbox--closed')) $chatbox.remove();
        });
        
    });
})(jQuery);

</script>
<div class="container">
    	<h2 style="text-align:center">Chat-box Created By <span class="red" style="color:red">M</span>ilind <span class="red" style="color:red">K</span>amthe</h2>
	<p style="text-align:center">creativemk22@gmail.com</p>
	<hr>
	<div class="row">
	    <div class="chatbox chatbox22 chatbox--tray">
    <div class="chatbox__title">
        <h5><a href="javascript:void()">Leave a message</a></h5>
        <!--<button class="chatbox__title__tray">
            <span></span>
        </button>-->
        <button class="chatbox__title__close">
            <span>
                <svg viewBox="0 0 12 12" width="12px" height="12px">
                    <line stroke="#FFFFFF" x1="11.75" y1="0.25" x2="0.25" y2="11.75"></line>
                    <line stroke="#FFFFFF" x1="11.75" y1="11.75" x2="0.25" y2="0.25"></line>
                </svg>
            </span>
        </button>
    </div>
    <div class="chatbox__body">
        <div class="chatbox__body__message chatbox__body__message--left">
		
		<div class="chatbox_timing">
		<ul>
		<li><a href="#"><i class="fa fa-calendar"></i> 22/11/2018</a></li>
			<li><a href="#"><i class="fa fa-clock-o"></i> 7:00 PM</a></a></li>
		</ul>
		</div>
            <img src="https://www.gstatic.com/webp/gallery/2.jpg" alt="Picture">
			<div class="clearfix"></div>
			<div class="ul_section_full">
			<ul class="ul_msg">
			<li><strong>Person Name</strong></li>
			<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </li>
			</ul>
			<div class="clearfix"></div>
			<ul class="ul_msg2">
			<li><a href="#"><i class="fa fa-pencil"></i> </a></li>
			<li><a href="#"><i class="fa fa-trash chat-trash"></i></a></li>
			</ul>
			</div>
			 
        </div>

        <div class="chatbox__body__message chatbox__body__message--right">
		
		<div class="chatbox_timing">
		<ul>
		<li><a href="#"><i class="fa fa-calendar"></i> 22/11/2018</a></li>
			<li><a href="#"><i class="fa fa-clock-o"></i> 7:00 PM</a></a></li>
		</ul>
		</div>
	
            <img src="https://www.gstatic.com/webp/gallery/2.jpg" alt="Picture">
			<div class="clearfix"></div>
			<div class="ul_section_full">
			<ul class="ul_msg">
			<li><strong>Person Name</strong></li>
			<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </li>
			</ul>
			<div class="clearfix"></div>
			<ul class="ul_msg2">
			<li><a href="#"><i class="fa fa-pencil"></i> </a></li>
			<li><a href="#"><i class="fa fa-trash chat-trash"></i></a></li>
			</ul>
			</div>
			 
        </div>
        <div class="chatbox__body__message chatbox__body__message--left">
		
		<div class="chatbox_timing">
		<ul>
		<li><a href="#"><i class="fa fa-calendar"></i> 22/11/2018</a></li>
			<li><a href="#"><i class="fa fa-clock-o"></i> 7:00 PM</a></a></li>
		</ul>
		</div>
	
            <img src="https://www.gstatic.com/webp/gallery/2.jpg" alt="Picture">
			<div class="clearfix"></div>
			<div class="ul_section_full">
			<ul class="ul_msg">
			<li><strong>Person Name</strong></li>
			<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </li>
			</ul>
			<div class="clearfix"></div>
			<ul class="ul_msg2">
			<li><a href="#"><i class="fa fa-pencil"></i> </a></li>
			<li><a href="#"><i class="fa fa-trash chat-trash"></i></a></li>
			</ul>
			</div>
			 
        </div>
    </div>
    <div class="panel-footer">
                    <div class="input-group">
                        <input id="btn-input" type="text" class="form-control input-sm chat_set_height" placeholder="Type your message here..." tabindex="0" dir="ltr" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off" contenteditable="true" />
						
                        <span class="input-group-btn">
                            <button class="btn bt_bg btn-sm" id="btn-chat">
                                Send</button>
                        </span>
                    </div>
                </div>
</div>
	    
	</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>    
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>