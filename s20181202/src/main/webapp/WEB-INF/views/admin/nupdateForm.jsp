<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="../header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/adminF.css" type="text/css" >
<!-- <link rel="stylesheet" href="css/main.css" type="text/css" > -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 수정</title>

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
<h2>공지 사항</h2>

<form action="nupdate.do" method="post">
<input type="hidden" name="study_no" value="${study.study_no }">
    <table style="margin-left:auto; margin-right:auto">
	<tr align="center"><th style="background-color:#67aeca">스터디 종류</th><td>
	    <input type="text" name="study_type" 
		required="required" value="${study.study_type }" ></td></tr>
	<tr align="center"><th style="background-color:#67aeca">스터디 제목</th><td>
	    <input type="text" name="study_title" 
		required="required" value="${study.study_title }"></td></tr>
	<tr align="center"><th style="background-color:#67aeca">스터디 작성자</th><td>
	    <input type="text" name="study_writer" 
		required="required" value="${study.study_writer }"></td></tr>
	<tr align="center"><th style="background-color:#67aeca">스터디 내용</th><td>
	   <textarea rows="5" cols="30" name="study_cont" required="required">${study.study_cont }</textarea></td></tr>
	<tr align="right"><td colspan="5">
	<input type="submit" value="확인">
</td>
</tr>
</table>
</form>

</body>
</html>