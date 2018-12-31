<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대학추가</title>
</head>
<body>
	<span onclick="location.href='adminUniList.do'">대학관리</span>
	<span onclick="location.href='lecturelist.do'">강의관리</span>
	<span onclick="location.href='#'">교수관리</span>
	<h2> 대학 목록 </h2><a href="uniForm.do">입력</a>
<table>	
	<tr><th>대학교 번호</th>
		<th>대학교 이름</th>
	</tr>
	<c:forEach var="adminUniList" items="${adminUniList }">
		<tr>
			<td>${adminUniList.uni_no}</td>			
			<td>${adminUniList.uni_name}</td>
		</tr>
	</c:forEach>
	</table>
	<c:if test="${adminUnipg.startPage > adminUnipg.pageBlock }">
	<a href="adminUniList.do?currentPage=${adminUnipg.startPage-adminUnipg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${adminUnipg.startPage }" end="${adminUnipg.endPage }">
	<a href="adminUniList.do?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${adminUnipg.endPage < adminUnipg.totalPage }">
	<a href="adminUniList.do?currentPage=${adminUnipg.startPage+adminUnipg.pageBlock}">[다음]</a>
	</c:if>
	
</body>
</html>