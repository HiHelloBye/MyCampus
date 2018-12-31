<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/main_sub.css?ver=1" /> 
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
<title>Insert title here</title>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<style type="text/css"> 
a { text-decoration:none } 
</style> 


</head>
<body class="is-preload">
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

	<c:if test="${Scode == 'LectureEval'}">
		<section class="wrapper style1 align-center">
			<div class="inner">
				<div class="index align-left">
					<section>
						<header>
							<h3>수강 후기</h3>
							실제 수강생들의 생생한 후기!
						</header>
						<div class="content">
							<c:forEach var="searchA" items="${searchA }">
									<c:if test="${searchA.lec_score > 0.0 && searchA.lec_score<=0.5}">
										<h4><img src="resources/imgstar/star05.JPG" style="width:150px;">${searchA.lec_score}</h4>
									</c:if>
									<c:if test="${searchA.lec_score > 0.5 && searchA.lec_score<=1.0}">
										<h2><img src="resources/imgstar/star1.JPG" style="width:150px;">${searchA.lec_score}</h2>
									</c:if>
									<c:if test="${searchA.lec_score > 1.0 && searchA.lec_score<=1.5}">
										<h2><img src="resources/imgstar/star15.JPG" style="width:150px;">${searchA.lec_score}</h2>
									</c:if>
									<c:if test="${searchA.lec_score > 1.5 && searchA.lec_score<=2.0}">
										<h2><img src="resources/imgstar/star2.JPG" style="width:150px;">${searchA.lec_score}</h2>
									</c:if>
									<c:if test="${searchA.lec_score > 2.0 && searchA.lec_score<=2.5}">
										<h2><img src="resources/imgstar/star25.JPG" style="width:150px;">${searchA.lec_score}</h2>
									</c:if>
									<c:if test="${searchA.lec_score > 2.5 && searchA.lec_score<=3.0}">
										<h2><img src="resources/imgstar/star3.JPG" style="width:150px;">${searchA.lec_score}</h2>
									</c:if>
									<c:if test="${searchA.lec_score > 3.0 && searchA.lec_score<=3.5}">
										<h2><img src="resources/imgstar/star35.JPG" style="width:150px;">${searchA.lec_score}</h2>
									</c:if>
									<c:if test="${searchA.lec_score > 3.5 && searchA.lec_score<=4.0}">
										<h2><img src="resources/imgstar/star4.JPG" style="width:150px;">${searchA.lec_score}</h2>
									</c:if>
									<c:if test="${searchA.lec_score > 4.0 && searchA.lec_score<=4.5}">
										<h2><img src="resources/imgstar/star45.JPG" style="width:150px;">${searchA.lec_score}</h2>
									</c:if>
									<c:if test="${searchA.lec_score > 4.5 && searchA.lec_score<=5.0}">
										<h2><img src="resources/imgstar/star5.JPG" style="width:150px;">${searchA.lec_score}</h2>
									</c:if>
								<a href="lecEvalDetail.do?lec_no=${searchA.lec_no }&uni_no=${searchA.uni_no}">
								<br />
									<strong>수강 학기 : ${searchA.att_term }</strong>
								<br />		
									${searchA.lec_review }
							<hr />
								</a>
							</c:forEach>
						</div>
					</section>
				</div>	
				<c:if test="${pgsearch.startPage > pgsearch.pageBlock }">
					<a href="searchResult.do?keyword=${Skeyword}&code=${Scode }&currentPage=${pgsearch.startPage-pgsearch.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pgsearch.startPage }" end="${pgsearch.endPage }">
					<a href="searchResult.do?keyword=${Skeyword}&code=${Scode }&currentPage=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${pgsearch.endPage < pgsearch.totalPage }">
					<a href="searchResult.do?keyword=${Skeyword}&code=${Scode }&currentPage=${pgsearch.startPage+pgsearch.pageBlock}">[다음]</a>
				</c:if>
			</div>
		</section>
	</c:if>
	
	<c:if test="${Scode == 'Study'}">
		<section class="wrapper style1 align-center">
			<div class="inner">
				<div class="index align-left">
					<section>
						<header>
							<h3>스터디 모집</h3>
							같은 목표를 향해 함께 해보세요!! </br>
							클릭하여 보다 자세한 모집글을 확인하세요~
						</header>
						<div class="content">
							<c:forEach var="searchC" items="${searchC }">
								<a href="study/StudyContent.do?study_no=${searchC.study_no }">
									(${searchC.study_type}) ${searchC.study_title}
									</br></br>
									<span class="name" style="color:#675682;"> ${fn:substring(searchC.study_cont,0,50)}... </span>
							<hr/>
								</a>
							</c:forEach>
						</div>
					</section>
				</div>	
				<c:if test="${pgsearch.startPage > pgsearch.pageBlock }">
					<a href="searchResult.do?keyword=${Skeyword}&code=${Scode }&currentPage=${pgsearch.startPage-pgsearch.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pgsearch.startPage }" end="${pgsearch.endPage }">
					<a href="searchResult.do?keyword=${Skeyword}&code=${Scode }&currentPage=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${pgsearch.endPage < pgsearch.totalPage }">
					<a href="searchResult.do?keyword=${Skeyword}&code=${Scode }&currentPage=${pgsearch.startPage+pgsearch.pageBlock}">[다음]</a>
				</c:if>
			</div>
		</section>
	</c:if>


	<c:if test="${Scode == 'Book'}">
		<section class="wrapper style1 align-center">
			<div class="inner">
				<div class="index align-left">
					<section>
						<header>
							<h3>책 방</h3>
							저렴한 가격으로 교재를 구입해보세요~!</br>
							교재에 적혀있는 필기들은 덤~~
						</header>
						<div class="content">
							<c:forEach var="searchB" items="${searchB }">
								<table>
								<tr>
									<td>
										<img src="${searchB.book_photo1}" style="width:350px; height:350px;" alt="" />
									</td>
									<td style="vertical-align: top; ">
									<br />
										 <a href="bookDetail.do?book_no=${searchB.book_no }">
											<h3 style="float:left;">${searchB.book_name}</h3>
											<br /><br /> 
		                                    ${searchB.book_writer} | ${searchB.book_pub}<br />
		                                    ${searchB.uni_name } 재학생 <br />
		                                    ${searchB.book_met}<br />
		                                     <font class="font_line">실제 가격 : ${searchB.book_price} 원</font><br />
		                                    <font class="font_sell">판매 가격 : ${searchB.book_selling} 원</font>
										</a> 
									</td>
								</table>
									<hr />
							</c:forEach>
						</div>
					</section>
				</div>	
				<c:if test="${pgsearch.startPage > pgsearch.pageBlock }">
					<a href="searchResult.do?keyword=${Skeyword}&code=${Scode }&currentPage=${pgsearch.startPage-pgsearch.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pgsearch.startPage }" end="${pgsearch.endPage }">
					<a href="searchResult.do?keyword=${Skeyword}&code=${Scode }&currentPage=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${pgsearch.endPage < pgsearch.totalPage }">
					<a href="searchResult.do?keyword=${Skeyword}&code=${Scode }&currentPage=${pgsearch.startPage+pgsearch.pageBlock}">[다음]</a>
				</c:if>
			</div>
		</section>
	</c:if>

	
</body>
</html>