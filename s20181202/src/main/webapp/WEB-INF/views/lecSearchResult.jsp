<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의평가 검색</title>
</head>
<body>
	<!-- 검색결과 강의평가 -->
	<h2 onclick="location.href='lectureEvalMain.do'">강의평가</h2>
	<c:set var="num" value="${pgeval.total-pgeval.start+1}"></c:set>
	<table>
		<c:forEach var="searchList" items="${searchList }">	
			<tr>
				<td>
					<c:if test="${searchList.lec_score > 0.0 && searchList.lec_score<=0.5}">
						<td colspan="2"><img src="resources/imgstar/star05.JPG" style="width:150px;"></td>
					</c:if>
					<c:if test="${searchList.lec_score > 0.5 && searchList.lec_score<=1.0}">
						<td colspan="2"><img src="resources/imgstar/star1.JPG" style="width:150px;"></td>
					</c:if>
					
					<c:if test="${searchList.lec_score > 1.0 && searchList.lec_score<=1.5}">
						<td colspan="2"><img src="resources/imgstar/star15.JPG" style="width:150px;"></td>
					</c:if>
					<c:if test="${searchList.lec_score > 1.5 && searchList.lec_score<=2.0}">
						<td colspan="2"><img src="resources/imgstar/star2.JPG" style="width:150px;"></td>
					</c:if>
					
					<c:if test="${searchList.lec_score > 2.0 && searchList.lec_score<=2.5}">
						<td colspan="2"><img src="resources/imgstar/star25.JPG" style="width:150px;"></td>
					</c:if>
					<c:if test="${searchList.lec_score > 2.5 && searchList.lec_score<=3.0}">
						<td colspan="2"><img src="resources/imgstar/star3.JPG" style="width:150px;"></td>
					</c:if>
					
					<c:if test="${searchList.lec_score > 3.0 && searchList.lec_score<=3.5}">
						<td colspan="2"><img src="resources/imgstar/star35.JPG" style="width:150px;"></td>
					</c:if>
					<c:if test="${searchList.lec_score > 3.5 && searchList.lec_score<=4.0}">
						<td colspan="2"><img src="resources/imgstar/star4.JPG" style="width:150px;"></td>
					</c:if>
					
					<c:if test="${searchList.lec_score > 4.0 && searchList.lec_score<=4.5}">
						<td colspan="2"><img src="resources/imgstar/star45.JPG" style="width:150px;"></td>
					</c:if>
					<c:if test="${searchList.lec_score > 4.5 && searchList.lec_score<=5.0}">
						<td colspan="2"><img src="resources/imgstar/star5.JPG" style="width:150px;"></td>
					</c:if>
				</td>
				<td onclick="location.href='lecEvalDetail.do?lec_no=${searchList.lec_no}&uni_no=${searchList.uni_no} '">${searchList.lec_name }</td>
				<td onclick="location.href='lecEvalDetail.do?lec_no=${searchList.lec_no}&uni_no=${searchList.uni_no} '">${searchList.prof_name }</td>
				<td onclick="location.href='lecEvalDetail.do?lec_no=${searchList.lec_no}&uni_no=${searchList.uni_no} '">${searchList.att_term }</td>
				<td onclick="location.href='lecEvalDetail.do?lec_no=${searchList.lec_no}&uni_no=${searchList.uni_no} '">${searchList.lec_review }</td>
			</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>
	<c:if test="${pgsearch.startPage > pgsearch.pageBlock }">
		<a href="lectureSearchResult.do?search=${search}&currentPage=${pgsearch.startPage-pgsearch.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pgsearch.startPage }" end="${pgsearch.endPage }">
		<a href="lectureSearchResult.do?search=${search}&currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pgsearch.endPage < pgsearch.totalPage }">
		<a href="lectureSearchResult.do?search=${search}&currentPage=${pgsearch.startPage+pgsearch.pageBlock}">[다음]</a>
	</c:if>
	<!-- 강의평가 검색 -->
	<form action="lectureSearchResult.do" method="get">
		<input type="text" placeholder="강의명 또는 교수명 입력" name="search">
		<input type="submit" value="검색">
	</form>
</body>
</html>