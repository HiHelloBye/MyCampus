<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ include file="../header.jsp"%> 
<%@ include file="bookHeader.jsp"%> 
<% 
	ArrayList<Integer> notes = (ArrayList)request.getAttribute("note_st"); 
	ArrayList<Integer> damages = (ArrayList)request.getAttribute("damage_st"); 
	ArrayList<Integer> mets = (ArrayList)request.getAttribute("met_st"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>책방</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script type="text/javascript"> </script>
<script src="http://code.jquery.com/jquery-latest.min.js"> </script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/bookcss/book_sub_css/assets/css/main.css?ver=3" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<style>
h4{
	color: #67AECA;
	font-weight: 600;
	font-family: "NanumSquare";
}
.checked {
	color: #E52A6F;
}
.font_selled {
	font-size:x-large;
    font-weight: 800;
    color:#E52A6F;  
}
.font_line { 
	font-size:medium;
	text-decoration:line-through 
}
.font_sell{
    font-size:x-large;
    font-weight: 800;
    color:#E52A6F;  
}
a {
    border-bottom: none;
}
</style>

<script>

$(document).ready(function() {
   
	var n1 = new Array();
	<c:forEach items="${note_st}" var="item">
		n1.push(${item});
	</c:forEach>

	var d1 = new Array()
	<c:forEach items="${damage_st}" var="item">
		d1.push(${item});
	</c:forEach>
	
	var m1 = new Array()
	<c:forEach items="${met_st}" var="item">
		m1.push(${item});
	</c:forEach>
	
	//밑줄 필기 둘 다 없음
	if(<%=notes.get(0)%> == 1) {
		$('#n1'+0).addClass('checked');
		$('#n2'+0).addClass('checked');
	} else if(<%=notes.get(5)%> == 1) {
		$('#n1'+0).addClass('checked');
	} else if(<%=notes.get(6)%> == 1) {
		$('#n2'+0).addClass('checked');
	}

	for(var n=1; n<=2; n++) {
		if(n1[n] == 1) {
			$('#n1'+n).addClass('checked');
		}
		if(n1[n+2] == 1) {
			$('#n2'+n).addClass('checked');
		}
	}

	$('#update_selling').click(function(event){
		event.preventDefault();
		$('#myModal').modal('show');
	});

	if(d1[0]==1) {
		$('#d1'+0).removeClass('checked');
		$('#d1'+1).addClass('checked');
	}
	if(d1[1]==1) {
		$('#d2'+0).removeClass('checked');
		$('#d2'+1).addClass('checked');
	}
	if(d1[2]==1) {
		$('#d3'+0).removeClass('checked');
		$('#d3'+1).addClass('checked');
	}
	if(d1[3]==1) {
		$('#d4'+0).removeClass('checked');
		$('#d4'+1).addClass('checked');
	}
	
	if(m1[0] == 1) {
		$('#m1'+0).addClass('checked');
		$('#m1'+1).removeClass('checked');
			
	}
	if(m1[1] == 1) {
		$('#m2'+0).addClass('checked');
		$('#m2'+1).removeClass('checked');	
	}	
});
</script>
</head>
<body>
	<div id="page-wrapper">
		<!-- Header -->
				<section id="header">
					<div class="container">

						<!-- Logo -->
							<h1 id="logo"><a href="Mainpage.do">마이캠퍼스</a></h1>

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
		<section id="features">
			<div class="container" >
				<div class="row aln-center" style="width: 80%;margin: auto;text-align:left;">
					<article>	
						<!-- 책 기본정보 -->
						<div class="box">
							<h1>${book.book_name}</h1>
								<dl>
									<dt>저자</dt>
										<dd>${book.book_writer}</dd>
									<br />
									<dt>출판사</dt>
										<dd>${book.book_pub}</dd>
									<br />
									<dt>출판일</dt>
										<dd>${book.book_date}</dd>
									<br />
									</dl>
									<p class="price" style="text-align: left">
										<font class="font_sell"><span>${book.book_selling}  </span></font>
										<font class="font_line"><span>${book.book_price}</span></font>
									</p>
									<p style="font-size:large; text-align: center">
										<span>${book.book_cont}</span>
									</p>
								</div>
								<!-- 쪽지보내기/수정 -->
								<div class="col-6 col-12-medium">
									<c:choose>
										<c:when test="${book.book_cont ne null} && ${book.book_state != 1 }">
											<p>${book.book_cont}</p>
										</c:when>
										<c:when test="${book.book_state == 1 }">
											<br />
											<font class="font_selled"><p>이 책은 판매가 완료되었습니다.</p></font>
										</c:when>
									</c:choose>
									<br />
									<c:if test="${book.book_state != 1}">
										<p>
											<div class="box">
												<c:if test="${book.book_state != 1 }">
													<c:if test="${sessionScope.member_no ne book.member_no }">
														<a id="sendMsg">
															<img style="width:25px;" src="resources/bs/bs_mail.png">
															<span>판매자에게 쪽지 보내기</span>
														</a>
													</c:if>
													<c:if test="${sessionScope.member_no eq book.member_no }">
														<a id="updateBookState">
															<img style="width: 25;" src="resources/bs/bs_check.png">
															<span>판매 완료하기</span>
														</a>
														<a id="updateSelling">
															<img style="width: 25;" src="resources/bs/bs_money2.png">
															<span>가격수정</span>		
														</a>
														<a id="updateCont">
															<img style="width: 25;" src="resources/bs/bs_write2.png">
															<span>설명 수정</span>
														</a>
													</c:if>
												</c:if>
											</div>
										</p>
									</c:if>	
								</div>
								<br /><br />
								<!-- 책 상태 -->
								<div class="box">
									<div name="book_note" id="book_note">
										<h4>책 상태</h4>
										<dl>    
											<dt>밑줄 흔적</dt>  
											<dd>
												<ul class="alt">
													<li id="n10">없음</li>
													<li id="n11">밑줄(연필/샤프)</li>
													<li id="n12">밑줄(볼펜/형광펜)</li>
												</ul>
											</dd>
											<br />
											<dt>필기 흔적</dt>
											<dd>
												<ul class="alt">
													<li id="n20">없음</li>
													<li id="n21">필기(연필/샤프)</li>
													<li id="n22">필기(볼펜/형광펜)</li>
												</ul>
											</dd>
										</dl>
									</div>
									<div class="col-6 col-12-medium">
										<dl>
											<dt>겉표지</dt>
											<dd>
												<ul class="alt"">
													<li id="d10" class='checked'>깨끗함</li>
													<li id="d11" >깨끗하지 않음</li>
												</ul>
											</dd>
											<br />
											<dt>이름 기입</dt>
											<dd>
												<ul class="alt">
													<li id="d20" class='checked'>없음</li>
													<li id="d21">있음</li>
												</ul>
											</dd>
											<br />
											<dt>페이지 변색</dt>
											<dd>
												<ul class="alt">
													<li id="d30" class='checked'>없음</li>
													<li id="d31">있음</li>
												</ul>
											</dd>
											<br />
											<dt>페이지 훼손</dt>
											<dd>
												<ul class="alt">
													<li id="d40" class='checked'>없음</li>
													<li id="d41">있음</li>
												</ul>
											</dd>
										</dl>
										<div class="images">
											<c:if test="${bp.book_photo1 ne null}">
												<img src="${bp.book_photo1}" style="width:30%;" alt=" " >
											</c:if>
											<c:if test="${bp.book_photo2 ne null}">
												<img src="${bp.book_photo2}" style="width:30%;" alt=" " >
											</c:if>
											<c:if test="${bp.book_photo3 ne null}">
												<img src="${bp.book_photo3}" style="width:30%;" alt=" " >
											</c:if>
										</div>
									</div>
								</div>
								<!-- 거래 수단 -->
								<div class="box">
									<div class="col-6 col-12-medium">
										<h4>거래 수단</h4>
										<dl>
											<dt>택배</dt>
											<dd>
												<ul class="alt">
													<li id="m10">가능</li>
													<li id="m11" class='checked'>불가</li>
												</ul>
											</dd>
											<br />
											<dt>직거래</dt>
											<dd>
												<ul class="alt">
													<li id="m20">가능</li>
													<li id="m21" class='checked'>불가</li>
												</ul>
											</dd>
										</dl>
									</div>
								</div>
					</article>
				</div>
			</div>
		</section>
	</div>
   <div class="modal fade" id="sendMessage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<form action="bookDetailSend.do" method="POST" class="form-signin">
						<input type="hidden" name="send_member_no" value="<%=member_no%>">
						<input type="hidden" name="reci_member_no" value="${book.member_no}">
						<input type="text" name="msg_cont" placeholder="보내실 쪽지 내용을 여기에 작성하세요" required="required">
						<input type="hidden" name="message" value="${message }">
						<div class="sendButton">
							<span><input type="submit" value="send"></span>
							<span>icon</span>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
    <div class="modal fade" id="updateSellingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<form action="updateSelling.do" method="post" class="form-signin">
						<input type="hidden" name="book_no" value="${book.book_no}">
						<input type="number" name="book_selling" placeholder="${book.book_selling}" required="required" autofocus="autofocus">
						<button type="submit" class="btn btn-lg btn-primary btn-block">저장</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="updateContModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<form action="updateCont.do" method="post" class="form-signin">
						<input type="hidden" name="book_no" value="${book.book_no}">
						<input type="text" name="book_cont" placeholder="${book.book_cont}" required="required" autofocus="autofocus">
						<button type="submit" class="btn btn-lg btn-primary btn-block">저장</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	    $('#updateBookState').click(function(event){
	    	alert("판매가 완료되면 더이상 쪽지를 받을 수 없습니다. 정말 판매가 완료되었습니까?");
	    	location.href="updateBookState.do?book_no=${book.book_no}"
		});
    </script>
    <script type="text/javascript">
	    $('#updateSelling').click(function(event){
	    	event.preventDefault();
			$('#updateSellingModal').modal('show');
		});
	</script>
	<script type="text/javascript">
	    $('#updateCont').click(function(event){
	    	event.preventDefault();
			$('#updateContModal').modal('show');
		});
    </script>
    <script type="text/javascript">
	    $('#sendMsg').click(function(event){
	    	event.preventDefault();
			$('#sendMessage').modal('show');
		});
    </script>
    <!-- Scripts -->
		<script src="cssEval/assets/js/jquery.dropotron.min.js"></script>
		<script src="cssEval/assets/js/browser.min.js"></script>
		<script src="cssEval/assets/js/breakpoints.min.js"></script>
		<script src="cssEval/assets/js/util.js"></script>
		<script src="cssEval/assets/js/main.js"></script>
</body>
</html>