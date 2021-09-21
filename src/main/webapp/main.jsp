<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>main.jsp</title>
</head>
<body  class="main-bg" style ="   
	height: 100%;margin: 0;
    background-repeat: no-repeat;
    background-attachment: fixed;">
<%@ include file="../include/header.jsp" %>


    <div class="col-md-offset-1 col-md-12">

		<h1 id = "divClock"  class="clock" style="text-align: center;"></h1>

	</div>
  
<div class="container">
    <div class="row">
        <div class="col-md-offset-1 col-md-8">
            <div class="panel">
                <div class="panel-heading">
                         <div>
                           기준 거래소 : KRW - UPbit , USD - Binance
                        </div>
                    <div class="row">
                          <div class="col col-sm-3 col-xs-12">
                            <h4 class="title">STREAM TRADE_PRICE</h4> 
                        </div>
                    </div>
                </div>
                <div class="panel-body table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>KO_PRICE ₩</th>
                                <th>USD_PRICE $</th>
                                <th>KOREA PREMIUM</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>&nbsp; 1</td>
                                <td><img src = "/resources/images/BITCOINICON.png" width = "20"> &nbsp; BITCOIN</td>
                                <td><p id = "ko_price1"></p></td>
                                <td><p id = "en_price1"></p></td>
                                <td><p id = "ko_pre1"></p></td>
                            </tr>
                            <tr>
                                <td>&nbsp; 2</td>
                                <td><img src = "/resources/images/ETH.png" width = "20"> &nbsp; ETHERUM</td>
                                <td><p id = "ko_price2"></p></td>
                                <td><p id = "en_price2"></p></td>
                                <td><p id = "ko_pre2"></p></td>
                            </tr>
                            <tr>
                                <td>&nbsp; 3</td>
                                <td><img src = "/resources/images/RIPPLE.png" width = "20"> &nbsp; RIPPLE</td>
                                <td><p id = "ko_price3"></p></td>
                                <td><p id = "en_price3"></p></td>
                                <td><p id = "ko_pre3"></p></td>
                            </tr>
                            <tr>
                                <td>&nbsp; 4</td>
                                <td><img src = "/resources/images/DOGE.png" width = "20"> &nbsp; DOGE</td>
                                <td><p id = "ko_price4"></p></td>
                                <td><p id = "en_price4"></p></td>
                                <td><p id = "ko_pre4"></p></td>
                            </tr>
                            <tr>
                                <td>&nbsp; 5</td>
                                <td><img src = "/resources/images/ADA.png" width = "20"> &nbsp; ADA</td>
                                <td><p id = "ko_price5"></p></td>
                                <td><p id = "en_price5"></p></td>
                                <td><p id = "ko_pre5"></p></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="panel-footer">
                </div>
            </div>
        </div>
        <!-- TradingView Widget BEGIN -->
          <div class="col-md-offset-1 col-md-4">
<!-- TradingView Widget BEGIN -->
<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
  <div id="tradingview_f0989"></div>
  <!-- <div class="tradingview-widget-copyright">TradingView 제공 <a href="https://kr.tradingview.com/symbols/BTCUSDT/?exchange=BINANCE" rel="noopener" target="_blank"><span class="blue-text">BTCUSDT 차트</span></a></div>
  -->
   <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  <script type="text/javascript">
  new TradingView.widget(
  {
  "width": 450,
  "height": 550,
  "symbol": "BINANCE:BTCUSDT",
  "interval": "D",
  "timezone": "Etc/UTC",
  "theme": "dark",
  "style": "1",
  "locale": "kr",
  "toolbar_bg": "#f1f3f6",
  "enable_publishing": false,
  "allow_symbol_change": true,
  "container_id": "tradingview_f0989"
}
  );
  </script>
</div>
<!-- TradingView Widget END --></div>
        
        
    </div>
