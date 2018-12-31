<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css?ver=3" /> 
<link rel="stylesheet" href="../assets/css/main_sub.css?ver=3" />
<noscript><link rel="stylesheet" href="../assets/css/noscript.css" /></noscript>
<title>회원정보 변경</title>
<style type="text/css"> 
a { text-decoration:none } 

.font_un{
	font-weight: 800;
}

.font_hi {
	font-weight: 600;
	color:#67AECA;
}

</style> 
	
<script type="text/javascript">
	$(function(){
		if(${msg ne null}){
			alert('${msg}');
		};
		
		if($("#passwordForm").submit(function(){
			if($("#member_pw").val() !== $("#member_pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#member_pw").val("").focus();
				$("#member_pw2").val("");
				return false;
			}else if ($("#member_pw").val().length < 3) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#member_pw").val("").focus();
				return false;
			}else if($.trim($("#member_pw").val()) !== $("#member_pw").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		}));
		
		if($("#deleteForm").submit(function(){
			if(!confirm("정말 탈퇴하시겠습니까?")) {
				return false;
			}
	}));
})
</script>
</head>
<div id="page-wrapper">

			<!-- Header -->
				<section id="header">
					<div class="container">
						<!-- Logo -->
							<h1 id="logo"><a href="../Mainpage.do">마이캠퍼스</a></h1>							
						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a class="icon fa-graduation-cap" href="../lectureEvalMain.do"><span>강의평가</span></a></li>
									<li><a href="../booksellList.do" class="icon fa-book"><span>책방</span></a>
										<ul>
											<li><a href="../bookSellForm.do">책 판매</a></li>
										</ul>
									</li>
									<li><a class="icon fa-laptop" href="../study/StudyList.do"><span>스터디</span></a></li>
									<c:if test="${sessionScope.member_grade eq  0}">
										<li><a class="icon fa-home" href="../nlist.do"><span>관리자 페이지</span></a></li>
									<li><a class="icon fa-sign-out" href="logout.do"><span>로그아웃</span></a></li>
									</c:if>
									<c:if test="${sessionScope.member_grade eq 1}" >
										<li><a class="icon fa-home" href="view.do"><span>마이페이지</span></a>
											<ul>
												<li><a href="msgsend.do">나의 쪽지함</a></li>
												<li><a href="myPage.do">회원정보수정</a></li>
												<li><a href="profileForm.do">프로필사진수정</a></li>
												<li><a href="lectureBoardList.do">나의 강의평</a></li>
												<li><a href="bookBoardList.do">나의 책방</a></li>
												<li><a href="studyBoardList.do">나의 스터디</a></li>
											</ul>
										</li>
										<li><a class="icon fa-sign-out" href="logout.do"><span>로그아웃</span></a></li>
									</c:if>
								</ul>
							</nav>

					</div>
				</section>
			</div>
			
			
			
			<section id="banner">
				<div class="container">
				</div>
			</section>	
			
		
<section id="features">
	<div class="container">
		<div class="row aln-center" >
			<div class="col-4 col-6-medium col-12-small"style="width:700px; margin: 0 auto;margin-top:70px;">
				<div style="width:400px; margin: 0 auto;margin-top:20px;">
				<form id="myForm" action="update_mypage.do" method="post">
					<p>
						<label>이메일</label> 
						<input style="width: 400px;" class="w3-input" type="text" id="member_email" name="member_email" value="${member.member_email }" required readonly="readonly"> 
					</p>
					<p>
						<label>닉네임</label> 
						<input style="width: 400px;" class="w3-input" type="text" id="member_nick" name="member_nick" value="${member.member_nick }" required> 
					</p>
					<p class="w3-center">
						<button style="width: 400px;" type="submit">닉네임 변경</button>
					</p>
				</form>
				</div>
				<br />
				<div style="width:400px; margin: 0 auto;">
				<form id="passwordForm" action="update_pw.do" method="post">	
					<input type="hidden" name="member_email" readonly="readonly" value="${ member.member_email }">
					<p>
						<label>기존 비밀번호</label>
						<input style="width: 400px;" class="w3-input" id="old_pw" name="old_pw" type="password" required>
					</p>
					<p>
						<label>새 비밀번호 변경</label> 
						<input style="width: 400px;" class="w3-input" id="member_pw" name="member_pw" type="password" required>
					</p>
					<p>
						<label>새 비밀번호 변경 확인</label>
						<input  style="width: 400px;" class="w3-input" type="password" id="member_pw2" type="password" required>
					</p>
					<p class="w3-center">
						<button  style="width: 400px;" type="submit">비밀번호 변경</button>
					</p>
				</form>
				</div>
				<br />
				<div style="width:400px; margin: 0 auto;">
				<form id="deleteForm" action="withdrawal.do" method="post">	
					<input type="hidden" name="member_email" readonly="readonly" value="${ member.member_email }">
					<p>
						<label>비밀번호 입력</label> 
						<input style="width: 400px;" class="w3-input" id="member_pw" name="member_pw" type="password" required>
					</p>
					<p class="w3-center">
						<button style="width: 400px;" type="submit" id="withdrawalBtn" >회원탈퇴</button>
					</p>
				</form>
				</div>
			</div>
		</div>
	</div>
	</section>
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script> 
	<script src="../assets/js/jquery.scrollex.min.js"></script>
	<script src="../assets/js/jquery.scrolly.min.js"></script>
	<script src="../assets/js/browser.min.js"></script>
	<script src="../assets/js/breakpoints.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script> 
			
</body>
</html>