<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고</title>
<script>
window.onload = function () {
	var warnCheckId;
	var warnCheckId1;
	if((document.getElementById("warnCheckId").value)!="1"){
		warnCheckId = document.getElementById("warnCheckId").value;
	}else{
		warnCheckId1 = document.getElementById("warnCheckId1").value;
	}
	
	if(warnCheckId!=null){
		alert(warnCheckId);
	}else{
		alert(warnCheckId1);
	}
	document.location.href="study/StudyList.do";
}
</script>
</head>
<body>
	
	<input type="hidden" value="${msg }" id="warnCheckId">
	<input type="hidden" value="${msg1 }" id="warnCheckId1">
</body>
</html>