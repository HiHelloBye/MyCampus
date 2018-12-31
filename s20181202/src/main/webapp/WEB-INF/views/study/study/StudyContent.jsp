<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%
	String context = request.getContextPath();
	System.out.println("context->" + context);
%>
<%
	int member_no = (Integer) session.getAttribute("member_no");
	int member_grade = (Integer) session.getAttribute("member_grade");
	String member_nick = (String) session.getAttribute("member_nick");
	System.out.println("member_no_cont->" + member_no);
	System.out.println("member_nick_cont->" + member_nick);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../cssStudy/assets/css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">	   
 function writeCmt(){
	//alert("writeCmt");
	//console.log("writeCmt Run");
	//var form = document.getElementById("writeCommentForm");    
   	var study_no = frm.study_no.value;
    var comm_cont = $('#input1').val();
    var comm_type = $('input[name=comm_wrt]:checked').val();
    

    //var comm_no = form.comm_no.value;
    var comm_writer = frm.comm_writer.value;
    
    //alert("study_no"+study_no);
    //alert("comm_cont"+comm_cont);
    alert("comm_writer"+comm_writer);
        
	$.ajax({
		url:"<%=context%>/sample/writeCmt.do",		
		data:{
			"study_no": study_no,
			"comm_writer" :comm_writer,
			"comm_cont" : comm_cont,
			"comm_type" : comm_type
			 },
		dataType:'json',
		success:function(data){
			alert(".ajax getDept Data"+data);  
			var jsondata = JSON.stringify(data);//stringify json으로 바꿔줌
			alert("jsondata->"+jsondata);
			alert('완성');
			location.reload();
		}
	});
};
</script>
<script type="text/javascript">	  
 function studyCommDelete(comm_no) {
	alert('comm_no'+comm_no);
	 $.ajax({
			url : "<%=context%>/sample/studyCommDelete.do",
			data : {
				comm_no : comm_no
			},		
			dataType:'json',
			success : function(data) {				
				alert('완성');
				location.reload();
			}
		});
	};
 
 function studyCommUpdate(comm_no) {
	var study_no = frm.study_no.value;
	var comm_cont = $('#input2'+comm_no).val();
	var comm_type = $('input[name=comm_type2]:checked').val();
	alert('comm_type'+comm_type);
	alert('comm_cont'+comm_cont);
	alert('study_no'+study_no);
	alert('comm_no'+comm_no);
	 $.ajax({
			url : "<%=context%>/sample/studyCommUpdate.do",
			data : {
				comm_no : comm_no,
				study_no : study_no,
				comm_cont : comm_cont,
				comm_type : comm_type
			},		
			dataType:'json',
			success : function(data) {				
				var jsondata = JSON.stringify(data);
				alert('jsondata'+jsondata);
				console.log("comment를 정상적으로 수정!!");
				alert('완성');
				location.reload();
			}
		});
	};

	function studyCommUpdateForm(comm_no,study_no) {
		alert('comm_no'+comm_no);
		alert('study_no'+study_no);		
		var comm_cont = $('#comm_cont'+comm_no).val()
		
		alert('comm_cont'+comm_cont);
		$.ajax({
			url : "<%=context%>/sample/studyCommUpdateForm.do",
			data : {
				comm_no : comm_no,
				study_no : study_no,
				comm_cont : comm_cont
			},
			dataType:'json',
			success : function(data) {
				var jsondata = JSON.stringify(data);
				console.log("comment를 정상적으로 수정!!");
				alert('jsondata'+jsondata);			
			}
		});
	};

function studyCompDelete(comm_no) {
		alert('comm_no'+comm_no);
		 $.ajax({
				url : "<%=context%>/sample/studyCompDelete.do",
				data : {
					comm_no : comm_no
				},		
				dataType:'json',
				success : function(data) {						
					alert('완성');
					location.reload();
				}
			});
		}

