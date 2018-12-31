<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>내가 쓴 스터디 게시판 글</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../cssEval/assets/css/main.css?ver=1" />
</head>
<body class="homepage is-preload">
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
							<li><a class="icon fa-sign-out" href="member/logout.do"><span>로그아웃</span></a></li>
						</c:if>
						<c:if test="${sessionScope.member_grade eq 1}" >
							<li><a class="icon fa-home" href="member/view.do"><span>마이페이지</span></a>
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
	<!-- Banner -->
	<section id="banner">
		<div class="container">			
		</div>
	</section>
	<!-- Features -->
	<section id="features">
		<div class="container">
			<div class="row aln-center">
				<div>
					<c:forEach var="member" items="${studyBoardList }">
					<div onclick="location.href='../study/StudyContent.do?study_no=${member.study_no }'">
					<a>
						<h3 style="text-align:left;">${member.study_type }</h3>
						<p style="text-align:left;">제목 : ${member.study_title }</p>
						<p style="text-align:left;">작성자 : ${member.study_writer }</p>
						<p style="text-align:left;">내용 : ${member.study_cont }</p>
					</a>
					</div>
					<c:set var="num" value="${num+1 }"></c:set>
					<hr />
					</c:forEach>
				</div>
				<c:if test="${studyTotal == 0 }">
					<p>스터디 데이터가 존재하지 않습니다.</p>
				</c:if>
			</div>
		</div>
	</section>
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="studyBoardList.do?currentBoardPage=${pg.startPage - pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="studyBoardList.do?currentBoardPage=${i }">[${i }]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="studyBoardList.do?currentBoardPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if>
	<%-- <c:set var="num" value="${pg.studyTotal-pg.start+1 }"></c:set>
	<table>
		<tr>
			<th>번호</th>
			<th>스터디 번호</th>
			<th>닉네임</th>
			<th>스터디 종류</th>
			<th>스터디 제목</th>
			<th>스터디 작성자</th>
			<th>조회</th>
			
		</tr>
		<c:forEach var="member" items="${studyBoardList }">
			<tr>
				<td>${num }</td>
				<td>${member.study_no }</td>
				<td>${member.member_nick }</td>
				<td>${member.study_type }</td>
				<td>${member.study_title }</td>
				<td>${member.study_writer }</td>
				<td>${member.study_cont }</td>
				<td><a href="../StudyContent.do?study_no=${member.study_no }">조회</a></td>
				
			</tr>
			<c:set var="num" value="${num+1 }"></c:set>
		</c:forEach>
		<c:if test="${studyTotal == 0 }">
			<tr>
				<td colspan=7>스터디 게시판 데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
	</table>
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="studyBoardList.do?currentBoardPage=${pg.startPage - pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="studyBoardList.do?currentBoardPage=${i }">[${i }]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="studyBoardList.do?currentBoardPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if> --%>
	<!-- Scripts -->
			<script src="../cssEval/assets/js/jquery.min.js"></script>
			<script src="../cssEval/assets/js/jquery.dropotron.min.js"></script>
			<script src="../cssEval/assets/js/browser.min.js"></script>
			<script src="../cssEval/assets/js/breakpoints.min.js"></script>
			<script src="../cssEval/assets/js/util.js"></script>
			<script src="../cssEval/assets/js/main.js"></script>
</body>
</html>