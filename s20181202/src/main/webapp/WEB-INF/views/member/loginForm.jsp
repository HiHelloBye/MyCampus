<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../css/html5up-eventually/assets/css/main.css?var=1" />
	<style type="text/css">
		#signup-form1 {
		display: -moz-flex;
		display: -webkit-flex;
		display: -ms-flex;
		display: flex;
		position: relative;
		
		#signup-form input[type="text"],
		#signup-form input[type="password"],
		#signup-form input[type="email"] {
			width: 20em;
		}

		#signup-form1 > * {
			margin: 0 0 0 1em;
		}

		#signup-form1 > :first-child {
			margin: 0 0 0 0;
		}

		@media screen and (max-width: 480px) {

			#signup-form1 {
				-moz-flex-direction: column;
				-webkit-flex-direction: column;
				-ms-flex-direction: column;
				flex-direction: column;
			}

				#signup-form1 input[type="type"],
				#signup-form1 input[type="password"],
				#signup-form1 input[type="email"] {
					width: 100%;
				}

				#signup-form1 > * {
					margin: 1.25em 0 0 0;
				}
	}
	
	</style>
	
	<title>마이 캠퍼스</title>
</head>
<body class="is-preload">
	<header id="header">
		<h1>마이 캠퍼스</h1>
		<p>대학 생활을 더 편하고 즐겁게<br />
		<a href="loginForm.do">My Campus</a>.</p>
	</header>

	<form id="signup-form1" action="login.do" method="post" >
		<input style="width: 500px;" type="email" name="member_email" id="member_email" placeholder="Email Address" required="required" /><br>
		<input style="width: 500px; margin-left: 20px;" type="password" name="member_pw" id="member_pw" placeholder="Password" required="required" />
		<input style="margin-left: 20px;" type="submit" value="Log In" />
		
	</form>
			<input style="width:150px;" type="submit" value="Sign Up" onclick="location.href='register.do'">
	
	
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
