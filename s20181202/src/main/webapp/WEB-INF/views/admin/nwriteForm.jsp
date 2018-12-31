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
<title>공지 사항 입력</title>

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
<h2>공지 사항 등록</h2>
<c:if test="${msg!=null}">${msg}</c:if>
<form action="nwrite.do" method="post" >
<div>
<table style="margin-left:auto; margin-right:auto" >
	<h4>새로운 공지사항을 등록합니다</h4>
	<tr align="center">
		<th style="background-color:#67aeca" >스터디 종류</th>
		<td>
			<input type = "hidden" name = "study_warn" value = "0" />
			<input type = "hidden" name = "study_state" value = "0" />
			<input type = "hidden" name = "member_no" value = "0" />
			<select name="study_type"  required="required">
			    <option value="">    </option>
			    <option value="공지">공지</option>
			    <option value="취업">취업</option>
			    <option value="어학">어학</option>
			</select>
		</td>
	</tr>
	<tr text-align="center">
		<th style="background-color:#67aeca ">스터디 제목</th>
		<td>
			<input type="text" name="study_title" required="required" >
		</td>
	</tr>
	
	<tr align="center">
		<th align="center" style="background-color:#67aeca ">스터디 내용 </th>
		<td>
			<textarea rows="10" cols="40" required="required" name="study_cont" required="required"></textarea>
		</td>
	</tr>
	<tr align="right">
	<td colspan="2">
	
		<input type="reset" value="등록 취소"  >
		<input type="submit" value="등록 완료"  >
	
	</td>
	</tr>
	</table>
	</div>
	</form>

</body>
</html>