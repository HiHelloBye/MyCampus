<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
 	function chk1() {
		if (!lee.lec_no.value) {
			alert("강의번호를 입력한후 확인 하세요")
			lee.lec_no.focus();
			return false;
			
		}else location.href = "confirmlec.do?lec_no="+lee.lec_no.value;
		
	} 

</script>
 -->
</head>
<body>
<h2>강의 정보 입력</h2>
<%-- <c:if test="${msg!=null}">${msg}</c:if>  --%>
<form action = "lectureIn.do" method="post" > <!-- name="lee" --> 
 <input type="hidden" name="total_score" value="0">
<table>
	
	<tr>
		<th>강의 번호</th>
		<td><input type="number" name="lec_no" required="required"></td>
	</tr>
	<tr>
		<th>대학 번호</th>
		<td><input type="number" name="uni_no" required="required"></td>
	</tr>
	<tr>
		<th>강의명</th>
		<td><input type="text" name="lec_name" required="required"></td>
	</tr>
	<tr>
		<th>교수 이름</th>
		<td><input type="number" name="prof_no" required="required"></td>
	</tr>
	<tr>
		<td><input type="submit" value="확인"></td>
	</tr>
	
	
</table>
</form>
</body>
</html>