<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>내가 쓴 책방 등록 글</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../cssEval/assets/css/main.css?ver=1" />
	<style>
		td {
			vertical-align: middle;
		}
	</style>
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
										<li><a class="icon fa-sign-out" href="member/logout.do"><span>로그아웃</span></a></li>
									</c:if>
								</ul>
							</nav>
					</div>
				</section>
			</div>
	<c:set var="num" value="${pg.bookTotal-pg.start+1 }"></c:set>
	<!-- Banner -->
	<section id="banner">
		<div class="container">			
		</div>
	</section>
	<!-- Features -->
	<section id="features">
		<div class="container">
			<div class="row aln-center" style="width: 80%; margin: auto;">
					<table>
						<c:forEach var="member" items="${bookBoardList }">
						<tr>
							<td style="padding-top:60px;" width="200" height="70" style="table-layout:fixed">
                              <c:if test="${member.book_photo1 ne null }">
                                <a class="image featured">
                                  <img src=../${member.book_photo1} alt=" " style="max-height: 150px;">
                                </a>       
                               </c:if>
                            </td>
							<td><a>
                               <h3>${member.book_name}</h3>
								${member.book_cont }<br />
								<c:choose>
									<c:when test="${member.book_met =='10'}">
										택배 : 가능 <br />
									</c:when>
									<c:when test="${member.book_met =='01'}">
										직거래 : 가능<br />
									</c:when>
									<c:when test="${member.book_met =='11'}">
										택배 : 가능  | 직거래 : 가능<br />
									</c:when>
								</c:choose>
								<c:if test="${member.book_state ==1}">
									판매완료<br />
								</c:if>
								<c:if test="${member.book_state ==0}">
									판매중<br />
								</c:if>
                           </a> </td>
						</tr>
						<c:set var="num" value="${num+1 }"></c:set>
						</c:forEach>
					</table>	
				<c:if test="${bookTotal == 0 }">
					<td colspan=7>책방 등록 데이터가 존재하지 않습니다.</td>
				</c:if>
			</div>
		</div>
	</section>	
	
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="bookBoardList.do?currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="bookBoardList.do?currentPage=${i }">[${i }]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="bookBoardList.do?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if>
<!-- Scripts -->
			<script src="../cssEval/assets/js/jquery.min.js"></script>
			<script src="../cssEval/assets/js/jquery.dropotron.min.js"></script>
			<script src="../cssEval/assets/js/browser.min.js"></script>
			<script src="../cssEval/assets/js/breakpoints.min.js"></script>
			<script src="../cssEval/assets/js/util.js"></script>
			<script src="../cssEval/assets/js/main.js"></script>
</body>
</html>