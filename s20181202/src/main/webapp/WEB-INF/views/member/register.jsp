<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../css/html5up-eventually/assets/css/main.css?var=1" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<title>회원가입</title>
	<script type="text/javascript">
		$(function(){
			$("#register").submit(function(){
				if($("#member_pw").val() !== $("#member_pw2").val()){
					alert("비밀번호가 다릅니다.");
					$("#member_pw").val("").focus();
					$("#member_pw2").val("");
					return false;
					
				} else if ($("#member_pw").val().length < 3) {
					alert("비밀번호는 3자 이상으로 설정해야 합니다.");
					$("#member_pw").val("").focus();
					return false;
					
				} else if($.trim($("#member_email").val()) !== $("#member_email").val() || $.trim($("#member_pw").val()) !== $("#member_pw").val() || $.trim($("#member_nick").val()) !== $("#member_nick").val()){
					alert("공백은 입력이 불가능합니다.");
					return false;
				} else if(!$('#uni_no > option:selected').val()) {
				    alert("대학교를 선택해주세요.");
				} else {
					alert('회원가입이 완료되었습니다. 이메일 인증 후 로그인해주세요.');
				}
		})
		
			
		$("#member_email").keyup(function(){
			$.ajax({
				url : "check_email.do",
				type : "POST",
				data : {
					member_email : $("#member_email").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#email_check").html("중복된 이메일이 있습니다.");
					} else {
						$("#email_check").html("");
					}
				},
			})
		});	
		
		$("#member_nick").keyup(function(){
			$.ajax({
				url : "check_nick.do",
				type : "POST",
				data : {
					member_nick : $("#member_nick").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#nick_check").html("중복된 닉네임이 있습니다.");
					} else {
						$("#nick_check").html("");
					}
				},
			})
		});
	})
	</script>
</head>
<body class="is-preload">
	<header id="header">
		<h1>회원가입</h1>
		<p>대학 생활을 더 편하고 즐겁게<br />
		<a href="loginForm.do">My Campus</a>.</p>
	</header>
	
	<form id="register" method="post" action="register.do">
		<label>이메일</label>
		<input style="width: 600px;" type="email" name="member_email" id="member_email" required placeholder="이메일 인증 후 로그인이 가능합니다." /><br>
		<span id="email_check"></span>
		
		<label>비밀번호</label> 
		<input style="width: 600px;" type="password" name="member_pw" id="member_pw" required placeholder="비밀번호를 입력해주세요." />
		
		<label>비밀번호 확인</label> 
		<input style="width: 600px;" id="member_pw2" name="member_pw2" type="password" required placeholder="비밀번호를 입력해주세요.">
		
		<label>닉네임</label> 
		<input style="width: 600px;" id="member_nick" name="member_nick" type="text" required placeholder="닉네임을 입력해주세요.">
		<span id="nick_check"></span>
		
		<label>대학교</label> 
		<select style="width: 600px;" id="uni_no" name="uni_no">
			  <option value="" disabled selected>대학교를 선택해주세요.</option>
				<option value="1">상명대학교</option>
				<option value="2">서울대학교</option>
				<option value="3">고려대학교</option>
				<option value="4">연세대학교</option>
				<option value="5">하버드대학교</option>
		</select> 
		<br>
		<button style="margin-top: 10px" type="submit" id="registerButton">Sign in</button>	
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
