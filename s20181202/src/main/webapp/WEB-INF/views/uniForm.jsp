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
<h2>대학교 추가</h2>
<%-- <c:if test="${msg!=null}">${msg}</c:if> --%>

<form action="uniIn.do" method="post">
	<table>
		<tr>
			<td><input type="text" name="uni_name" required="required" placeholder="대학명을 입력해주세요"></td>
		</tr>
		<tr>
			<td><input type="password" name="admin_pw"></td>
		</tr>
		<tr>	
			<td><input type="submit" value="확인"></td>
		</tr>
	</table>
	</form>
</body>
</html>