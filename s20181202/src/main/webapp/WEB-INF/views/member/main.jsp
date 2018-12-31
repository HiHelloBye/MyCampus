<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<title>메인화면</title>
</head>
<body>

	<c:if test="${member.member_grade eq 0 }">
		<input type="button" value="로그아웃" onclick="location.href='logout.do'">
		<input type ="button" value="관리자페이지">
	</c:if>
	
	<c:if test="${member.member_grade == 1 }">
		<input type ="button" value="로그아웃" onclick="location.href='logout.do'">
		<input type ="button" value="회원정보변경" onclick="location.href='myPage.do'">
		<input type ="button" value="회원페이지" onclick="location.href='view.do?member_email=${member.member_email}'">
		<input type ="button" value="쪽지함" onclick="location.href='message.do?member_nick=${member.member_nick}'">
		<input type ="button" value="프로필 사진 등록" onclick="location.href='profileForm.do?member_no=${member.member_no}'">
		
		<input type ="button" value="내가 쓴 강의평" onclick="location.href='lectureBoardList.do?member_email=${member.member_email}'">
		<input type ="button" value="내가 쓴 책방 등록 글" onclick="location.href='bookBoardList.do?member_email=${member.member_email}'">
		<input type ="button" value="내가 쓴 스터디 게시판 글" onclick="location.href='studyBoardList.do?member_email=${member.member_email}'">
		
		<input type ="button" value="mainpage" onclick="location.href='../Mainpage.do?member_grade=${member.member_grade}'">
	</c:if>
</body>
</html>