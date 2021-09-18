<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>



<table>


</table>
<script type="text/javascript">
/* var count = 3000;
marketPrice();


function marketPrice(){
	
    $.ajax({
     // url: "https://crix-api-endpoint.upbit.com/v1/crix/candles/days/?code=CRIX.UPBIT.KRW-BTC",
      url: "https://api.bithumb.com/public/ticker/BTCUSDT",  
    		 type:"get",
      cache : false,
      success: function(data){ // getserver.php 파일에서 echo 결과값이 data 임
    	 // var obj = JSON.parse(data);
    	  console.log(data);
      }
    });
    //setTimeout("marketPrice()", count); // 2초 단위로 갱신 처리
}
 */
 /* var ws = new WebSocket("wss://stream.binance.com:9443/ws/btcusdt@trade");

	ws.onmessage = (event) => {
		// 콘솔 텍스트에 메시지를 출력한다.
		console.log(event.data);
		};	 */
	
/* 		 var ws = new WebSocket("wss://pubwss.bithumb.com/pub/ws");
		
				ws.send("{'type':'ticker','symbols':'BTC_KRW','tickTypes':'30M'}");		
				ws.onmessage = (event) => {
					// 콘솔 텍스트에 메시지를 출력한다.
					console.log(event);
					};	 */
					
					var ws = new WebSocket("wss://api.upbit.com/websocket/v1");
					ws.binaryType = 'arraybuffer';				
					ws.onopen = function(message) {
						// 콘솔 텍스트에 메시지를 출력한다.
						console.log(message);
						//var msg = [{"ticket":"test"},{"type":"ticker","codes":["KRW-BTC","BTC-BCH"]}];
						var msg = [{"ticket":"test"},{"type":"ticker","codes":["KRW-BTC","BTC-BCH"]}];
				
						ws.send(JSON.stringify(msg));				
					};	
					ws.onclose 	= function(e){ 
						socket = undefined; 
					}
					ws.onmessage= function(e){ 
						console.log(e);
						var enc = new TextDecoder("utf-8");
						var arr = new Uint8Array(e.data);	
						console.log(arr);
						var decoe_arr = enc.decode(arr);
						console.log(decoe_arr);
						var json_arr =JSON.parse(decoe_arr);
						console.log(json_arr.trade_price);
						ws.close();
					}	
				
					
</script>

</body>
</html>