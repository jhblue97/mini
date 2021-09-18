
/**
 * bitcoin websocket
 */
function bitcoin_ko(){
	
	let bitcoin_ko;
	
		var ws = new WebSocket("wss://api.upbit.com/websocket/v1");
					ws.binaryType = 'arraybuffer';				
					ws.onopen = function(message) {
						// 콘솔 텍스트에 메시지를 출력한다.
						console.log(message);
						//var msg = [{"ticket":"test"},{"type":"ticker","codes":["KRW-BTC","BTC-BCH"]}];
						var msg = [{"ticket":"test"},{"type":"ticker","codes":["KRW-BTC"]}];
				
						ws.send(JSON.stringify(msg));				
					};	
					ws.onclose 	= function(e){ 
						socket = undefined; 
					}
					ws.onmessage= function(e){ 
						//console.log(e);
						var enc = new TextDecoder("utf-8");
						var arr = new Uint8Array(e.data);	
						//console.log(arr);
						var decoe_arr = enc.decode(arr);
						//console.log(decoe_arr);
						var json_arr =JSON.parse(decoe_arr);
						//console.log(json_arr.trade_price);
						
						//bitcoin_ko  = JSON.stringify(json_arr.trade_price);
						bitcoin_ko  = json_arr.trade_price;
						console.log(bitcoin_ko);
						//$('#ko_price').val(bitcoin_ko);
						document.getElementById("ko_price").value = bitcoin_ko;
						//alert(bitcoin_ko);
						//ws.close();
					}


/**
 * bitcoin websocket
 */
function bitcoin_ko(){
	
	let bitcoin_ko;
	
		var ws = new WebSocket("wss://api.upbit.com/websocket/v1");
					ws.binaryType = 'arraybuffer';				
					ws.onopen = function(message) {
						// 콘솔 텍스트에 메시지를 출력한다.
						console.log(message);
						//var msg = [{"ticket":"test"},{"type":"ticker","codes":["KRW-BTC","BTC-BCH"]}];
						var msg = [{"ticket":"test"},{"type":"ticker","codes":["KRW-BTC"]}];
				
						ws.send(JSON.stringify(msg));				
					};	
					ws.onclose 	= function(e){ 
						socket = undefined; 
					}
					ws.onmessage= function(e){ 
						//console.log(e);
						var enc = new TextDecoder("utf-8");
						var arr = new Uint8Array(e.data);	
						//console.log(arr);
						var decoe_arr = enc.decode(arr);
						//console.log(decoe_arr);
						var json_arr =JSON.parse(decoe_arr);
						//console.log(json_arr.trade_price);
						
						//bitcoin_ko  = JSON.stringify(json_arr.trade_price);
						bitcoin_ko  = json_arr.trade_price;
						console.log(bitcoin_ko);
						//$('#ko_price').val(bitcoin_ko);
						document.getElementById("ko_price").value = bitcoin_ko;
						//alert(bitcoin_ko);
						//ws.close();
					}

}