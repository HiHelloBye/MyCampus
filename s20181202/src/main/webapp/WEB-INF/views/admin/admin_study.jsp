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
<title>스터디 신고 관리</title>
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
          <li><a href="admin_lecE.do">스터디 신고 관리  </a></li>
          <li><a href="admin_study.do">강의평 신고 관리</a></li>
        </ul>
     	<li><a class="nav-link" href="lecturelist.do">[강의 관리]</a>
     	<li><a class="nav-link" href="profList.do">[교수 관리]</a>
      </li>
    </ul>
    </div>
  </div>
</nav>
<h2>스터디 신고 관리</h2>
<form method="post" action="resetWarnStu.do">
	<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
	<table style="margin-left:auto; margin-right:auto">
		<tr>
			<th style="background-color:#67aeca">스터디 번호</th>			
			<th style="background-color:#67aeca">스터디 종류</th>
			<th style="background-color:#67aeca">스터디 제목</th>
			<th style="background-color:#67aeca">스터디 작성자</th>
			<th style="background-color:#67aeca">스터디 신고누적</th>
			<th style="background-color:#67aeca">삭제</th>
			<th style="background-color:#67aeca">초기화</th>
			
		</tr>
		<c:forEach var="study" items="${adminStudyList }">
			<tr>
				<td>${study.study_no }</td>
				<td>${study.study_type }</td>
				<td><a href="ndetail.do?study_no=${study.study_no}">${study.study_title}</a></td>
				<td>${study.study_writer }</td>
				<td>${study.study_warn }</td>
				<td><input type="button" value="삭제" onclick="location.href='warnDelStu.do?study_leceval=${study.study_no }&type_no=1'"></td>
				<td><input type="hidden"name="study_no" value="${study.study_no }"><input type="hidden"name="type_no" value="1">
				<input type="submit" value="초기화" ></td>
			</tr>
			<c:set var="num" value="${num-1 }"></c:set>
		</c:forEach>
	</table>
	</form>
	<div style="margin-left:auto; margin-right:auto; text-align:center" >
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="admin_study.do?currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="admin_study.do?currentPage=${i }">[${i }]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="admin_study.do?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if>
	</div>

</body>
</html>