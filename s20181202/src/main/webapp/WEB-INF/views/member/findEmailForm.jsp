	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../css/html5up-eventually/assets/css/main.css?var=1" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<title>이메일 찾기</title></head>
<body class="is-preload">
	<header id="header">
		<h1>이메일 찾기</h1>
		<p>대학 생활을 더 편하고 즐겁게<br />
		<a href="loginForm.do">My Campus</a>.</p>
	</header>
	
	<form method="post" action="find_email.do">
		<label>닉네임</label>
		<input style="width: 600px;" type="text" id="member_nick" name="member_nick" required placeholder="Nickname">
		
		
		<button style="margin-top: 20px"  type="submit" id="findBtn" >Find</button>
	</form>
	
	<footer id="footer">
		<ul class="icons">
			<li><a href="findEmailForm.do" class="icon fa fa-etsy"><span class="label">EmailFind</span></a></li>
			<li><a href="findPasswordForm.do" class="icon fa fa-lock"><span class="label">PasswordFind</span></a></li>
			<li><a href="https://github.com/HiHelloBye/s20181202" class="icon fa-github"><span class="label">GitHub</span></a></li>
			<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
		</ul>
		<ul class="copyright">
			<li>&copy; Mycampus.</li><li>Credits: <a href="http://html5up.net">HTML5 UP</a></li>
		</ul>
	</footer>
	
	<script src="../css/html5up-eventually/assets/js/main.js"></script>
	
</body>
</html>