function paragraph_toggle(obj) {
	if (obj.style.display == 'none') 
	    obj.style.display = 'block';
	else if (obj.style.display == 'block')
	    obj.style.display = 'none';
}
  
 function writeReCmt(comm_no){
 	var study_no = frm.study_no.value;
    var comm_cont = $('#input3'+comm_no).val();
    var comm_type = $('input[name=comm_type3]:checked').val();
	var comm_writer = frm.comm_writer.value;
	var bgroup = $('#bgroup'+comm_no).val();
   	var bstep = $('#bstep'+comm_no).val();
    alert("bstep"+bstep);
    alert("comm_cont"+comm_cont);
    alert("bgroup"+bgroup);
    alert("comm_no"+comm_no);
    alert("comm_type"+comm_type);
        
	$.ajax({
		url:"<%=context%>/sample/writeReCmt.do",		
		data:{
			"study_no": study_no,
			"comm_writer" :comm_writer,
			"comm_cont" : comm_cont,
			"comm_type" : comm_type,
			"bstep" : bstep,
			"bgroup" : bgroup,
			"comm_no" : comm_no
			 },
		dataType:'json',
		success:function(data){
			alert(".ajax getDept Data"+data);  			
			location.reload();
		}
	});
} 
 </script>
<script type="text/javascript">
	function popupOpen(){ 
		 window.open("a.do", "a", "width=700, height=540, left=100, top=50"
				 ); 
		 }
</script>
<style>
input[type="checkbox"], input[type="radio"] {
	-moz-appearance: none;
	-webkit-appearance: none;
	-ms-appearance: none;
	appearance: none;
	display: block;
	float: left;
	margin-right: -2em;
	opacity: 0;
	width: 1em;
	z-index: -1;
}

input[type="checkbox"]+label, input[type="radio"]+label {
	text-decoration: none;
	color: #7f888f;
	cursor: pointer;
	display: inline-block;
	font-size: 1em;
	font-weight: 400;
	padding-left: 2.4em;
	padding-right: 0.75em;
	position: relative;
}

input[type="checkbox"]+label:before, input[type="radio"]+label:before {
	-moz-osx-font-smoothing: grayscale;
	-webkit-font-smoothing: antialiased;
	font-family: FontAwesome;
	font-style: normal;
	font-weight: normal;
	text-transform: none !important;
}

input[type="checkbox"]+label:before, input[type="radio"]+label:before {
	background: #ffffff;
	border-radius: 0.375em;
	border: solid 1px rgba(210, 215, 217, 0.75);
	content: '';
	display: inline-block;
	height: 1.65em;
	left: 0;
	line-height: 1.58125em;
	position: absolute;
	text-align: center;
	top: 0;
	width: 1.65em;
}

input[type="checkbox"]:checked+label:before, input[type="radio"]:checked+label:before
	{
	background: #3d4449;
	border-color: #3d4449;
	color: #ffffff;
	content: '\f00c';
}

input[type="checkbox"]:focus+label:before, input[type="radio"]:focus+label:before
	{
	border-color: #f56a6a;
	box-shadow: 0 0 0 1px #f56a6a;
}

input[type="checkbox"]+label:before {
	border-radius: 0.375em;
}

input[type="radio"]+label:before {
	border-radius: 100%;
}

#content img {
	max-width: 100%;
	max-height: auto;
	margin: auto;
	display: block;
}
#myPro img {
	width: 40px;
	height: 40px;
	margin: auto;
	display: inline-block;
}

#list9 .arrow {
	width: 20px;
	height: 20px;
	margin: auto;
	display: inline-block;
}

