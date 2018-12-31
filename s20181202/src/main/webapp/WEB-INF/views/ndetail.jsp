<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<script type="text/javascript">
	function ch() 	{ 
		password = prompt("비밀번호 입력하세요");
		if(password == 123) {
			location.href="ndelete.do?study_no=${study.study_no}";
		}else{ 
			alert("패스워드가 틀림")	
		}
		
	}
	
	
	</script>
	
<h2>공지</h2>

<table>
	<tr><th>스터디 번호</th><td>${study.study_no }</td></tr>
	<tr><th>스터디 종류</th><td>${study.study_type }</td></tr>
	<tr><th>스터디 제목</th><td>${study.study_title }</td></tr>
	<tr><th>스터디 작성자</th><td>${study.study_writer }</td></tr>
	<tr><th>스터디 내용</th><td><textarea rows="5" cols="30" disabled>${study.study_cont }</textarea></td></tr>
	<tr><td> <input type="button" value="목록" 
			onclick="location.href='nlist.do'">
		<input type="button" value="수정" 
			onclick="location.href='nupdateForm.do?study_no=${study.study_no}'">
		<input type="button" value="삭제" 
			onclick="ch()"></td></tr>
</table>
</body>
</html>
<%-- "location.href='ndelete.do?study_no=${study.study_no}'" --%>

