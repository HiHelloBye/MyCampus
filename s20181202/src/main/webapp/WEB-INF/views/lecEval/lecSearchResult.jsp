<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> 
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>강의평가 검색</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="cssEval/assets/css/main.css?ver=2" />
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">

			<!-- Header -->
				<section id="header">
					<div class="container">

						<!-- Logo -->
							<h1 id="logo"><a href="Mainpage.do">마이캠퍼스</a></h1>
							<p>A responsive HTML5 site template. Manufactured by HTML5 UP.</p>

					<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a class="icon fa-home" href="./lectureEvalMain.do"><span>강의평가</span></a></li>
									<li><a href="./booksellList.do" class="icon fa-bar-chart-o"><span>책방</span></a>
										<ul>
											<li><a href="./bookSellForm.do">책 판매</a></li>
										</ul>
									</li>
									<li><a class="icon fa-cog" href="./study/StudyList.do"><span>스터디</span></a></li>
									<c:if test="${sessionScope.member_grade eq  0}">
										<li><a class="icon fa-retweet" href="./nlist.do"><span>관리자 페이지</span></a></li>
									<li><a class="icon fa-sitemap" href="member/logout.do"><span>로그아웃</span></a></li>
									</c:if>
									<c:if test="${sessionScope.member_grade eq 1}" >
										<li><a class="icon fa-retweet" href="member/view.do"><span>마이페이지</span></a>
											<ul>
												<li><a href="member/msgsend.do">나의 쪽지함</a></li>
												<li><a href="member/myPage.do">회원정보수정</a></li>
												<li><a href="member/profileForm.do">프로필사진수정</a></li>
												<li><a href="member/lectureBoardList.do">나의 강의평</a></li>
												<li><a href="member/bookBoardList.do">나의 책방</a></li>
												<li><a href="member/studyBoardList.do">나의 스터디</a></li>
											</ul>
										</li>
										<li><a class="icon fa-sitemap" href="member/logout.do"><span>로그아웃</span></a></li>
									</c:if>
								</ul>
							</nav>

					</div>
				</section>
			</div>
			<!-- Banner -->
			<section id="banner">
				<div class="container">
					<form action="lectureSearchResult.do" method="get">
						<input type="text" placeholder="강의명 또는 교수명 입력" name="search" style="float: left; width: 90%; padding:10px;">
						<input type="submit" value="검색" >
					</form>
				</div>
			</section>
	<!-- Features -->
				<section id="features">
					<div class="container">
						<header>
							<!-- <form action="lectureSearchResult.do" method="get">
							<!-- <div class="row gtr-50">
									<div class="col-6 col-12-small">
										<input type="text" placeholder="강의명 또는 교수명 입력" name="search" style="width:1000px;">
									</div>	
									<div class="col-6 col-12-small">
										<input type="submit" value="검색" >
									</div>
								</div> -->
								
							
								
									
							
						</header>
						<div class="row aln-center">
							<!-- 전체 강의평가 -->
								<input type="hidden" value="<%=member_email %>" readonly> 
								<input type="hidden" value="<%=member_no %>" readonly> 
							
								<c:set var="num" value="${pgeval.total-pgeval.start+1}"></c:set>
							
									<c:forEach var="searchList" items="${searchList }">	
									<div style="width:1200px;" onclick="location.href='lecEvalDetail.do?lec_no=${searchList.lec_no}&uni_no=${searchList.uni_no} '">
									<h3 style="text-align:left;">${searchList.lec_name } : ${searchList.prof_name }</h3>
									
										<p style="text-align:left;">
												<c:if test="${searchList.lec_score > 0.0 && searchList.lec_score<=0.5}">
													<img src="resources/imgstar/star05.JPG" style="width:150px;">
												</c:if>
												<c:if test="${searchList.lec_score > 0.5 && searchList.lec_score<=1.0}">
													<img src="resources/imgstar/star1.JPG" style="width:150px;">
												</c:if>
												
												<c:if test="${searchList.lec_score > 1.0 && searchList.lec_score<=1.5}">
													<img src="resources/imgstar/star15.JPG" style="width:150px;">
												</c:if>
												<c:if test="${searchList.lec_score > 1.5 && searchList.lec_score<=2.0}">
													<img src="resources/imgstar/star2.JPG" style="width:150px;">
												</c:if>
												
												<c:if test="${searchList.lec_score > 2.0 && searchList.lec_score<=2.5}">
													<img src="resources/imgstar/star25.JPG" style="width:150px;">
												</c:if>
												<c:if test="${searchList.lec_score > 2.5 && searchList.lec_score<=3.0}">
													<img src="resources/imgstar/star3.JPG" style="width:150px;">
												</c:if>
												
												<c:if test="${searchList.lec_score > 3.0 && searchList.lec_score<=3.5}">
													<img src="resources/imgstar/star35.JPG" style="width:150px;">
												</c:if>
												<c:if test="${searchList.lec_score > 3.5 && searchList.lec_score<=4.0}">
													<img src="resources/imgstar/star4.JPG" style="width:150px;">
												</c:if>
												
												<c:if test="${searchList.lec_score > 4.0 && searchList.lec_score<=4.5}">
													<img src="resources/imgstar/star45.JPG" style="width:150px;">
												</c:if>
												<c:if test="${searchList.lec_score > 4.5 && searchList.lec_score<=5.0}">
													<img src="resources/imgstar/star5.JPG" style="width:150px;">
												</c:if>
											</p>
											
											<%-- <p style="text-align:left;">${searchList.att_term }</p>
											<p style="text-align:left;">${searchList.lec_review }</p> --%>
										</div>
										<c:set var="num" value="${num - 1 }"></c:set>
										<hr />
									</c:forEach>
								
							
								<c:if test="${pgsearch.startPage > pgsearch.pageBlock }">
									<a href="lectureSearchResult.do?search=${search}&currentPage=${pgsearch.startPage-pgsearch.pageBlock}">[이전]</a>
								</c:if>
								<c:forEach var="i" begin="${pgsearch.startPage }" end="${pgsearch.endPage }">
									<a href="lectureSearchResult.do?search=${search}&currentPage=${i}">[${i}]</a>
								</c:forEach>
								<c:if test="${pgsearch.endPage < pgsearch.totalPage }">
									<a href="lectureSearchResult.do?search=${search}&currentPage=${pgsearch.startPage+pgsearch.pageBlock}">[다음]</a>
								</c:if>
								
						</div>
					</div>
				</section>
	
	<!-- Scripts -->
			<script src="cssEval/assets/js/jquery.min.js"></script>
			<script src="cssEval/assets/js/jquery.dropotron.min.js"></script>
			<script src="cssEval/assets/js/browser.min.js"></script>
			<script src="cssEval/assets/js/breakpoints.min.js"></script>
			<script src="cssEval/assets/js/util.js"></script>
			<script src="cssEval/assets/js/main.js"></script>
</body>
</html>