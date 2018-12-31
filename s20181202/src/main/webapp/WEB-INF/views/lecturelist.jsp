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
	<a href="lectureInForm.do">입력</a>
<table>
	<tr><th>강의번호</th>
		<th>대학교번호</th>
		<th>강의 이름</th>
		<th>교수 번호</th>
		<th>교수 이름</th></tr>
	<c:forEach var = "lecture" items="${lecturelist }">
	<tr>
		<td>${lecture.lec_no }</td>
		<td>${lecture.uni_no }</td>
		<td><a href = "ldetail.do?lecture_no=${lecture.lec_no }">${lecture.lec_name }</a></td>
		<td>${lecture.prof_no }</td>
		<td>${lecture.prof_name }</td>
	</tr>
	</c:forEach>
	
	
	
	
	
</table>

</body>
</html>