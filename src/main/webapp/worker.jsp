<!doctype html>
<html>
<head>
<title>Document</title>
</head>
<body>
<script>
// 1번째 스택
{
// SharedWorker가 실행 가능한지 체크
if (window.SharedWorker) {
// SharedWorker 쓰레드를 실행(js파일로 등록한다.)
let worker = new SharedWorker("/resources/js/bitcoinWebsocket.js");

worker.port.postMessage('BTC');  

// worker.js에서 postMessage의 값을 받는다.
worker.port.onmessage = function (e) {
// 콘솔 출력					
console.log(e.data);
}
// worker.js로 postMessage를 보낸다.
worker.port.postMessage(null);
}
}
// 2번째 스택
 /*{
// SharedWorker가 실행 가능한지 체크
if (window.SharedWorker) {
// SharedWorker 쓰레드를 실행(js파일로 등록한다.)
let worker = new SharedWorker("/resources/js/bitcoinWebsocket.js");
// worker.js에서 postMessage의 값을 받는다.
worker.port.onmessage = function (e) {
// 콘솔 출력
console.log(e.data);
}
// worker.js로 postMessage를 보낸다.
worker.port.postMessage(null);
}
} */
</script>
</body>
</html>
