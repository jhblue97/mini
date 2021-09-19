<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>main.jsp</title>
<script src="/resources/js/bitcoinWebsocket.js"></script> 
</head>
<body>
<%@ include file="../include/header.jsp" %>


메인 화면입니다.
스타일리시한 포트폴리오는 오프 캔버스 탐색과 콘텐츠 섹션을 통한 부드러운 스크롤 기능이 있는 한 페이지 부트스트랩 포트폴리오 테마입니다.
두 가지 사용자 정의 버튼 스타일을 특징으로 하는 업데이트된 디자인
사용자 정의 토글 버튼이 있는 오프 캔버스 탐색
전체 페이지 배경 이미지와 세로 중앙에 콘텐츠가 있는 100% 높이 헤더 섹션
jQuery를 사용한 부드러운 페이지 스크롤
클릭 유도문안 섹션
Font Awesome 아이콘이 있는 서비스 섹션
포트폴리오 이미지 그리드
Google 지도 통합 바닥글
소셜 아이콘이 있는 바닥글 

<div class="container">
    <div class="row">
        <div class="col-md-offset-1 col-md-10">
            <div class="panel">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-sm-3 col-xs-12">
                            <h4 class="title">STREAM <span>TRADE_PRICE</span></h4>
                        </div>
                    </div>
                </div>
                <div class="panel-body table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>KO_PRICE</th>
                                <th>USD_PRICE</th>
                                <th>City</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Bitcoin</td>
                                <td><p id = "ko_price1"></p></td>
                                <td><p id = "en_price1"></td>
                                <td>Sinaai-Waas</td>
                                <td>
                                    <ul class="action-list">
                                        <li><a href="#" data-tip="edit"><i class="fa fa-edit"></i></a></li>
                                        <li><a href="#" data-tip="delete"><i class="fa fa-trash"></i></a></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>ETHERUM</td>
                                <td><p id = "ko_price2"></p></td>
                                <td><p id = "en_price2"></td>
                                <td>Baileux</td>
                                <td>
                                    <ul class="action-list">
                                        <li><a href="#" data-tip="edit"><i class="fa fa-edit"></i></a></li>
                                        <li><a href="#" data-tip="delete"><i class="fa fa-trash"></i></a></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>RIPPLE</td>
                                <td><p id = "ko_price3"></p></td>
                                <td><p id = "en_price3"></td>
                                <td>Overland Park</td>
                                <td>
                                    <ul class="action-list">
                                        <li><a href="#" data-tip="edit"><i class="fa fa-edit"></i></a></li>
                                        <li><a href="#" data-tip="delete"><i class="fa fa-trash"></i></a></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>DOGE</td>
                                <td><p id = "ko_price4"></p></td>
                                <td><p id = "en_price4"></td>
                                <td>Gloucester</td>
                                <td>
                                    <ul class="action-list">
                                        <li><a href="#" data-tip="edit"><i class="fa fa-edit"></i></a></li>
                                        <li><a href="#" data-tip="delete"><i class="fa fa-trash"></i></a></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>ADA</td>
                                <td><p id = "ko_price5"></p></td>
                                <td><p id = "en_price5"></td>
                                <td>Oud-Turnhout</td>
                                <td>
                                    <ul class="action-list">
                                        <li><a href="#" data-tip="edit"><i class="fa fa-edit"></i></a></li>
                                        <li><a href="#" data-tip="delete"><i class="fa fa-trash"></i></a></li>
                                    </ul>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="panel-footer">
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
 				
