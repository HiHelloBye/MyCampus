<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	
<link rel="stylesheet" href="css/adminW.css" type="text/css"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>강의평 신고 관리</title>
<style>
.pg {
	width:300px; 
	margin: auto;
}
</style>
</head>
<body>
	
<nav class="navbar navbar-default navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
  	<a class="navbar-brand" href="Mainpage.do">메인 페이지</a>
  	</div>
    <div class="collapse navbar-collapse" id="myNavbar">
		<ul class="nav navbar-nav">
		<li><a href="nlist.do">[공지 관리]</a>
      	<li><a href="adminUniList.do">[대학 관리]</a>
      	<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">[신고 관리] <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="admin_lecE.do"> 강의평 신고 관리</a></li>
          <li><a href="admin_study.do">스터디 신고 관리</a></li>
        </ul>
     	<li><a class="nav-link" href="lecturelist.do">[강의 관리]</a>
     	<li><a class="nav-link" href="profList.do">[교수 관리]</a>
      </li>
    </ul>
    </div>
  </div>
</nav>

<h2>강의평 신고 관리</h2>
	<form method="post" action="resetWarnLec.do">
	<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
	<table style="margin-left:auto; margin-right:auto">
		<tr>
			<th style="background-color:#67aeca">강의평 게시글 번호</th>			
			<th style="background-color:#67aeca">강의 번호</th>
			<th style="background-color:#67aeca">대학교 번호</th>
			<th style="background-color:#67aeca">강의 총평</th>
			<th style="background-color:#67aeca">강의 총점</th>
			<th style="background-color:#67aeca">강의평 신고누적</th>
			<th style="background-color:#67aeca">삭제</th>
			<th style="background-color:#67aeca">초기화</th>
		</tr>
		<c:forEach var="lec" items="${adminLecList }">
			<tr>
				<td>${lec.leceval_no }</td>
				<td>${lec.lec_no }</td>
				<td>${lec.uni_no }</td>
				<td>${lec.lec_review }</td>
				<td>${lec.lec_score }</td>
				<td>${lec.lec_warn }</td>
				<td><input type="button" value="삭제" onclick="location.href='warnDelLec.do?study_leceval=${lec.leceval_no }&type_no=2'"></td>
				<td><input type="hidden"name="leceval_no" value="${lec.leceval_no }"><input type="hidden"name="type_no" value="2">
				<input type="submit" value="초기화" ></td>
			</tr>
			<c:set var="num" value="${num-1 }"></c:set>
		</c:forEach>
	</table>
	</form>
	<div style="margin-left:auto; margin-right:auto; text-align:center">
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="admin_lecE.do?currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="admin_lecE.do?currentPage=${i }">[${i }]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="admin_lecE.do?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if>
	</div>
</body>
</html>