<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/adminN.css" type="text/css"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><title>대학추가</title>
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


	<h2> 대학 목록 </h2>
<table style="margin-left:auto; margin-right:auto">	
	<tr><th style="background-color:#67aeca">대학교 번호</th>
		<th style="background-color:#67aeca">대학교 이름</th>
	</tr>
	<c:forEach var="adminUniList" items="${adminUniList }">
		<tr>
			<td>${adminUniList.uni_no}</td>			
			<td>${adminUniList.uni_name}</td>
		</tr>
	</c:forEach>
		<tr>
				<td colspan="2">
					<div>
						<span> 
							<input style="float: right" type="button"  onclick="location.href='uniForm.do'" value="대학 추가" >
						</span>
					</div>
				</td>
			</tr>
	</table>
	<div style="text-align: center;">
	<c:if test="${adminUnipg.startPage > adminUnipg.pageBlock }">
	<a href="adminUniList.do?currentPage=${adminUnipg.startPage-adminUnipg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${adminUnipg.startPage }" end="${adminUnipg.endPage }">
	<a href="adminUniList.do?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${adminUnipg.endPage < adminUnipg.totalPage }">
	<a href="adminUniList.do?currentPage=${adminUnipg.startPage+adminUnipg.pageBlock}">[다음]</a>
	</c:if>
	</div>
</body>
</html>