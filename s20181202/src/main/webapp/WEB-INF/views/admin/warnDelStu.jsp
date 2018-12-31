<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tripa.com</title>
</head>
<body>
<c:if test="${result>0}">
	<script type="text/javascript">
	alert("입력완료");	
	location.href="admin_study.do";
	</script>
</c:if>	
<c:if test="${result==0}">
	<script type="text/javascript">
	alert("입력오류");
	location.href="admin_study.do";	
	</script>
</c:if>
</body>
</html>