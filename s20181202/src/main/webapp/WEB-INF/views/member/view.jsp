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
<title>마이 페이지</title>
<style type="text/css"> 
	a { text-decoration:none } 
	
</style> 
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">
		
		<section id="header">
			<div class="container">
				<h1 id="logo"><a href="../Mainpage.do">마이캠퍼스</a></h1>				
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
			<div class="row aln-center">
				<div class="col-4 col-6-medium col-12-small">
					<div style="width:300px; margin: 0 auto; margin-top:20px;">
						<img style="width:300px;" src='${memberView.member_photo}' id="member_photo" name="member_photo" >								
					</div>
				
					<div style="width: 400px; margin: 0 auto;" >
						<div >
							<label style="font-style: normal; margin: 0 auto;" >이메일</label>
							<input style="width: 400px; margin: 0 auto;" type="text" id="member_email" name="member_email" value="${memberView.member_email }" required readonly="readonly"> 
						</div>
						<div>
							<label style="font-style: normal; margin: 0 auto;">닉네임</label> 
							<input style="width: 400px; margin: 0 auto;" type="text" id="member_nick" name="member_nick" value="${memberView.member_nick }" readonly="readonly"> 
						</div>
						<div>
							<label style="font-style: normal;margin: 0 auto;">대학교</label> 
							<input style="width: 400px; margin: 0 auto;" type="text" id="uni_name" name="uni_name" value="${memberView.uni_name }" readonly="readonly"> 
						</div>
						<div>
							<label style="font-style: normal;margin: 0 auto;">가입 일자</label> 
							<input style="width: 400px; margin: 0 auto;" type="text" id="reg_date" name="reg_date" value="${memberView.reg_date }" pattern="yyyy-MM-dd HH:mm:ss" readonly="readonly"> 
						</div>
						<div>
							<label style="font-style: normal;margin: 0 auto;">최종 로그인 일자</label> 
							<input style="width: 400px; margin: 0 auto;" type="text" id="log_date" name="log_date" value="${memberView.log_date }" pattern="yyyy-MM-dd HH:mm:ss" readonly="readonly"> 
						</div>
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
