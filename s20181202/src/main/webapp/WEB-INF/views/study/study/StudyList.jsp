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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="../cssStudy/assets/css/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="../cssStudy/assets/js/jquery.min.js"></script>	
<script src="../cssStudy/assets/js/jquery.dropotron.min.js"></script>	
<script src="../cssStudy/assets/js/breakpoints.min.js"></script>			
<script src="../cssStudy/assets/js/browser.min.js"></script>			
<script src="../cssStudy/assets/js/util.js"></script>						
<script src="../cssStudy/assets/js/main.js"></script>
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
.list-group-item.active>.badge, .nav-pills>.active>a>.badge {
	color: #ed786a;
	background-color: #fff
}

.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover
	{
	color: #fff;
	background-color: #ed786a
}




</style>

<script type="text/javascript">
	$(function() {
		var availableTags = [];
		// alert('dddd');
		
		<c:forEach items="${boardStudyList}" var="study">

		availableTags.push("${study.study_title}");
		//alert('aaaa');
		</c:forEach>

		for (var index = 0; index < availableTags.length; index++) {
			//window.alert(index);
			//window.alert('availableTags[index]');
			//alert('availableTags'+availableTags);
		}

		$("#tags1").autocomplete({
			source : availableTags
		});
	});
</script>

<style>
</style>
</head>
<body>

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
									<li><a class="icon fa-cog" href="./study/StudyList.do"><span>스터디</span></a>
									<ul>
											<li><a href="./bookSellForm.do">책 판매</a></li>
										</ul>
										</li>
									<c:if test="${sessionScope.member_grade eq  0}">
										<li><a class="icon fa-retweet" href="./admin/admin"><span>관리자 페이지</span></a></li>
									<li><a class="icon fa-sitemap" href="member/logout.do"><span>로그아웃</span></a></li>
									</c:if>
									<c:if test="${sessionScope.member_grade eq 1}" >
										<li><a class="icon fa-retweet" href="member/view.do"><span>회원 페이지</span></a></li>
										<li><a class="icon fa-sitemap" href="member/logout.do"><span>로그아웃</span></a></li>
									</c:if>
								</ul>
							</nav>

					</div>
				</section>
			</div>

	<!-- 리스트 메뉴 -->
	<section id="main">
		<div>			
			<div class="container">
			<div class="row">
					<div class="ui-widget">
						<form action="EdyStudySearch.do">
							<a href="StudyWriteForm.do" class="button icon fa-file">글쓰기</a> <strong>검색:</strong>&nbsp;<input
								id="tags1" name="keywordStudy">&nbsp;&nbsp;<input
								type="submit" value="검색">&nbsp;
						</form>
					</div>
					<br>
				<div id="content" class="col-8 col-12-medium">
				<ul class="nav nav-pills">
					<li class="active"><a data-toggle="pill" href="#lang">어학</a></li>
					<li><a data-toggle="pill" href="#eng">영어</a></li>
					<li><a data-toggle="pill" href="#jap">일본어</a></li>
					<li><a data-toggle="pill" href="#chi">중국어</a></li>
					<li><a data-toggle="pill" href="#etc1">기타</a></li>
				</ul>

				<!-- 어학전체 -->
				<div class="tab-content">
					<div id="lang" class="tab-pane fade in active">
						<c:set var="num" value="${sp2.langTotal-sp2.startLang+1 }"></c:set>
						<table>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>닉네임</th>
								<th>신고</th>
							</tr>
							<c:forEach var="study" items="${boardLangStudyList }">
								<c:if test="${study.study_state==0}">
									<tr>
										<td>${num }</td>
										<td><a href="StudyContent.do?study_no=${study.study_no }">${study.study_title }&nbsp;<c:if
													test="${study.reply!=0 }">[${study.reply }]</c:if>
												<c:if test="${study.reply==0 }"></c:if></a></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>

							<c:forEach var="study" items="${boardLangStudyList }">
								<c:if test="${study.study_state==2}">
									<tr>
										<td>${num }</td>
										<td style="text-decoration: line-through;">${study.study_title }&nbsp;<c:if
												test="${study.reply!=0 }">[${study.reply }]</c:if>
											<c:if test="${study.reply==0 }"></c:if></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>

						</table>
					</div>

					<div id="jap" class="tab-pane fade">
						<c:set var="num" value="${sp4.japTotal-sp4.startJap+1 }"></c:set>
						<table>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>닉네임</th>
								<th>신고</th>
							</tr>
							<c:forEach var="study" items="${boardJapStudyList }">
								<c:if test="${study.study_state==0}">
									<tr>
										<td>${num }</td>
										<td><a href="StudyContent.do?study_no=${study.study_no }">${study.study_title }&nbsp;<c:if
													test="${study.reply!=0 }">[${study.reply }]</c:if>
												<c:if test="${study.reply==0 }"></c:if></a></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>

							<c:forEach var="study" items="${boardJapStudyList }">
								<c:if test="${study.study_state==2}">
									<tr>
										<td>${num }</td>
										<td style="text-decoration: line-through;">${study.study_title }&nbsp;<c:if
												test="${study.reply!=0 }">[${study.reply }]</c:if>
											<c:if test="${study.reply==0 }"></c:if></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>

						</table>
					</div>

					<div id="eng" class="tab-pane fade">
						<c:set var="num" value="${sp3.engTotal-sp3.startEng+1 }"></c:set>
						<table>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>닉네임</th>
								<th>신고</th>
							</tr>
							<c:forEach var="study" items="${boardEngStudyList }">
								<c:if test="${study.study_state==0}">
									<tr>
										<td>${num }</td>
										<td><a href="StudyContent.do?study_no=${study.study_no }">${study.study_title }&nbsp;<c:if
													test="${study.reply!=0 }">[${study.reply }]</c:if>
												<c:if test="${study.reply==0 }"></c:if></a></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>

							<c:forEach var="study" items="${boardEngStudyList }">
								<c:if test="${study.study_state==2}">
									<tr>
										<td>${num }</td>
										<td style="text-decoration: line-through;">${study.study_title }&nbsp;<c:if
												test="${study.reply!=0 }">[${study.reply }]</c:if>
											<c:if test="${study.reply==0 }"></c:if></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>

						</table>
					</div>
					<div id="chi" class="tab-pane fade">
						<c:set var="num" value="${sp7.chiTotal-sp7.startChi+1 }"></c:set>
						<table>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>닉네임</th>
								<th>신고</th>
							</tr>
							<c:forEach var="study" items="${boardChiStudyList }">
								<c:if test="${study.study_state==0}">
									<tr>
										<td>${num }</td>
										<td><a href="StudyContent.do?study_no=${study.study_no }">${study.study_title }&nbsp;<c:if
													test="${study.reply!=0 }">[${study.reply }]</c:if>
												<c:if test="${study.reply==0 }"></c:if></a></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>

							<c:forEach var="study" items="${boardChiStudyList }">
								<c:if test="${study.study_state==2}">
									<tr>
										<td>${num }</td>
										<td style="text-decoration: line-through;">${study.study_title }&nbsp;<c:if
												test="${study.reply!=0 }">[${study.reply }]</c:if>
											<c:if test="${study.reply==0 }"></c:if></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>

						</table>
					</div>

					<div id="etc1" class="tab-pane fade">
						<c:set var="num" value="${sp5.etc1Total-sp5.startEtc1+1 }"></c:set>
						<table>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>닉네임</th>
								<th>신고</th>
							</tr>
							<c:forEach var="study" items="${boardEtc1StudyList }">
								<c:if test="${study.study_state==0}">
									<tr>
										<td>${num }</td>
										<td><a href="StudyContent.do?study_no=${study.study_no }">${study.study_title }&nbsp;<c:if
													test="${study.reply!=0 }">[${study.reply }]</c:if>
												<c:if test="${study.reply==0 }"></c:if></a></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>

							<c:forEach var="study" items="${boardEtc1StudyList }">
								<c:if test="${study.study_state==2}">
									<tr>
										<td>${num }</td>
										<td style="text-decoration: line-through;">${study.study_title }&nbsp;<c:if
												test="${study.reply!=0 }">[${study.reply }]</c:if>
											<c:if test="${study.reply==0 }"></c:if></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>

						</table>
					</div>
				</div>
				</div>
			<div id="sidebar" class="col-4 col-12-medium">
				<h2>최근 본 글 목록</h2>
				<%
					//쿠키 얻어오기
					Cookie[] cook = request.getCookies();
					if (cook != null) {
						for (int i = 0; i < cook.length; i++) {
							//전송된 쿠키이름 얻어오기
							String name = cook[i].getName();
							//쿠키 이름에 item이 포함되어 있다면
							if (name.indexOf("item") != -1) {
								//해당 value 얻어오기
								String value = cook[i].getValue();
								//euc-kr 로 인코딩 되어 있으므로 다시 euc-kr 로 디코딩 하여야 한다.
								String item = URLDecoder.decode(value, "utf-8");
								//out.println(cook[i].getName()+"<br/>");
								//out.println("<a id='"+cook[i].getValue()+"'href='StudyContent.do?study_no="+cook[i].getValue()+"'>"+URLDecoder.decode(cook[i].getName(),"utf-8")+"</a><br/>");
								out.println("<a id='" + cook[i].getValue() + "'href='StudyContent.do?study_no="
										+ cook[i].getValue() + "'>" + URLDecoder.decode(cook[i].getName(), "utf-8").substring(4)
										+ "</a></header><br/>");
							}
						}
					} else {
						out.println("최근에 본 상품이 없습니다.");
					}
				%>				
				</div>


		<div id="content" class="col-8 col-12-medium">
			<div class="container">
				<div class="tab-content">
					<ul class="nav nav-pills">
						<li class="active"><a data-toggle="pill" href="#job">취업</a></li>
						<li><a data-toggle="pill" href="#tes">인적성</a></li>
						<li><a data-toggle="pill" href="#int">면접</a></li>
						<li><a data-toggle="pill" href="#etc">기타</a></li>
					</ul>
					<!-- 취업전체 -->
					<div id="job" class="tab-pane fade in active">
						<c:set var="num" value="${sp1.jobTotal-sp1.startJob+1 }"></c:set>
						<table>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>닉네임</th>
								<th>신고</th>
							</tr>
							<c:forEach var="study" items="${boardJobStudyList }">
								<c:if test="${study.study_state==0}">
									<tr>
										<td>${num }</td>
										<td><a href="StudyContent.do?study_no=${study.study_no }">${study.study_title }&nbsp;<c:if
													test="${study.reply!=0 }">[${study.reply }]</c:if>
												<c:if test="${study.reply==0 }"></c:if></a></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>



							<c:forEach var="study" items="${boardJobStudyList }">
								<c:if test="${study.study_state==2}">
									<tr>
										<td>${num }</td>
										<td style="text-decoration: line-through;">${study.study_title }&nbsp;<c:if
												test="${study.reply!=0 }">[${study.reply }]</c:if>
											<c:if test="${study.reply==0 }"></c:if></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>
						</table>
					</div>



					<!--   인적성 -->
					<div id="tes" class="tab-pane fade">
						<c:set var="num" value="${sp8.tesTotal-sp8.startTes+1 }"></c:set>
						<table>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>닉네임</th>
								<th>신고</th>
							</tr>
							<c:forEach var="study" items="${boardTesStudyList }">
								<c:if test="${study.study_state==0}">
									<tr>
										<td>${num }</td>
										<td><a href="StudyContent.do?study_no=${study.study_no }">${study.study_title }&nbsp;<c:if
													test="${study.reply!=0 }">[${study.reply }]</c:if>
												<c:if test="${study.reply==0 }"></c:if></a></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>



							<c:forEach var="study" items="${boardTesStudyList }">
								<c:if test="${study.study_state==2}">
									<tr>
										<td>${num }</td>
										<td style="text-decoration: line-through;">${study.study_title }&nbsp;<c:if
												test="${study.reply!=0 }">[${study.reply }]</c:if>
											<c:if test="${study.reply==0 }"></c:if></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>
						</table>
					</div>

					<!-- 면접 -->
					<div id="int" class="tab-pane fade">
						<c:set var="num" value="${sp9.intTotal-sp9.startInt+1 }"></c:set>
						<table>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>닉네임</th>
								<th>신고</th>
							</tr>
							<c:forEach var="study" items="${boardIntStudyList }">
								<c:if test="${study.study_state==0}">
									<tr>
										<td>${num }</td>
										<td><a href="StudyContent.do?study_no=${study.study_no }">${study.study_title }&nbsp;<c:if
													test="${study.reply!=0 }">[${study.reply }]</c:if>
												<c:if test="${study.reply==0 }"></c:if></a></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>



							<c:forEach var="study" items="${boardIntStudyList }">
								<c:if test="${study.study_state==2}">
									<tr>
										<td>${num }</td>
										<td style="text-decoration: line-through;">${study.study_title }&nbsp;<c:if
												test="${study.reply!=0 }">[${study.reply }]</c:if>
											<c:if test="${study.reply==0 }"></c:if></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>
						</table>
					</div>



					<!-- 기타 -->
					<div id="etc" class="tab-pane fade">
						<c:set var="num" value="${sp6.etcTotal-sp6.startEtc+1 }"></c:set>
						<table>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>닉네임</th>
								<th>신고</th>
							</tr>
							<c:forEach var="study" items="${boardEtcStudyList }">
								<c:if test="${study.study_state==0}">
									<tr>
										<td>${num }</td>
										<td><a href="StudyContent.do?study_no=${study.study_no }">${study.study_title }&nbsp;<c:if
													test="${study.reply!=0 }">[${study.reply }]</c:if>
												<c:if test="${study.reply==0 }"></c:if></a></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>


							<c:forEach var="study" items="${boardEtcStudyList }">
								<c:if test="${study.study_state==2}">
									<tr>
										<td>${num }</td>
										<td style="text-decoration: line-through;">${study.study_title }&nbsp;<c:if
												test="${study.reply!=0 }">[${study.reply }]</c:if>
											<c:if test="${study.reply==0 }"></c:if></td>
										<td>${study.study_writer }</td>
										<td>${study.study_warn}</td>
									</tr>
									<c:set var="num" value="${num-1 }"></c:set>
								</c:if>
							</c:forEach>


						</table>

					</div>
				</div>
			</div>
		</div>

			</div>
			</div>
		</div>
	</section>
	<%--  ${cookie.item1.value } --%>
</body>
</html>