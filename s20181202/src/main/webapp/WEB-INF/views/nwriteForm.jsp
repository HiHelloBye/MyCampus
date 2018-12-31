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

<h2>공지사항 입력</h2>
<c:if test="${msg!=null}">${msg}</c:if>
<form action="nwrite.do" method="post" >
<table>
	<tr><th>스터디 종류</th><td>
	<input type = "hidden" name = "study_warn" value = "0" />
	<input type = "hidden" name = "study_state" value = "0" />
	<input type = "hidden" name = "member_no" value = "0" />
<select name="study_type"  required="required">
    <option value="">    </option>
    <option value="공지">공지</option>
    <option value="취업">취업</option>
    <option value="어학">어학</option>
</select></td></tr>
	<tr><th>스터디 제목</th><td><input type="text" name="study_title" required="required" 
		></td></tr>
	<!-- <tr><th>스터디 작성자</th><td><input type="text" name="study_writer" required="required" 
		></td></tr> -->
	<tr><th>스터디 내용 </th><td>
		<textarea rows="5" cols="30" name="study_cont" required="required"></textarea></td></tr>
	
	
	<tr><td colspan="2"><input type="submit" value="확인"></td></tr>
	
	</table>
	</form>

</body>
</html>