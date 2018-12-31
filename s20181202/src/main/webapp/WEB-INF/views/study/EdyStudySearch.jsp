<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%
	int member_no = (Integer) session.getAttribute("member_no");
	int member_grade = (Integer) session.getAttribute("member_grade");
	String member_nick = (String) session.getAttribute("member_nick");
	System.out.println("member_no_cont->" + member_no);
	System.out.println("member_nick_cont->" + member_nick);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="../cssStudy/assets/css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	var availableTags1 = [];
	//alert('dddd');
	
	<c:forEach items="${edyStudyList}" var="study">

	availableTags1.push("${study.study_title}");
	//alert('aaaa');
	</c:forEach>

	for (var index = 0; index < availableTags1.length; index++) {
		//window.alert(index);
		//window.alert('availableTags1[index]');
		//alert('availableTags1'+availableTags1);
	}

	$("#tags1").autocomplete({
		source : availableTags1
	});
});
</script>
<style>
/* Banner */
#banner {
	padding: 5em 0;
}

#banner>.container {
	padding: 0;
}

#banner>.container:before, #banner>.container:after {
	display: none;
}

#banner p {
	font-size: 1.25em;
}
#header .container{
	margin-top:0;
	padding: 11em 0 5.5em 0;
}
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">

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
									<li><a href="../booksellList.do" class="icon fa-bar-chart-o"><span>책방</span></a>
										<ul>
											<li><a href="../bookSellForm.do">책 판매</a></li>
										</ul>
									</li>
									<li><a class="icon fa-laptop" href="./StudyList.do"><span>스터디</span></a></li>
									<c:if test="${sessionScope.member_grade eq  0}">
										<li><a class="icon fa-home" href="../nlist.do"><span>관리자 페이지</span></a></li>
									<li><a class="icon fa-sign-out" href="../member/logout.do"><span>로그아웃</span></a></li>
									</c:if>
									<c:if test="${sessionScope.member_grade eq 1}" >
										<li><a class="icon fa-home" href="../member/view.do"><span>마이페이지</span></a>
											<ul>
												<li><a href="../member/msgsend.do">나의 쪽지함</a></li>
												<li><a href="../member/myPage.do">회원정보수정</a></li>
												<li><a href="../member/profileForm.do">프로필사진수정</a></li>
												<li><a href="../member/lectureBoardList.do">나의 강의평</a></li>
												<li><a href="../member/bookBoardList.do">나의 책방</a></li>
												<li><a href="../member/studyBoardList.do">나의 스터디</a></li>
											</ul>
										</li>
										<li><a class="icon fa-sign-out" href="../member/logout.do"><span>로그아웃</span></a></li>
									</c:if>
								</ul>
							</nav>

					</div>
				</section>
			</div>

		<section id="banner">
            <div class="container"> 
					<div class="ui-widget">
						<form action="EdyStudySearch.do">
							<input id="tags1" name="keywordStudy"required minlength="1"> <input type="submit" value="검색">
						</form>
					</div>
				</div>
			</section>

	<section id="main">
		<div>
			<div class="container">
				<div class="row">
				<div id="content" class="col-8 col-12-medium">
					<c:if test="${sp.studyTotal>0}">	
						<div id="eng" class="tab-pane fade">
							<c:set var="num" value="${sp.studyTotal-sp.start+1 }"></c:set>
							<table>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>닉네임</th>									
								</tr>
								<c:forEach var="study" items="${edySearchStudyList }">
									<c:if test="${study.study_state==0}">
										<tr>
											<td>${num }</td>
											<td><a
												href="StudyContent.do?study_no=${study.study_no }">${study.study_title }&nbsp;<c:if
														test="${study.reply!=0 }">[${study.reply }]</c:if> <c:if
														test="${study.reply==0 }"></c:if></a></td>
											<td>${study.study_writer }</td>											
										</tr>
										<c:set var="num" value="${num-1 }"></c:set>
									</c:if>
								</c:forEach>

								<c:forEach var="study" items="${edySearchStudyList }">
									<c:if test="${study.study_state==2}">
										<tr>
											<td>${num }</td>
											<td style="text-decoration: line-through;">${study.study_title }&nbsp;<c:if
													test="${study.reply!=0 }">[${study.reply }]</c:if> <c:if
													test="${study.reply==0 }"></c:if></td>
											<td>${study.study_writer }</td>
											<td>${study.study_warn}</td>
										</tr>
										<c:set var="num" value="${num-1 }"></c:set>
									</c:if>
								</c:forEach>

							</table>
						</div>
						</c:if>
						<c:if test="${sp.studyTotal<1 }">
							<p>"${study.keywordStudy }"에 대한 검색결과가 없습니다.</p>
						</c:if>						
					</div>
				</div>
				<c:if test="${sp.startPage > sp.pageBlock }">
					<a href="EdyStudySearch.do?currentBoardPage=${sp.startPage - sp.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${sp.startPage }" end="${sp.endPage }">
					<a href="EdyStudySearch.do?currentBoardPage=${i }&keywordStudy=${study.keywordStudy}">[${i }]</a>
				</c:forEach>
				<c:if test="${sp.endPage < sp.totalPage }">
					<a href="EdyStudySearch.do?currentBoardPage=${sp.startPage + sp.pageBlock}">[다음]</a>
				</c:if>
			</div>
		</div>
	</section>
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script src="../cssStudy/assets/js/jquery.min.js"></script>
	<script src="../cssStudy/assets/js/jquery.dropotron.min.js"></script>	
	<script src="../cssStudy/assets/js/breakpoints.min.js"></script>			
	<script src="../cssStudy/assets/js/browser.min.js"></script>
	<script src="../cssStudy/assets/js/util.js"></script>	
	<script src="../cssStudy/assets/js/main.js"></script>
				
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>			
</body>
</html>