<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/adminF.css" type="text/css" >
<!-- <link rel="stylesheet" href="css/main.css" type="text/css" > -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 추가 입력</title>

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
<h2>강의 수정 </h2>


<form action="lectureupdate.do" method="post">
    <input type="hidden" name="lec_no" value="${lecture.lec_no }">
    <%-- <input type="hidden" name="prof_no" value="${professor.prof_no }">  --%>
    
	<table style="margin-left:auto; margin-right:auto" >
	<tr align="center">
		<th style="background-color:#67aeca">대학 명</th><td>
		<input type="number" name="uni_no" required="required" 
		value="${lecture.uni_no }"></td>
	</tr>
	<tr align="center">
		<th style="background-color:#67aeca">강의 명</th><td>
		<input type="text" name="lec_name" required="required" 
		value="${lecture.lec_name }" ></td>
	</tr>
	<tr align="center">
		<th style="background-color:#67aeca">교수 명</th><td>
		<input type="text" name="prof_name" readonly="readonly" 
		value="${lecture.prof_name }" ></td>
	</tr>
	<tr align="right"><td colspan="2">
	<input type="submit" value="수정 완료">
	
	
	 
		
	
	
	</table>
	
</form>

</body>
</html>