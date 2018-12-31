<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의평 게시판 메인</title>
</head>
<body>
	<!-- 전체 강의평가 -->
	<span onclick="location.href='StudyList.do'">스터디게시판</span>
	<h2 onclick="location.href='lectureEvalMain.do'">강의평가</h2>
	<c:set var="num" value="${pgeval.total-pgeval.start+1}"></c:set>
	<table  border="1">
	<tr>
		<th>별점</th><th>강의명</th><th>교수명</th><th>수강학기</th><th>수강평</th>
	</tr>
		<c:forEach var="leceval" items="${listeval }">
			<tr onclick="location.href='lecEvalDetail.do?lec_no=${leceval.lec_no}&uni_no=${leceval.uni_no} '">
				<td>
				<c:if test="${leceval.lec_score == 1.0}">
					<img src="resources/imgstar/star1.JPG" style="width:100px;">
				</c:if>
				<c:if test="${leceval.lec_score == 2.0}">
					<img src="resources/imgstar/star2.JPG" style="width:100px;">
				</c:if>
				<c:if test="${leceval.lec_score == 3.0}">
					<img src="resources/imgstar/star3.JPG" style="width:100px;">
				</c:if>
				<c:if test="${leceval.lec_score == 4.0}">
					<img src="resources/imgstar/star4.JPG" style="width:100px;">
				</c:if>
				<c:if test="${leceval.lec_score == 5.0}">
					<img src="resources/imgstar/star5.JPG" style="width:100px;">
				</c:if>
				</td>
				<td>${leceval.lec_name }</td>
				<td>${leceval.prof_name }</td>
				<td>${leceval.att_term }</td>
				<td>${leceval.lec_review }</td>
			</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>
	<c:if test="${pgeval.startPage > pgeval.pageBlock }">
		<a href="lectureEvalMain.do?currentPage=${pgeval.startPage-pgeval.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pgeval.startPage }" end="${pgeval.endPage }">
		<a href="lectureEvalMain.do?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pgeval.endPage < pgeval.totalPage }">
		<a href="lectureEvalMain.do?currentPage=${pgeval.startPage+pgeval.pageBlock}">[다음]</a>
	</c:if>
	<!-- 강의평가 검색 -->
	<form action="lectureSearchResult.do" method="get">
		<input type="text" placeholder="강의명 또는 교수명 입력" name="search">
		<input type="submit" value="검색">
	</form>
	<!-- 내가 작성한 강의평 -->
	<table border="1">
		<caption>내가 작성한 강의평</caption>
		<tr>
			<th>별점</th><th>강의명</th><th>교수명</th><th>년도</th><th>학기</th><th>내용</th>
		</tr>
		
	</table>
</body>
</html>