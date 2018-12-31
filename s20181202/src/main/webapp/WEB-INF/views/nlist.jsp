<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 공지 사항 </h2><a href="nwriteForm.do">입력</a>
	<input type = "hidden" name = "study_warn" value = "${study_warn } " />
	<input type = "hidden" name = "study_state" value = "${study_state }" />
<table>	
	
	<tr><th >스터디 번호</th>
		<th>스터디 종류</th>
		<th>스터디 제목</th>
		<th>스터디 작성자</th>
		<th>스터디 내용</th></tr>
	<c:forEach var="study" items="${nlist }">
		<tr>
		<td>${study.study_no}</td><td>${study.study_type}</td>
		<td><a href="ndetail.do?study_no=${study.study_no}">${study.study_title}</a></td>
		<td>${study.study_writer}</td><td>${study.study_cont}</td></tr>
	</c:forEach>
	</table>
	<c:if test="${pg.startPage > pg.pageBlock }">
	<a href="nlist.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
	<a href="nlist.do?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
	<a href="nlist.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
	</c:if>
	
</body>
</html>