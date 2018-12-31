<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/adminN.css" type="text/css"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>강의 리스트</title>

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
<h2> 대학 리스트 </h2>
	
<table style="margin-left:auto; margin-right:auto" >
	<tr><th style="background-color:#67aeca">강의번호</th>
		<th style="background-color:#67aeca">대학교번호</th>
		<th style="background-color:#67aeca">강의 이름</th>
		<th style="background-color:#67aeca">교수 번호</th>
		<th style="background-color:#67aeca">교수 이름</th></tr>
	<c:forEach var = "lecture" items="${lecturelist }">
	<tr>
		<td>${lecture.lec_no }</td>
		<td>${lecture.uni_no }</td>
		<td><a href = "lecturedetail.do?lec_no=${lecture.lec_no }">${lecture.lec_name }</a></td>
		<td>${lecture.prof_no }</td>
		<td>${lecture.prof_name }</td>
	</tr>
	</c:forEach>
	<tr>
			<td colspan="5">
					<div>
						<span> 
							<input style="float: right" type="button"  onclick="location.href='lectureInForm.do'" value="글쓰기" >
						</span>
					</div>
				</td>
			</tr>
	</table>
	<div style="text-align: center;" >
	<c:if test="${pg.startPage > pg.pageBlock }">
	<a href="lecturelist.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
	<a href="lecturelist.do?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
	<a href="lecturelist.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
	</c:if>
	</div>
	

</body>
</html>