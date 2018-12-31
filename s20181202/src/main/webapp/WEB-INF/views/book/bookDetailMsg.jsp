<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
</head>
<body>
<% 
   int sender_member_no = (Integer)session.getAttribute("member_no");
%> 

<form action="bookDetailSend.do" method="POST">
	<input type="text" name="msg_cont" placeholder="보내실 쪽지 내용을 여기에 작성하세요" required="required">
	<input type="hidden" name="message" value="${message }">
	<div class="sendButton">
		<span><input type="submit" value="send"></span>
		<span>icon</span>
	</div>
</form>
</body>
</html>