$(document).ready(function(){

    $.ajax({
      url: "https://exchange.jaeheon.kr:23490/query/USDKRW",   
    		 type:"get",
      cache : false,
      dataType: "json",
      success: function(data){ 
    	console.log(data.USDKRW);
    	  console.log(JSON.stringify(data));
    	
      }
    });
    
    
	
	
  /*   $('#ko_price1').on('DOMSubtreeModified propertychange', function() {
    		console.log('값 변경 됨');
    	
    }); */
});	


	////////////////////////////test/////////////////////////////////
	  	function BTC(){				
	 		 var bitcoin_ko='';
			 var ws = new WebSocket("wss://api.upbit.com/websocket/v1");
					ws.binaryType = 'arraybuffer';				
					ws.onopen = function(message) {
							 ws.send(JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-BTC"]}]));
							/* await ws.send(JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-ETH"]}]));	
							await ws.send(JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-XRP"]}]));	
							await ws.send(JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-DOGE"]}]));	
							await ws.send(JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-ADA"]}]));	
						 */	
					};	 
					ws.onclose 	= function(e){ 
						socket = undefined; 
					}
					ws.onmessage= function(e){ 
						//console.log(e);
						var enc = new TextDecoder("utf-8");
						var arr = new Uint8Array(e.data);	
						var decoe_arr = enc.decode(arr);
						var json_arr =JSON.parse(decoe_arr);
						bitcoin_ko  = json_arr.trade_price;
						$("#ko_price1").text(bitcoin_ko);
					}
				}
	
	  	function ETH(){				
	 		 var bitcoin_ko='';
			 var ws = new WebSocket("wss://api.upbit.com/websocket/v1");
					ws.binaryType = 'arraybuffer';				
					ws.onopen = function(message) {
							 ws.send(JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-ETH"]}]));
								};	 
					ws.onclose 	= function(e){ 
						socket = undefined; 
					}
					ws.onmessage= function(e){ 
						//console.log(e);
						var enc = new TextDecoder("utf-8");
						var arr = new Uint8Array(e.data);	
						var decoe_arr = enc.decode(arr);
						var json_arr =JSON.parse(decoe_arr);
						bitcoin_ko  = json_arr.trade_price;
						$("#ko_price2").text(bitcoin_ko);
					}
				}
	  	
	 	function XRP(){				
	 		 var bitcoin_ko='';
			 var ws = new WebSocket("wss://api.upbit.com/websocket/v1");
					ws.binaryType = 'arraybuffer';				
					ws.onopen = function(message) {
							 ws.send(JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-XRP"]}]));
								};	 
					ws.onclose 	= function(e){ 
						socket = undefined; 
					}
					ws.onmessage= function(e){ 
						//console.log(e);
						var enc = new TextDecoder("utf-8");
						var arr = new Uint8Array(e.data);	
						var decoe_arr = enc.decode(arr);
						var json_arr =JSON.parse(decoe_arr);
						bitcoin_ko  = json_arr.trade_price;
						$("#ko_price3").text(bitcoin_ko);
					}
				} 	
		function DOGE(){				
	 		 var bitcoin_ko='';
			 var ws = new WebSocket("wss://api.upbit.com/websocket/v1");
					ws.binaryType = 'arraybuffer';				
					ws.onopen = function(message) {
							 ws.send(JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-DOGE"]}]));
							};	 
					ws.onclose 	= function(e){ 
						socket = undefined; 
					}
					ws.onmessage= function(e){ 
						//console.log(e);
						var enc = new TextDecoder("utf-8");
						var arr = new Uint8Array(e.data);	
						var decoe_arr = enc.decode(arr);
						var json_arr =JSON.parse(decoe_arr);
						bitcoin_ko  = json_arr.trade_price;
						$("#ko_price4").text(bitcoin_ko);
					}
				}
		function ADA(){				
	 		 var bitcoin_ko='';
			 var ws = new WebSocket("wss://api.upbit.com/websocket/v1");
					ws.binaryType = 'arraybuffer';				
					ws.onopen = function(message) {
							 ws.send(JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-ADA"]}]));
						};	 
					ws.onclose 	= function(e){ 
						socket = undefined; 
					}
					ws.onmessage= function(e){ 
						//console.log(e);
						var enc = new TextDecoder("utf-8");
						var arr = new Uint8Array(e.data);	
						var decoe_arr = enc.decode(arr);
						var json_arr =JSON.parse(decoe_arr);
						bitcoin_ko  = json_arr.trade_price;
						$("#ko_price5").text(bitcoin_ko);
					}
				}
	 	function BTC_U(){				
	 		 var bitcoin_ko='';
			 var ws = new WebSocket("wss://stream.binance.com:9443/ws/btcusdt@trade");			
				/* 	ws.onopen = function(message) {
							 ws.send(JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-BTC"]}]));
							}; */	 
					ws.onclose 	= function(e){ 
						socket = undefined; 
					}
					ws.onmessage= function(e){ 	
						var price = JSON.parse(e.data);
						$("#en_price1").text(parseFloat(price.p).toFixed(2));
					}
				}
	 	function ETH_U(){				
	 		 var bitcoin_ko='';
			 var ws = new WebSocket("wss://stream.binance.com:9443/ws/ethusdt@trade");			
				/* 	ws.onopen = function(message) {
							 ws.send(JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-BTC"]}]));
							}; */	 
					ws.onclose 	= function(e){ 
						socket = undefined; 
					}
					ws.onmessage= function(e){ 	
						var price = JSON.parse(e.data);
						$("#en_price2").text(parseFloat(price.p).toFixed(2));
					}
				}
	 	
	 	function XRP_U(){				
	 		 var bitcoin_ko='';
			 var ws = new WebSocket("wss://stream.binance.com:9443/ws/xrpusdt@trade");			
				/* 	ws.onopen = function(message) {
							 ws.send(JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-BTC"]}]));
							}; */	 
					ws.onclose 	= function(e){ 
						socket = undefined; 
					}
					ws.onmessage= function(e){ 	
						var price = JSON.parse(e.data);
						$("#en_price3").text(parseFloat(price.p).toFixed(2));
					}
				}
	 	function DOGE_U(){				
	 		 var bitcoin_ko='';
			 var ws = new WebSocket("wss://stream.binance.com:9443/ws/dogeusdt@trade");			
				/* 	ws.onopen = function(message) {
							 ws.send(JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-BTC"]}]));
							}; */	 
					ws.onclose 	= function(e){ 
						socket = undefined; 
					}
					ws.onmessage= function(e){ 	
						var price = JSON.parse(e.data);
						$("#en_price4").text(parseFloat(price.p).toFixed(2));
					}
				}
	 	function ADA_U(){				
	 		 var bitcoin_ko='';
			 var ws = new WebSocket("wss://stream.binance.com:9443/ws/adausdt@trade");			
				/* 	ws.onopen = function(message) {
							 ws.send(JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-BTC"]}]));
							}; */	 
					ws.onclose 	= function(e){ 
						socket = undefined; 
					}
					ws.onmessage= function(e){ 	
						var price = JSON.parse(e.data);
						$("#en_price5").text(parseFloat(price.p).toFixed(2));
					}
				}
	 	BTC();
	 	ETH();	
	 	XRP();
	 	DOGE();
	 	ADA();
	 	BTC_U();
	 	ETH_U();
	 	XRP_U();
	 	DOGE_U();
	 	ADA_U();
	//////////////////test end//////////////////////////////////////
				
</script>  
<%@ include file="../include/footer.jsp" %>
</body>
</html>