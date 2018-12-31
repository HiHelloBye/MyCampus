<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"   %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지 보내기</title>
<!-- <style type="text/css">
	body {  background-color: #FFF0B5; font-size: 9pt; }
	table { background-color: yellow; width: 100%;}
	tr:hover { background-color: ornage; }
	td { background-color: #FFE271; text-align: center; padding: 10px;}
	.left { text-align: left; }
</style>  -->
</head>
<body>
    <h2>쪽지 보내기</h2>
    <c:if test="${msg!=null }">${msg }</c:if>
	<form action="write.do" method="post">
		<table> 
	<!-- <table width="500" cellpadding="0" cellspacing="0" border="1"> -->
			<tr>
				<th>보내는 사람</th>
				<td><input type="text" name="msg_sender" readonly value="${msg_sender }" /></td>
			</tr>
			<tr>
				<th>받는 사람</th>
				<td><input type="text" id="msg_reci" name="msg_reci"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" id="msg_cont" name="msg_cont"></td>
				<td>
			</tr>
		<tr>
			<td colspan="5"> <input type="submit" value="보내기">  </td>
		</tr>
	</table>
	</form>
</body>
</html>