</div>
<script type="text/javascript">

	$(document).ready(function(){

		timer = setInterval( function () {

		    $.ajax ({

		        "url" : "/Chart/exchange.do",
		        cache : false,
		        type:"get", 
		        success : function (data) {
		        	 $('#ko_pre1').text(((($('#ko_price1').text()-($('#en_price1').text()*data))/$('#ko_price1').text())*100).toFixed(2)+'%');
		        	 $('#ko_pre2').text(((($('#ko_price2').text()-($('#en_price2').text()*data))/$('#ko_price2').text())*100).toFixed(2)+'%');
			    	 $('#ko_pre3').text(((($('#ko_price3').text()-($('#en_price3').text()*data))/$('#ko_price3').text())*100).toFixed(2)+'%');
			     	 $('#ko_pre4').text(((($('#ko_price4').text()-($('#en_price4').text()*data))/$('#ko_price4').text())*100).toFixed(2)+'%');
			    	 $('#ko_pre5').text(((($('#ko_price5').text()-($('#en_price5').text()*data))/$('#ko_price5').text())*100).toFixed(2)+'%');
				
			    	 
		        	 var price1 = ((($('#ko_price1').text()-($('#en_price1').text()*data))/$('#ko_price1').text())*100).toFixed(2);	 
			    	 var price2 = ((($('#ko_price2').text()-($('#en_price2').text()*data))/$('#ko_price2').text())*100).toFixed(2);	 
			    	 var price3 = ((($('#ko_price3').text()-($('#en_price3').text()*data))/$('#ko_price3').text())*100).toFixed(2);	 
			    	 var price4 = ((($('#ko_price4').text()-($('#en_price4').text()*data))/$('#ko_price4').text())*100).toFixed(2);	 
			    	 var price5 = ((($('#ko_price5').text()-($('#en_price5').text()*data))/$('#ko_price5').text())*100).toFixed(2);	 
			    	
			    	 if(price1>0){
			    		 $('#ko_pre1').css("color","red");
			    		 $('#ko_pre1').text('+'+$('#ko_pre1').text());
			    	 }else{
			    		 $('#ko_pre1').css("color","blue");
			    		 $('#ko_pre1').text('-'+$('#ko_pre1').text());
			    	 }
			    
			    	 if(price2>0){
			    		 $('#ko_pre2').css("color","red");
			    		 $('#ko_pre2').text('+'+$('#ko_pre2').text());
			    	 }else{
			    		 $('#ko_pre2').css("color","blue");
			    		 $('#ko_pre2').text('-'+$('#ko_pre2').text());
			    	 }
			    	 
			    	 if(price3>0){
			    		 $('#ko_pre3').css("color","red");
			    		 $('#ko_pre3').text('+'+$('#ko_pre3').text());
			    	 }else{
			    		 $('#ko_pre3').css("color","blue");
			    		 $('#ko_pre3').text('-'+$('#ko_pre3').text());
			    	 }
			    	 
			    	 if(price4>0){
			    		 $('#ko_pre4').css("color","red");
			    		 $('#ko_pre4').text('+'+$('#ko_pre4').text());
			    		 
			    	 }else{
			    		 $('#ko_pre4').css("color","blue");
			    		 $('#ko_pre4').text('-'+$('#ko_pre4').text());
			    	 }
			    	 
			    	 if(price5>0){
			    		 $('#ko_pre5').css("color","red");
			    		 $('#ko_pre5').text('+'+$('#ko_pre5').text());
			    	 }else{
			    		 $('#ko_pre5').css("color","blue");
			    		 $('#ko_pre5').text('-'+$('#ko_pre5').text());
			    	 }
			    	 
		
			    	 
			    		  
		        
		        
		        }

		    });

		    }, 3000);
		
		    
	/* 	    $('#en_price1').on('DOMSubtreeModified propertychange', function() {
		       
			    $.ajax({
				      url: "/Chart/exchange.do",   
				      type:"get", 
				      cache : false,
				      async  : false,
				      success: function(data){ 
				    	 //console.log(((($('#ko_price1').text()-($('#en_price1').text()*data))/$('#ko_price1').text())*100).toFixed(2));
				    var price = ((($('#ko_price1').text()-($('#en_price1').text()*data))/$('#ko_price1').text())*100).toFixed(2);	 
				    	 $('#ko_pre1').text(price+'%');
				    	 
				      }
				  });
		    });
		  
		    $('#en_price2').on('DOMSubtreeModified propertychange', function() {
			       
			    $.ajax({
				      url: "/Chart/exchange.do",   
				      type:"get", 
				      cache : false,
				      async  : false,
				      success: function(data){ 
				    	 //console.log(((($('#ko_price2').text()-($('#en_price2').text()*data))/$('#ko_price2').text())*100).toFixed(2));
				    	 
				    	 $('#ko_pre2').text(((($('#ko_price2').text()-($('#en_price2').text()*data))/$('#ko_price2').text())*100).toFixed(2)+'%');
				    	 
				      }
				  });
		    });
		    
		    $('#en_price3').on('DOMSubtreeModified propertychange', function() {
			       
			    $.ajax({
				      url: "/Chart/exchange.do",   
				      type:"get", 
				      cache : false,
				      async  : false,
				      success: function(data){ 
				    	// console.log(((($('#ko_price3').text()-($('#en_price3').text()*data))/$('#ko_price3').text())*100).toFixed(2));
				    	 
				    	 $('#ko_pre3').text(((($('#ko_price3').text()-($('#en_price3').text()*data))/$('#ko_price3').text())*100).toFixed(2)+'%');
				    	 
				      }
				  });
		    });
		    
		    $('#en_price4').on('DOMSubtreeModified propertychange', function() {
			       
			    $.ajax({
				      url: "/Chart/exchange.do",   
				      type:"get", 
				      cache : false,
				      async  : false,
				      success: function(data){ 
				    	// console.log(((($('#ko_price4').text()-($('#en_price4').text()*data))/$('#ko_price4').text())*100).toFixed(2));
				    	 
				    	 $('#ko_pre4').text(((($('#ko_price4').text()-($('#en_price4').text()*data))/$('#ko_price4').text())*100).toFixed(2)+'%');
				    	 
				      }
				  });
		    });
		    
		    $('#en_price5').on('DOMSubtreeModified propertychange', function() {
			       
			    $.ajax({
				      url: "/Chart/exchange.do",   
				      type:"get", 
				      cache : false,
				      async  : false,
				      success: function(data){ 
				    	 //console.log(((($('#ko_price5').text()-($('#en_price5').text()*data))/$('#ko_price5').text())*100).toFixed(2));
				    	 
				    	 $('#ko_pre5').text(((($('#ko_price5').text()-($('#en_price5').text()*data))/$('#ko_price5').text())*100).toFixed(2)+'%');
				    	 
				      }
				  });
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
			
	//////CLOCK START///////////////////////////////////////////////
  function showClock()
    {
        var currentDate=new Date();
        var divClock=document.getElementById("divClock");
        var apm=currentDate.getHours();
        if(apm<12)
        {
            apm="AM";
        }
        else
        {
            apm="PM";
        }
        
        var msg = apm +(currentDate.getHours())+":";
        msg += currentDate.getMinutes() + ":";
        msg += currentDate.getSeconds() + "";
        msg += " (KST)";
        
        divClock.innerText=msg;
        
        setTimeout(showClock,1000);
    }
  showClock();
//////////////CLOCK END //////////////////
	
	
</script>  
<%@ include file="../include/footer.jsp" %>
</body>
</html>