#list9 img {
	width: 50px;
	height: 50px;
	margin: auto;
	display: inline-block;
}
</style>
</head>
<body>
	<c:if test="${study.study_state==1}">
		<p>삭제된 글 입니다.</p>
	</c:if>


	<c:if test="${study.study_state==0}">

		<section id="main">
			<div class="container">
				<div class="row">
					<div id="content" class="col-8 col-12-medium">
						<article class="box post">
							<header id="myPro">
								<h2>${study.study_title }</h2><br>
								<span><img src="${study.member_photo}">${study.study_writer }</span>
							</header>							
							
							
							<p>${study.study_cont}</p>
							
							<input type="button" value="목록" class="button icon fa-file"
								onclick="location.href='StudyList.do'">
							<c:if
								test="${sessionScope.member_nick ==study.study_writer || '관리자'==sessionScope.member_nick}">
								<input type="button" value="수정" class="button icon fa-file"
									onclick="location.href='StudyUpdateForm.do?study_no=${study.study_no}'">
								<input type="button" value="삭제" class="button icon fa-file"
									onclick="location.href='updateState.do?study_no=${study.study_no}'">
							</c:if>
							<c:if test="${sessionScope.member_nick != study.study_writer }">
								<a onclick="return confirm('이 글을 정말로 신고하시겠습니까?')"
									class="button icon fa-file"
									href="insertWarning.do?type_no=1&study_leceval=${study.study_no }&study_no=${study.study_no}&member_no=11&warn_state=1">신고</a>
							</c:if>
						</article>
					</div>

					<div id="sidebar" class="col-4 col-12-medium">

						<section>
							<h3>최근 본 글 목록</h3>
							<%
								//쿠키 얻어오기
									Cookie[] cookie = request.getCookies();
									if (cookie != null) {
										for (int i = 0; i < cookie.length; i++) {
											//전송된 쿠키이름 얻어오기
											String name = cookie[i].getName();
											//쿠키 이름에 item이 포함되어 있다면
											if (name.indexOf("item") != -1) {
												//해당 value 얻어오기
												String value = cookie[i].getValue();
												//euc-kr 로 인코딩 되어 있으므로 다시 euc-kr 로 디코딩 하여야 한다.
												String item = URLDecoder.decode(value, "utf-8");
												//out.println(cook[i].getName()+"<br/>");
												//out.println("<a id='"+cook[i].getValue()+"'href='StudyContent.do?study_no="+cook[i].getValue()+"'>"+URLDecoder.decode(cook[i].getName(),"utf-8")+"</a><br/>");
												out.println("<a id='" + cookie[i].getValue() + "'href='StudyContent.do?study_no="
														+ cookie[i].getValue() + "'>"
														+ URLDecoder.decode(cookie[i].getName(), "utf-8").substring(4) + "</a><br/>");
											}
										}

									} else {
										out.println("최근에 본 상품이 없습니다.");
									}
							%>
						</section>
					</div>





				</div>
			</div>
		</section>







		<form name="frm" id="writeCommentForm" method="post">
			<table>
				<tr>
					<td>${sessionScope.member_nick }</td>
					<td><input type="hidden" name="study_no"
						value="${study.study_no}"> <input type="hidden"
						name="comm_writer" value="${sessionScope.member_nick }"> <textarea
							id="input1" name="comm_cont" required="required" rows="4"
							cols="100" style="resize: none;"></textarea> <br>
						<div>
							<input type="radio" name="comm_wrt" value="1" checked="checked"
								required id="radio1"> <label for="radio1">공개</label> <input
								type="radio" name="comm_wrt" value="0" id="radio2"><label
								for="radio2">비공개</label>
						</div></td>
					<td><button type="button" id="button1" onclick="writeCmt()">댓글
							쓰기</button>
						<br>
					<br> <a href="javascript:popupOpen();"
						class="button icon fa-file">이모티콘</a></td>
				</tr>


				<c:forEach var="studyComm" items="${studyComments }">
					<c:if test="${studyComm.comm_type==1 }">
						<tr id="list9">
							<td><p>
									<img src="${studyComm.member_photo}">${studyComm.comm_writer }</p></td>
							<td><c:if test="${studyComm.bstep > 0}">
									<img src='../resources/icon/arrow.png' alt="" width="15"
										class="arrow">
								</c:if>${studyComm.comm_cont }
								<div id="hClose01${studyComm.comm_no }" style="display: none;">
									<hr class="major">
									<textarea name="comm_cont" id="input2${studyComm.comm_no }"
										rows="4" cols="100" style="resize: none;">${studyComm.comm_cont }</textarea>
									<br> <input type="radio" name="comm_type2" value="1"
										<c:if test="${studyComm.comm_type == 1}">checked="checked"</c:if>
										required="required" id="radio3"> <label for="radio3">공개</label>
									<input type="radio" name="comm_type2" value="0"
										required="required"
										<c:if test="${studyComm.comm_type == 0}">checked="checked"</c:if>
										id="radio4"> <label for="radio4">비공개</label>
									<div style="float: right;">
										<input type="button" value="수정"
											onclick="studyCommUpdate(${studyComm.comm_no })"> <a
											onclick="paragraph_toggle(document.getElementById('hOpen01${studyComm.comm_no }')); 
										paragraph_toggle(document.getElementById('hClose01${studyComm.comm_no }')); return false;"
											href="#"> <input type="button" value="취소"
											class="button samll">
										</a>
									</div>
								</div>
								<div id="hClose02${studyComm.comm_no }" style="display: none;">
									<textarea name="comm_cont" id="input3${studyComm.comm_no }"
										rows="3" cols="100" style="resize: none;"></textarea>
									<br> 공개 <input type="radio" name="comm_type3" value="1"
										checked="checked" required="required"> 비공개 <input
										type="radio" name="comm_type3" value="0" required="required">
									<div style="float: right;">
										<div style="float: right">
											<input type="button" value="완료"
												onclick="writeReCmt(${studyComm.comm_no})"
												class="button small"> <a
												onclick="paragraph_toggle(document.getElementById('hOpen02${studyComm.comm_no }')); 
																				paragraph_toggle(document.getElementById('hClose02${studyComm.comm_no }')); return false;"
												href="#"> <input type="button" value="취소"
												class="button small">
											</a>
										</div>
									</div></td>
							<td><input type="hidden" id="comm_cont${studyComm.comm_no }"
								name="comm_cont" value="${studyComm.comm_cont }"><input
								type="hidden" name="bgroup" id="bgroup${studyComm.comm_no}"
								value="${studyComm.bgroup}"><input type="hidden"
								name="bstep" id="bstep${studyComm.comm_no}"
								value="${studyComm.bstep}"> <c:if
									test="${'관리자'==sessionScope.member_nick}">
									<input type="button" value="완전삭제" style="float: right"
										onclick="studyCompDelete(${studyComm.comm_no })"
										class="button small">
								</c:if> <c:if
									test="${sessionScope.member_nick==studyComm.comm_writer }">
									<input type="button" value="삭제" style="float: right"
										onclick="studyCommDelete(${studyComm.comm_no })"
										class="button small">&nbsp;
							<div id="hOpen01${studyComm.comm_no }"
										style="float: right; display: block;">
										<a
											onclick="paragraph_toggle(document.getElementById('hOpen01${studyComm.comm_no }')); 
					paragraph_toggle(document.getElementById('hClose01${studyComm.comm_no }')); return false;"
											href="#"> <input type="button" value="수정"
											id="studyCommUpdateForm${studyComm.comm_no }"
											style="float: right"
											onclick="studyCommUpdateForm(${studyComm.comm_no},${study.study_no})"
											class="button small"></a>
									</div>
								</c:if>
								<div id="hOpen02${studyComm.comm_no }"
									style="float: right; display: block;">
									<input type="button"
										onclick="paragraph_toggle(document.getElementById('hOpen02${studyComm.comm_no }')); 
								paragraph_toggle(document.getElementById('hClose02${studyComm.comm_no }')); return false;"
										value="답글" class="button small">
								</div></td>
						</tr>
					</c:if>

					<c:if test="${studyComm.comm_type==0}">
						<tr id="list1">
							<td>비밀</td>
							<td><c:if test="${studyComm.bstep > 0}">
									<img src='../icon/arrow.png' alt="" width="15">
								</c:if>비밀 댓글입니다
								<div id="hClose01${studyComm.comm_no }" style="display: none;">
									<hr class="major">
									<textarea name="comm_cont" id="input2${studyComm.comm_no }"
										rows="4" cols="100" style="resize: none;">${studyComm.comm_cont }</textarea>
									<br> 공개 <input type="radio" name="comm_type2" value="1"
										<c:if test="${studyComm.comm_type == 1}">checked="checked"</c:if>
										required="required"> 비공개 <input type="radio"
										<c:if test="${studyComm.comm_type == 0}">checked="checked"</c:if>
										name="comm_type2" value="0" required="required">
									<div style="float: right;">
										<input type="button" value="수정"
											onclick="studyCommUpdate(${studyComm.comm_no })"> <a
											onclick="paragraph_toggle(document.getElementById('hOpen01${studyComm.comm_no }')); 
										paragraph_toggle(document.getElementById('hClose01${studyComm.comm_no }')); return false;"
											href="#"> <input type="button" value="취소"
											class="button samll">
										</a>
									</div>
								</div>
								<div id="hClose02${studyComm.comm_no }" style="display: none;">
									<textarea name="comm_cont" id="input3${studyComm.comm_no }"
										rows="3" cols="100" style="resize: none;"></textarea>
									<br>
									<input type="radio" name="comm_type3" value="1"
										required="required" id="radio2"><label for="radio2">비공개</label><input
										type="radio" name="comm_type3" value="0" required="required"
										id="radio2"><label for="radio2">비공개</label>
									<div style="float: right">
										<input type="button" value="완료"
											onclick="writeReCmt(${studyComm.comm_no})"
											class="button small"> <a
											onclick="paragraph_toggle(document.getElementById('hOpen02${studyComm.comm_no }')); 
																				paragraph_toggle(document.getElementById('hClose02${studyComm.comm_no }')); return false;"
											href="#"> <input type="button" value="취소"
											class="button small">
										</a>
									</div>
								</div></td>
							<td><input type="hidden" id="comm_cont${studyComm.comm_no }"
								name="comm_cont" value="${studyComm.comm_cont }"><input
								type="hidden" name="bgroup" id="bgroup${studyComm.comm_no}"
								value="${studyComm.bgroup}"><input type="hidden"
								name="bstep" id="bstep${studyComm.comm_no}"
								value="${studyComm.bstep}"> <c:if
									test="${'관리자'==sessionScope.member_nick}">
									<input type="button" value="완전삭제" style="float: right"
										onclick="studyCompDelete(${studyComm.comm_no })"
										class="button small">
								</c:if> <c:if
									test="${sessionScope.member_nick==studyComm.comm_writer }">
									<input type="button" value="삭제" style="float: right"
										onclick="studyCommDelete(${studyComm.comm_no })"
										class="button small">&nbsp;
							<div id="hOpen01${studyComm.comm_no }"
										style="float: right; display: block;">
										<a
											onclick="paragraph_toggle(document.getElementById('hOpen01${studyComm.comm_no }')); 
					paragraph_toggle(document.getElementById('hClose01${studyComm.comm_no }')); return false;"
											href="#"> <input type="button" value="수정"
											id="studyCommUpdateForm${studyComm.comm_no }"
											style="float: right"
											onclick="studyCommUpdateForm(${studyComm.comm_no},${study.study_no})"
											class="button small"></a>
									</div>
								</c:if>
								<div id="hOpen02${studyComm.comm_no }"
									style="float: right; display: block;">
									<input type="button"
										onclick="paragraph_toggle(document.getElementById('hOpen02${studyComm.comm_no }')); 
								paragraph_toggle(document.getElementById('hClose02${studyComm.comm_no }')); return false;"
										value="답글" class="button small">
								</div></td>
						</tr>

					</c:if>
					<%--  <c:if test="${studyComm.comm_type==3}">
		<tr id="list2">
		<td>   </td><td> 삭제된 댓글입니다</td><td></td>		
		</tr>
		</c:if>  --%>
				</c:forEach>

			</table>
		</form>

	</c:if>





	<c:set var="study" value="${study.study_title }" />
	<%
		String study_no = request.getParameter("study_no");
		String study_title = pageContext.getAttribute("study").toString();
		Cookie cook = new Cookie(URLEncoder.encode("item" + study_title, ("utf-8")),
				URLEncoder.encode(study_no, "utf-8"));
		cook.setMaxAge(60 * 60);
		response.addCookie(cook);
	%>

</body>
</html>