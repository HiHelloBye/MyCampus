<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%
	int member_no = (Integer)session.getAttribute("member_no");
	int member_grade = (Integer)session.getAttribute("member_grade");
	String member_nick = (String)session.getAttribute("member_nick");	 
	System.out.println("member_no_cont->"+member_no);
	System.out.println("member_nick_cont->"+member_nick);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="../cssStudy/assets/css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript" src="../smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
function itemChange(){
		
	var k = ["인적성","면접","기타"];
	var f = ["영어","일본어","중국어","기타"];
		
	var selectItem = $("#select1").val();
		
	var changeItem;
		
	if(selectItem == "취업"){
		changeItem = k;
	}
	else if(selectItem == "어학"){
		changeItem = f;
	}
		
	$('#select2').empty();
		
	for(var count = 0; count < changeItem.length; count++){                
		if(selectItem == "어학") {
			var option = $("<option value="+f[count]+">" + changeItem[count] + "</option>");
			$('#select2').append(option);
		}
		else {
			var option = $("<option value="+k[count]+">" + changeItem[count] + "</option>");
			$('#select2').append(option);
		}
	}
}
</script>
<script type="text/javascript">

$(function() {
	//전역변수선언
	var editor_object = [];
	var content = '${content }';

	// Editor Setting
	nhn.husky.EZCreator.createInIFrame({
	oAppRef : editor_object, // 전역변수 명과 동일해야 함.
	elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
	sSkinURI : "../smarteditor/SmartEditor2Skin.html", // Editor HTML
	htParams : {
		// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseToolbar : true,
		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,
		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true, 
	},
	fOnAppLoad : function() {
			editor_object.getById["smarteditor"].exec("PASTE_HTML", [content])
		},
	fCreator : "createSEditor2" // SE2BasicCreator.js 메소드명이니 변경 금지 X
});

// 필수값 Check
function validation(){
	var contents = $.trim(editor_object[0].getContents());
	if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
		alert("내용을 입력하세요.");
		editor_object.getById['smarteditor'].exec('FOCUS');
		return false;
	}

	return true;
}
// 전송버튼 클릭이벤트
$("#savebutton").click(function(){
	//if(confirm("저장하시겠습니까?")) {
		// id가 smarteditor인 textarea에 에디터에서 대입
		editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
		// 이부분에 에디터 validation 검증
		if(validation()) {
			$("#frm").submit();
		}
	//}
})
});

</script>
<style>
form input[type="text"],
	form input[type="email"]
	input[type="password"],
	form select,
	form textarea {
		-moz-transition: background-color 0.25s ease-in-out;
		-webkit-transition: background-color 0.25s ease-in-out;
		-ms-transition: background-color 0.25s ease-in-out;
		transition: background-color 0.25s ease-in-out;
		-webkit-appearance: none;
		display: block;
		border: 0;
		background: #e8e8e8;
		width: 50%;
		box-shadow: inset 2px 2px 0px 0px rgba(0, 0, 0, 0.1);
		border-radius: 4px;
		line-height: 1.25em;
		padding: 0.75em 1em 0.75em 1em;
	}
</style>
</head>
<body>
<c:if test="${msg!=null }">${msg }</c:if>
<form action="studyUpdate.do" method="post">
	<input type="hidden" name="study_no"value="${study.study_no }">
<!-- 	<input type="hidden" name="study_type"value=""> -->
	
	<input type="hidden" name="study_warn"value="${study.study_warn }">
	<input type="hidden" name="study_state"value="${study.study_state }">	
	<table>

		<tr>
			<th  style="width:100px;">제목 : </th><td><input type="text" name="study_title"value="${study.study_title }"maxlength="50"required="required"></td>
		</tr>
			<tr>
			<th>종류 : </th><td><input type="hidden" name="study_writer" value="${sessionScope.member_nick }">   
			<select name="study_type" id="select1"required="required"onchange="itemChange()">
				<option value="">선택</option>			
				<option value="취업">취업</option>
				<option value="어학">어학</option>
			</select>
			<select id="select2" name="study_subtype"required="required">
					  <option>선택해주세요</option>
			</select>		
			</td>
		</tr>
		<tr>
			<th style="vertical-align:top;">내용 : </th><td><!-- <textarea style="resize: none;" name="study_cont"rows="4" cols="50"required="required"></textarea> -->
				<textarea name="study_cont" id="smarteditor" rows="10" cols="100" style="width:766px; height:412px;"required="required">${study.study_cont }</textarea></td>
		</tr>
		
		<tr>
			<th></th><td><input type="submit" value="확인"id="savebutton"></td>
		</tr>	
	</table>

</form>

</body>
</html>