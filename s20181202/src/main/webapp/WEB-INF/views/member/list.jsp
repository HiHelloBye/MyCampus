<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
</head>
<body>
	<h2>회원목록</h2><a href="register.do">회원가입</a>
	<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
	<table>
		<tr>
			<th>번호</th>			
			<th>회원 번호</th>
			<th>등급</th>
			<th>이메일</th>
			<th>비밀번호</th>
			<th>닉네임</th>
			<th>멤버 사진</th>
			<th>가입일자</th>
			<th>로그인 일자</th>
			<th>이메일 인증</th>
			<th>이메일 발송키</th>

		</tr>
		<c:forEach var="member" items="${list }">
			<tr>
				<td>${num }</td>
				<td>${member.member_no }</td>
				<td>${member.member_grade }</td>
				<td>${member.member_email }</td>
				<td>${member.member_pw }</td>
				<td>${member.member_nick }</td>
				<td>${member.uni_no }</td>
				<td>${member.member_photo }</td>
				<td>${member.reg_date }</td>
				<td>${member.log_date }</td>
				<td>${member.approval_status }</td>
				<td>${member.approval_key }</td>
			</tr>
			<c:set var="num" value="${num-1 }"></c:set>
		</c:forEach>
	</table>
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="list.do?currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="list.do?currentPage=${i }">[${i }]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="list.do?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if>

</body>
</html>