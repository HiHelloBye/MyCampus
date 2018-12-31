<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>쪽지함</h2>
	<table>
		<tr>
			<th>보낸쪽지</th>
			<th>받은쪽지</th>
			<th>쪽지 보내기</th>
		</tr>
		
			<tr>
				<td><a href="msgsend.do">보낸 쪽지</a></td>
				<td><a href="msgreci.do">받은 쪽지</a></td>
				<td><a href="writeform.do">쪽지 보내기</a></td>
			</tr>
	
	</table>
</body>
</html>