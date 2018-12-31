<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import ="java.net.URLEncoder" %>
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
	 int member_no = (Integer)session.getAttribute("member_no");
	 int member_grade = (Integer)session.getAttribute("member_grade");
	 String member_nick = (String)session.getAttribute("member_nick");	 
	 System.out.println("member_no_cont->"+member_no);
	 System.out.println("member_nick_cont->"+member_nick);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

#myDiv img
{
  max-width:100%; 
  max-height:auto;
  margin:auto;
  display:block;
}
#myPro img{
	  width:40px; 
	  height:40px;
	  margin:auto;
	  display:inline-block;
}
#list9 .arrow{
	  width:20px; 
	  height:20px;
	  margin:auto;
	  display:inline-block;
}
#list9 img{
	  width:50px; 
	  height:50px;
	  margin:auto;
	  display:inline-block;
}
</style>
<link href="css/assets/css/main.css" rel="stylesheet" type="text/css">
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
</head>
<body>
	<c:if test="${study.study_state==1}">
	<p>삭제된 글 입니다.</p>
	</c:if>
	
	
	<c:if test="${study.study_state==0}">
	<table style="width:1000px;">	
		<tr>
			<td>${study.study_title }</td>
		</tr>
		<tr>
			<td id="myPro"><p><img src="${study.member_photo}">${study.study_writer }</p></td>
		</tr>
		<tr id="myDiv">
			<td>${study.study_cont}</td>
		</tr>
		<tr>
			<td><input type="button" value="목록"
				onclick="location.href='StudyList.do'"> 
				<c:if test="${sessionScope.member_nick ==study.study_writer || '관리자'==sessionScope.member_nick}">
				<input type="button"
				value="수정"
				onclick="location.href='StudyUpdateForm.do?study_no=${study.study_no}'">
				<input type="button" value="삭제"
				onclick="location.href='updateState.do?study_no=${study.study_no}'"></c:if></td>
		</tr>

		<tr>
			<td colspan="2"><c:if test="${prevStudy!=null }">
					<a href="StudyContent.do?study_no=${prevStudy }">이전글</a>
				</c:if> <c:if test="${prevStudy==null }">
				</c:if>&nbsp;&nbsp; <c:if test="${nextStudy!=null }">
					<a href="StudyContent.do?study_no=${nextStudy }">다음글</a>
				</c:if> <c:if test="${nextStudy==null }">
				</c:if></td>
		</tr>
	</table>
	
	
	
	
	<form name="frm" id="writeCommentForm" method="post">
		<table>
			<tr>
				<td>${sessionScope.member_nick }</td>
				<td><input type="hidden" name="study_no"
					value="${study.study_no}"> <input type="hidden"
					name="comm_writer" value="${sessionScope.member_nick }">  <textarea id="input1"
						name="comm_cont" required="required" rows="4" cols="100"
						style="resize: none;"></textarea>
						 <br> <div>공개 <input type="radio"
					name="comm_wrt" value="1" checked="checked" required> 비공개 <input
					type="radio" name="comm_wrt" value="0"></div>					
				</td>
				<td><button type="button" id="button1" onclick="writeCmt()">댓글 쓰기</button>
				<!-- <input type="button" value="팝업창 호출" onclick="showPopup();" /> -->
				<a href="javascript:popupOpen();" > 열려라 팝업창! </a>

				</td>
			</tr>


			<c:forEach var="studyComm" items="${studyComments }">
				<c:if test="${studyComm.comm_type==1 }">
					<tr id="list9">
						<td><p><img src="${studyComm.member_photo}">${studyComm.comm_writer }</p></td>
						<td><c:if test="${studyComm.bstep > 0}">
								<img src='../resources/icon/arrow.png' alt="" width="15" class="arrow">
							</c:if>${studyComm.comm_cont }
							<div id="hClose01${studyComm.comm_no }" style="display: none;">
								<hr class="major">
								<textarea name="comm_cont" id="input2${studyComm.comm_no }"
									rows="4" cols="100" style="resize: none;">${studyComm.comm_cont }</textarea>
								<br> 공개 <input type="radio" name="comm_type2" value="1"<c:if test="${studyComm.comm_type == 1}">checked="checked"</c:if>
									required="required"> 비공개 <input type="radio"
									name="comm_type2" value="0" required="required" <c:if test="${studyComm.comm_type == 0}">checked="checked"</c:if>>
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
								<br> 공개 <input type="radio" name="comm_type3" value="1"checked="checked"
									required="required"> 비공개 <input type="radio"
									name="comm_type3" value="0" required="required">									
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
							value="${studyComm.bstep}">
							<c:if test="${'관리자'==sessionScope.member_nick}">
							<input type="button"
							value="완전삭제" style="float: right"
							onclick="studyCompDelete(${studyComm.comm_no })"
							class="button small"> </c:if>
							<c:if test="${sessionScope.member_nick==studyComm.comm_writer }">
							<input type="button" value="삭제"
							style="float: right"
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
							</div></c:if>
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
								<br> 공개 <input type="radio" name="comm_type2" value="1"<c:if test="${studyComm.comm_type == 1}">checked="checked"</c:if>>
									required="required"> 비공개 <input type="radio"<c:if test="${studyComm.comm_type == 0}">checked="checked"</c:if>>
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
								<br> 공개 <input type="radio" name="comm_type3" value="1"
									required="required"> 비공개 <input type="radio"
									name="comm_type3" value="0" required="required">
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
							value="${studyComm.bstep}"> 
							<c:if test="${'관리자'==sessionScope.member_nick}">
							<input type="button"
							value="완전삭제" style="float: right"
							onclick="studyCompDelete(${studyComm.comm_no })"
							class="button small"></c:if>
							<c:if test="${sessionScope.member_nick==studyComm.comm_writer }">
							<input type="button" value="삭제"
							style="float: right"
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
							</div></c:if>
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
	<!-- <a onclick="window.open('insertWarningForm.do','', 'width=482, height=252')">신고</a> -->
	<c:if test="${sessionScope.member_nick != study.study_writer }">
	<a onclick="return confirm('이 글을 정말로 신고하시겠습니까?')"
		href="insertWarning.do?type_no=1&study_leceval=${study.study_no }&study_no=${study.study_no}&member_no=11&warn_state=1">신고</a></c:if>
	<%-- <c:if test="${msg!=null}">${msg}</c:if>
	<c:if test="${msg1!=null}">${msg1}</c:if> --%>
	</c:if>
	
	
	
	
	
	<c:set var="study" value="${study.study_title }" />
<%
	String study_no = request.getParameter("study_no");
	String study_title = pageContext.getAttribute("study").toString();
	Cookie cook = new Cookie(URLEncoder.encode("item"+study_title,("utf-8")), URLEncoder.encode(study_no,"utf-8")); 
	cook.setMaxAge(60*60);
	response.addCookie(cook);
%>
</body>
</html>