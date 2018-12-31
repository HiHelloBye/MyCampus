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
<h2>공지 사항</h2>
<input type="hidden" name="study_no" value="${study.study_no }">
<form action="nupdate.do" method="post">
    <table>
	<tr><th>스터디 종류</th><td>
	    <input type="text" name="study_type" 
		required="required" value="${study.study_type }" ></td></tr>
	<tr><th>스터디 제목</th><td>
	    <input type="text" name="study_title" 
		required="required" value="${study.study_title }"></td></tr>
	<tr><th>스터디 작성자</th><td>
	    <input type="text" name="study_writer" 
		required="required" value="${study.study_writer }"></td></tr>
	<tr><th>스터디 내용</th><td>
	   <textarea rows="5" cols="30" name="study_cont" required="required">${study.study_cont }</textarea></td></tr>
	<tr><td>
	<input type="submit" value="확인">
</td>
</tr>
</table>
</form>

</body>
</html>