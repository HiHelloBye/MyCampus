<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../css/html5up-eventually/assets/css/main.css?var=1" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<title>이메일 찾기 검색결과</title></head>
	<script type="text/javascript">
		$(function(){
			$('#loginBtn').click(function(){
				location.href = 'loginForm.do';
			})
		})
	</script>
	
<body class="is-preload">

	<header id="header">
		<h1>이메일 찾기 검색결과</h1>
		<p>대학 생활을 더 편하고 즐겁게<br />
		<a href="loginForm.do">My Campus</a>.</p>
	</header>
	
	<c:if test="${member_email ne null && member_Emial != '' }">
   				${fn:substring(member_email,0,7) }
	</c:if>
	<c:forEach begin="5" end="${fn:length(member_email)}" step="1">
    *
 	</c:forEach>
	<p>
	<button type="button" id="loginBtn" >Sign Up</button>
	</p>
	
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
