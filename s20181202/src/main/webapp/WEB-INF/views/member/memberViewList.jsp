<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<title>회원정보 변경</title></head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>회원정보</h3>
			</div>
			<div>
				<p>
					<label>프로필 이미지</label> 
					<img class='${member.member_photo}' id="member_photo" name="member_photo" >	
				</p>
				<p>
				<p>
					<label>이메일</label> 
					<input class="w3-input" type="text" id="member_email" name="member_email" value="${member.member_email }" required readonly="readonly"> 
				</p>
				
				<p>
					<label>닉네임</label> 
					<input class="w3-input" type="text" id="member_nick" name="member_nick" value="${member.member_nick }" readonly="readonly"> 
				</p>
				
				<p>
					<label>대학교</label> 
					<input class="w3-input" type="text" id="uni_name" name="uni_name" value="${member.uni_name }" readonly="readonly"> 
				</p>
			</div>
		</div>
	</div>
</body>
</html>