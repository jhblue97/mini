<footer class="container">


	<p  style="text-align: center;" id = "admin_p" >&copy; bit gallery  email : jhblue05@gmail.com</p>
	

</footer>

<script>

var admin = document.getElementById('admin_p'); // header 객체에 onclick 이벤트 속성을 연결 
admin.onclick = function() { 
	
	location.href= '/logout.jsp?admin=y';
};



</script>