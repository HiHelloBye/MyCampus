<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<%
	int member_no = (Integer)session.getAttribute("member_no");
	int member_grade = (Integer)session.getAttribute("member_grade");
	String member_nick = (String)session.getAttribute("member_nick");	 
	System.out.println("member_no_cont->"+member_no);
	System.out.println("member_nick_cont->"+member_nick);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../cssStudy/assets/css/main.css" rel="stylesheet" type="text/css">
<title>스터디 게시판 글쓰기</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript" src="../smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
function itemChange(){
		
	var k = ["인적성","면접","기타"];
	var f = ["영어","일본어","중국어","기타"];
		
	var selectItem = $("#select1").val();
		
	var changeItem;
		
	if(selectItem == "취업"){
		changeItem = k;
	}
	else if(selectItem == "어학"){
		changeItem = f;
	}
		
	$('#select2').empty();
		
	for(var count = 0; count < changeItem.length; count++){                
		if(selectItem == "어학") {
			var option = $("<option value="+f[count]+">" + changeItem[count] + "</option>");
			$('#select2').append(option);
		}
		else {
			var option = $("<option value="+k[count]+">" + changeItem[count] + "</option>");
			$('#select2').append(option);
		}
	}
}
</script>
<script type="text/javascript">
$(function() {
		//전역변수선언
		var editor_object = [];
		// Editor Setting
		nhn.husky.EZCreator.createInIFrame({
		oAppRef : editor_object, // 전역변수 명과 동일해야 함.
		elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
		sSkinURI : "../smarteditor/SmartEditor2Skin.html", // Editor HTML
		fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true, 
		}
	});

	// 필수값 Check
	function validation(){
		var contents = $.trim(editor_object[0].getContents());
		if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
			alert("내용을 입력하세요.");
			editor_object.getById['smarteditor'].exec('FOCUS');
			return false;
		}

		return true;
	}
	// 전송버튼 클릭이벤트
	$("#savebutton").click(function(){
		//if(confirm("저장하시겠습니까?")) {
			// id가 smarteditor인 textarea에 에디터에서 대입
			editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
			// 이부분에 에디터 validation 검증
			if(validation()) {
				$("#frm").submit();
			}
		//}
	})
});
</script>
<style>
#header .container{
	margin-top:0;
	padding: 11em 0 5.5em 0;
}
form input[type="text"],
	form input[type="email"]
	input[type="password"],
	form select,
	form textarea {
		-moz-transition: background-color 0.25s ease-in-out;
		-webkit-transition: background-color 0.25s ease-in-out;
		-ms-transition: background-color 0.25s ease-in-out;
		transition: background-color 0.25s ease-in-out;
		-webkit-appearance: none;
		display: block;
		border: 0;
		background: #e8e8e8;
		width: 50%;
		box-shadow: inset 2px 2px 0px 0px rgba(0, 0, 0, 0.1);
		border-radius: 4px;
		line-height: 1.25em;
		padding: 0.75em 1em 0.75em 1em;
	}
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
	<section id="banner">           
            </section>
			</div>


	<section id="main">
		<div class="container">
			<div class="row">
				<div id="content" class="col-8 col-12-medium">
					<c:if test="${msg!=null }">${msg }</c:if>
					<form action="studyWrite.do" method="post" name="frm">

						<table>
							<tr>
								<th style="width: 100px;">제목 :</th>
								<td><input type="text" name="study_title" maxlength="50"
									required="required"></td>
							</tr>
							<tr>
								<th>종류 :</th>
								<td><input type="hidden" name="study_writer"
									value="${sessionScope.member_nick }"> <input
									type="hidden" name="member_no"
									value="${sessionScope.member_no }"> <select
									name="study_type" id="select1" required="required"
									onchange="itemChange()">
										<option value="">선택</option>
										<option value="취업">취업</option>
										<option value="어학">어학</option>
								</select> <select id="select2" name="study_subtype" required="required">
										<option>선택해주세요</option>
								</select></td>
							</tr>
							<tr>
								<th>내용 :</th>
								<td><textarea name="study_cont" id="smarteditor" rows="10"
										cols="100" style="width: 766px; height: 412px;"></textarea> <!-- <textarea style="resize: none;" name="study_cont" rows="4" cols="50"required="required"></textarea> --></td>
							</tr>

							<tr>
								<th></th>
								<td><input type="submit" value="확인" id="savebutton"></td>
							</tr>
						</table>


					</form>
				</div>
			</div>
		</div>
	</section>
	<script src="../cssStudy/assets/js/jquery.min.js"></script>	
<script src="../cssStudy/assets/js/jquery.dropotron.min.js"></script>	
<script src="../cssStudy/assets/js/breakpoints.min.js"></script>			
<script src="../cssStudy/assets/js/browser.min.js"></script>			
<script src="../cssStudy/assets/js/util.js"></script>						
<script src="../cssStudy/assets/js/main.js"></script>
</body>
</html>