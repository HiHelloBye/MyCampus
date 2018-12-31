<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE HTML>
<!--
	Story by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Story by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css?ver=1" /> 
		<!-- <link rel="stylesheet" href="./cssEval/assets/css/main.css" /> -->
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<link rel="stylesheet" href="assets/css/main_sub.css?ver=1" /> 
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
		
	</head>
	<body class="is-preload">
		
		<input type="hidden" value="${sessionScope.member_email}" />
		
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">
					<div class="container">

						<!-- Logo -->
							<h1 id="logo"><a href="Mainpage.do">마이캠퍼스</a></h1>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a class="icon fa-graduation-cap" href="./lectureEvalMain.do"><span>강의평가</span></a></li>
									<li><a href="./booksellList.do" class="icon fa-book"><span>책방</span></a>
										<ul>
											<li><a href="./bookSellForm.do">책 판매</a></li>
										</ul>
									</li>
									<li><a class="icon fa-laptop" href="./study/StudyList.do"><span>스터디</span></a></li>
									<c:if test="${sessionScope.member_grade eq  0}">
										<li><a class="icon fa-home" href="./nlist.do"><span>관리자 페이지</span></a></li>
									<li><a class="icon fa-sign-out" href="member/logout.do"><span>로그아웃</span></a></li>
									</c:if>
									<c:if test="${sessionScope.member_grade eq 1}" >
										<li><a class="icon fa-home" href="member/view.do"><span>마이페이지</span></a>
											<ul>
												<li><a href="member/msgsend.do">나의 쪽지함</a></li>
												<li><a href="member/myPage.do">회원정보수정</a></li>
												<li><a href="member/profileForm.do">프로필사진수정</a></li>
												<li><a href="member/lectureBoardList.do">나의 강의평</a></li>
												<li><a href="member/bookBoardList.do">나의 책방</a></li>
												<li><a href="member/studyBoardList.do">나의 스터디</a></li>
											</ul>
										</li>
										<li><a class="icon fa-sign-out" href="member/logout.do"><span>로그아웃</span></a></li>
									</c:if>
								</ul>
							</nav>
					</div>
				</section>
			</div>
			<div>
			</div>
		<!-- Banner -->
			<section id="banner">
			<br />
				<div class="container" style="width: 95%; margin: 0 auto;">
					<form action="searchResult.do">
						<div class="fields" style="width: 60%; margin-left: 25%;" >
							<select style="width: 200px;" name="code">
								<option value="LectureEval">강의평</option>
								<option value="Book">책방</option>
								<option value="Study">스터디</option>
							</select>	
								<input style="width: 600px;" type="text" name="keyword" placeholder="검색 옵션을 확인하여 주세요." autocomplete="off" /> 
								<input style="background-color:#67AECA;" class="button primary icon" type="submit" value="검색">
						</div>
					</form>
				</div>
			</section>
		<!-- Wrapper -->
			<div id="wrapper" class="divided">

				<!-- Five -->
					<section class="wrapper style1 align-center">
						<div class="inner">
							<h2>
								<font class="font_hi">MY CAMPUS</font>에서 많은 정보를 공유하세요
							</h2>
							<strong style="color:#67AECA;">강의평가, 중고책 거래, 스터디 모집</strong>을 이용하여, 보다 더 나은 대학생활을 하시길 바랍니다.
						</div> 

						<!-- Gallery -->
						<div class="gallery style2 medium lightbox onscroll-fade-in">
							<c:forEach var="MainBook" items="${MainBook}">
								<article>
									<a href="bookDetail.do?book_no=${MainBook.book_no }" class="image">
										<img src='${MainBook.book_photo1}'
											style="width: 500px; height: 400px;" alt="" />
									</a>
									<div class="caption">
										<h3>${MainBook.book_name}</h3>
											<p>${MainBook.book_writer}| ${MainBook.book_pub}</p>
											<ul class="actions fixed">
												<li><span class="button small">Details</span></li>
											</ul>
									</div>
								</article>
							</c:forEach>
						</div>

					</section>
					<section class="wrapper style1 align-center">
						<div class="inner">
							<h2><font class="font_hi">강의평가</font>를  확인하여  수강신청하세요</h2>
							<p>실제 수강생들의 강의평가를 통해 미리 알고 가는 수업</p>
							<div class="items style1 medium onscroll-fade-in">
								<c:forEach var="MainpageLec" items="${MainpageLec}">
									<section>
										<a href="lecEvalDetail.do?lec_no=${MainpageLec.lec_no }&uni_no=${MainpageLec.uni_no}"
										class="content">
											<h3><c:if test="${MainpageLec.f > 0.0 && MainpageLec.f<=0.5}">
													<td colspan="2"><h2>
															<img src="resources/imgstar/star05.JPG" style="width: 150px;">${MainpageLec.f}</h2></td>
												</c:if> <c:if test="${MainpageLec.f > 0.5 && MainpageLec.f<=1.0}">
													<td colspan="2"><h2>
															<img src="resources/imgstar/star1.JPG" style="width: 150px;">${MainpageLec.f}</h2></td>
												</c:if> <c:if test="${MainpageLec.f > 1.0 && MainpageLec.f<=1.5}">
													<td colspan="2"><h2>
															<img src="resources/imgstar/star15.JPG" style="width: 150px;">${MainpageLec.f}</h2></td>
												</c:if> <c:if test="${MainpageLec.f > 1.5 && MainpageLec.f<=2.0}">
													<td colspan="2"><h2>
															<img src="resources/imgstar/star2.JPG" style="width: 150px;">${MainpageLec.f}</h2></td>
												</c:if> <c:if test="${MainpageLec.f > 2.0 && MainpageLec.f<=2.5}">
													<td colspan="2"><h2>
															<img src="resources/imgstar/star25.JPG" style="width: 150px;">${MainpageLec.f}</h2></td>
												</c:if> <c:if test="${MainpageLec.f > 2.5 && MainpageLec.f<=3.0}">
													<td colspan="2"><h2>
															<img src="resources/imgstar/star3.JPG" style="width: 150px;">${MainpageLec.f}</h2></td>
												</c:if> <c:if test="${MainpageLec.f > 3.0 && MainpageLec.f<=3.5}">
													<td colspan="2"><h2>
															<img src="resources/imgstar/star35.JPG" style="width: 150px;">${MainpageLec.f}</h2></td>
												</c:if> <c:if test="${MainpageLec.f > 3.5 && MainpageLec.f<=4.0}">
													<td colspan="2"><h2>
															<img src="resources/imgstar/star4.JPG" style="width: 150px;">${MainpageLec.f}</h2></td>
												</c:if> <c:if test="${MainpageLec.f > 4.0 && MainpageLec.f<=4.5}">
													<td colspan="2"><h2>
															<img src="resources/imgstar/star45.JPG" style="width: 150px;">${MainpageLec.f}</h2></td>
												</c:if> <c:if test="${MainpageLec.f > 4.5 && MainpageLec.f<=5.0}">
													<td colspan="2"><h2>
															<img src="resources/imgstar/star5.JPG" style="width: 150px;">${MainpageLec.f}</h2></td>
												</c:if></h3>
												<font class="font_un">${MainpageLec.uni_name} : ${MainpageLec.lec_name }</font> </br> ${MainpageLec.att_term }</br>(${MainpageLec.prof_name }교수님)
										</a>
									</section>
								</c:forEach>
							</div>
						</div>
					</section>
					
					<section class="wrapper style1 align-center">	
							<div class="inner">
								<h2><font class="font_hi">팀원</font>을 만들어보세요</h2>
								<p>서로 정보를 공유하며 공부하면 더 효율적일 수 있습니다</p>
								<div class="items style1 medium onscroll-fade-in">
									<c:forEach var="MainStudy" items="${MainStudy}">
										<section>
										<span class="icon style2 major fa-diamond"></span>
											<a href="study/StudyContent.do?study_no=${MainStudy.study_no }" class="content">
												<h3>(${MainStudy.study_type})${MainStudy.study_title}</h3>
											<span class="name"> ${fn:substring(MainStudy.study_cont,0,40)}... </span>
												<%-- [ 신 고 누 적 : ${MainStudy.study_warn} 회 ]  --%>
											</a>
										</section>
									</c:forEach>
								</div>
							</div>
						</section> 
			
			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script> 
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script> 
			

	</body>
</html>