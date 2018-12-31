<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> 
<!DOCTYPE HTML>
<!--
	Story by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)

	Note: Only needed for demo purposes. Delete for production sites.
-->
<html>
	<head>
		<title>Story by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="cssEval/assets/css/sub.css?ver=1" />
		<noscript><link rel="stylesheet" href="cssEval/assets/css/noscript.css" /></noscript>
		
		<!-- <link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript> -->
	</head>
	<style>
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>

	$(document).ready(function(){
		$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  return false;
			});
	});

</script>
<script>
	function getScore(num){
		document.getElementById("lec_score").value=event.target.innerHTML;
	}
</script>
<!-- <script>
	var count = 0;	
	function lecwarn(){
		
		count++;
		if(count==10){
			alert("10번 누름");
		}
	}
</script> -->
<script>
var oTbl;
//Row 추가
function insRow() {
  oTbl = document.getElementById("addTable");
  var oRow = oTbl.insertRow();
  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
  var oCell = oRow.insertCell();

  //삽입될 Form Tag
  var frmTag = "<input type=text name=que_Ex style=width:350px; height:20px;> ";
  frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
  oCell.innerHTML = frmTag;
}
//Row 삭제
function removeRow() {
  oTbl.deleteRow(oTbl.clickedRowIndex);
}

function frmCheck()
{
  var frm = document.form;
  
  for( var i = 0; i <= frm.elements.length - 1; i++ ){
     if( frm.elements[i].name == "que_Ex"+i )
     {
         if( !frm.elements[i].value ){
             alert("텍스트박스에 값을 입력하세요!");
                 frm.elements[i].focus();
	 return;
          }
      }
   }
 }
</script>
<script>
	$(document).ready(function(){
		$('#frmLecEval').submit(function() {
			if($("#att_term_eval option:selected").val()!="수강학기선택"){
				 document.frmLecEval.submit();
			}else{
				alert("좀 더 성의있는 강의평을 작성해주세요 :)");
				return false;
			}
	      });

	  });
</script>
<script>
	$(document).ready(function(){
		$('#frmExamInfo').submit(function() {
			if(($("#att_term_exam option:selected").val()!="수강학기선택")&&($("#exam_term_exam option:selected").val())!="선택"){
				 document.frmLecEval.submit();
			}else{
				alert("좀 더 성의있는 시험정보를 작성해주세요 :)");
				return false;
			}
	      });

	  });
</script>
<script>
var arrInput = new Array(0);
  var arrInputValue = new Array(0);
 
function addInput() {
  arrInput.push(arrInput.length);
  arrInputValue.push("");
  display();
}
 
function display() {
  document.getElementById('parah').innerHTML="";
  for (intI=0;intI<arrInput.length;intI++) {
    document.getElementById('parah').innerHTML+=createInput(arrInput[intI], arrInputValue[intI]);
  }
}
 
function saveValue(intId,strValue) {
  arrInputValue[intId]=strValue;
}  
 
function createInput(id,value) {
  return "<input type='text'name='que_Ex'  id='test "+ id +"' onChange='javascript:saveValue("+ id +",this.value)' value='"+ 
 
value +"'><br>";
}
 
function deleteInput() {
  if (arrInput.length > 0) { 
     arrInput.pop(); 
     arrInputValue.pop();
  }
  display(); 
}
</script>
	<body class="is-preload">
		<!--강의기본정보 -->
			<div id="wrapper" class="divided">
					<section class="wrapper style1 align-center">
						<div class="inner">
							<c:forEach var="lecEvalDetail" items="${lecEvalDetail }" begin="0" end="0">
							<h2>${lecEvalDetail.lec_name }</h2>
								교수명   : ${lecEvalDetail.prof_name }<br />
								개설학기   : ${lecEvalDetail.att_term }
							</c:forEach>
						</div>
					</section>
					
					<!-- 강의평 평점 및 기본정보 2 -->
					<section class="spotlight style1 orient-right content-align-left image-position-center onscroll-image-fade-in" id="first">
						<div class="content">
							<h3>강의평가 평균</h3>
							<c:forEach var="lecEvalDetail" items="${lecEvalDetail }" begin="0" end="0">
								<c:if test="${lecEvalAvgSc.lec_score > 0.0 && lecEvalAvgSc.lec_score<=0.5}">
									<h4><img src="resources/imgstar/star05.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h4>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 0.5 && lecEvalAvgSc.lec_score<=1.0}">
									<h2><img src="resources/imgstar/star1.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 1.0 && lecEvalAvgSc.lec_score<=1.5}">
									<h2><img src="resources/imgstar/star15.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 1.5 && lecEvalAvgSc.lec_score<=2.0}">
									<h2><img src="resources/imgstar/star2.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 2.0 && lecEvalAvgSc.lec_score<=2.5}">
									<h2><img src="resources/imgstar/star25.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 2.5 && lecEvalAvgSc.lec_score<=3.0}">
									<h2><img src="resources/imgstar/star3.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 3.0 && lecEvalAvgSc.lec_score<=3.5}">
									<h2><img src="resources/imgstar/star35.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 3.5 && lecEvalAvgSc.lec_score<=4.0}">
									<h2><img src="resources/imgstar/star4.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 4.0 && lecEvalAvgSc.lec_score<=4.5}">
									<h2><img src="resources/imgstar/star45.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 4.5 && lecEvalAvgSc.lec_score<=5.0}">
									<h2><img src="resources/imgstar/star5.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<br />
									과제 :${lecEvalAvgHw.lec_hw}<br />
									학점비율 : ${lecEvalAvgRat.lec_ratio}<br />
									시험횟수 : ${lecEvalAvgEx.lec_exam}<br />
									출결 : ${lecEvalAvgAtt.lec_attend}<br />
							</c:forEach>
						</div>
						<div class="image">
							<img src="resources/spotlight02.jpg" alt="" />
						</div>
					</section>
				<!-- 강의평 평점 및 기본정보 2 -->
				<%-- <section class="wrapper style1 align-center">
				<div class="inner">
				<div class="index align-left">
				<section>
				      <header>
						<h3>강의평가 평균</h3>
				      </header>
				<div class="content">
					<div class="box">
						<c:forEach var="lecEvalDetail" items="${lecEvalDetail }" begin="0" end="0">
							
								<c:if test="${lecEvalAvgSc.lec_score > 0.0 && lecEvalAvgSc.lec_score<=0.5}">
									<h2><img src="resources/imgstar/star05.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 0.5 && lecEvalAvgSc.lec_score<=1.0}">
									<h2><img src="resources/imgstar/star1.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 1.0 && lecEvalAvgSc.lec_score<=1.5}">
									<h2><img src="resources/imgstar/star15.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 1.5 && lecEvalAvgSc.lec_score<=2.0}">
									<h2><img src="resources/imgstar/star2.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 2.0 && lecEvalAvgSc.lec_score<=2.5}">
									<h2><img src="resources/imgstar/star25.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 2.5 && lecEvalAvgSc.lec_score<=3.0}">
									<h2><img src="resources/imgstar/star3.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 3.0 && lecEvalAvgSc.lec_score<=3.5}">
									<h2><img src="resources/imgstar/star35.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 3.5 && lecEvalAvgSc.lec_score<=4.0}">
									<h2><img src="resources/imgstar/star4.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 4.0 && lecEvalAvgSc.lec_score<=4.5}">
									<h2><img src="resources/imgstar/star45.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<c:if test="${lecEvalAvgSc.lec_score > 4.5 && lecEvalAvgSc.lec_score<=5.0}">
									<h2><img src="resources/imgstar/star5.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2>
								</c:if>
								<br />
									과제 :${lecEvalAvgHw.lec_hw}<br />
									학점비율 : ${lecEvalAvgRat.lec_ratio}<br />
									시험횟수 : ${lecEvalAvgEx.lec_exam}<br />
									출결 : ${lecEvalAvgAtt.lec_attend}<br />
						</c:forEach>
					</div>
				</div>
				</section>
				</div>
				</div>
				</section> --%>
				
				
				<!--강의평정보 조회-->
				<section class="wrapper style1 align-center">
					<div class="inner">
						<div class="index align-left">
							<section>
								<header>
									<h3>수강 후기</h3>
									실제 수강생들의 생생한 후기!<br/>
									아래에 수강 후기를 남겨주세요.
								</header>
								<div class="content">
									<c:forEach var="lecEvalDetail" items="${lecEvalDetail }">
										
											<c:if test="${lecEvalDetail.lec_score == 1.0}">
												<img src="resources/imgstar/star1.JPG" style="width:150px;">
											</c:if>
											<c:if test="${lecEvalDetail.lec_score == 2.0}">
												<img src="resources/imgstar/star2.JPG" style="width:150px;">
											</c:if>
											<c:if test="${lecEvalDetail.lec_score == 3.0}">
												<img src="resources/imgstar/star3.JPG" style="width:150px;">
											</c:if>
											<c:if test="${lecEvalDetail.lec_score == 4.0}">
												<img src="resources/imgstar/star4.JPG" style="width:150px;">
											</c:if>
											<c:if test="${lecEvalDetail.lec_score == 5.0}">
												<img src="resources/imgstar/star5.JPG" style="width:150px;">
											</c:if>
										<br />
											${lecEvalDetail.att_term } 
											<c:if test="${sessionScope.member_no != lecEvalDetail.member_no}">
												<a style="text-align:right;" onclick="confirm('이 글을 정말로 신고하시겠습니까?')" href="insertWarning.do?type_no=2&study_leceval=${lecEvalDetail.leceval_no }&lec_no=${lecEvalDetail.lec_no}&uni_no=${lecEvalDetail.uni_no}&member_no=<%=member_no %>&warn_state=1"><img src="resources/warning.jpg">신고</a>
											</c:if>
										
										<br />		
										
											${lecEvalDetail.lec_review }
									<hr />	
									
									</c:forEach>
									
									<!--강의평 작성하기-->
												<div class="more" onclick="this.innerHTML=(LecEval.style.display=='none')?'<h3><a>[닫기]</a></h3>':'<h3><a>[이 수업에 대한 강의평을 작성해주세요!]</a></h3>';LecEval.style.display=(LecEval.style.display=='none')?'block':'none';"><h3><a>[이 수업에 대한 강의평을 작성해주세요!]</a></h3></div>
												<div style="DISPLAY: none" id="LecEval">
												<!-- writeLecEval.do -->
												<form action="writeLecEval.do " method="post" name="frm" id="frmLecEval">
												<input type="hidden" value="1.0" name="lec_score" id="lec_score">	
												<input type="hidden" value="0" name="lec_warn" >	
												<input type="hidden" value="0" name="lec_state" >	
													 <c:forEach var="lecEvalDetail" items="${lecEvalDetail }">
													<input type="hidden" value="${lecEvalDetail.lec_no }" name="lec_no" />
													<input type="hidden" value="${lecEvalDetail.uni_no }" name="uni_no" />
													<input type="hidden" value="<%=member_no %>" name="member_no" readonly />
													</c:forEach>
													<table>
													
														<caption><h2>나의 수강후기</h2></caption>
														<tr>
															<td colspan="2"><h3>성적반영</h3></td>
														
														</tr>
														<tr>
															<td>과제</td>
															<td>
																<input type="radio" name="lec_hw" id="id1" checked="checked" value="보통"/> <label for="id1" required>보통</label>
																<input type="radio" name="lec_hw" id="id2"/> <label for="id2" value="많음">많음</label>
																<input type="radio" name="lec_hw" id="id3"/><label for="id3" value="없음"> 없음</label>
															</td>
														</tr>
														<tr>
															<td>학점비율</td>
															<td>
																<input type="radio" name="lec_ratio" id="id4" value="학점느님" /><label for="id4"  required> 학점느님</label>
																<input type="radio" name="lec_ratio" checked="checked" id="id5" value="비율채워줌" /><label for="id5"> 비율채워줌</label>
																<input type="radio" name="lec_ratio" id="id6" value="매우깐깐" /><label for="id6" > 매우깐깐</label>
																<input type="radio" name="lec_ratio" id="id7" value="F폭격기" /><label for="id7"> F폭격기</label>
															</td>
														</tr>
														<tr>
															<td>출결</td>
															<td>
																<input type="radio" name="lec_attend" id="id8" value="혼용" /><label for="id8" required> 혼용</label>
																<input type="radio" name="lec_attend" checked="checked" id="id9" value="직접호명" /><label for="id9"> 직접호명</label>
																<input type="radio" name="lec_attend" id="id10" value="지정좌석" /><label for="id10"> 지정좌석</label>
																<input type="radio" name="lec_attend" id="id11" value="전자출결" /><label for="id11"> 전자출결</label>
																<input type="radio" name="lec_attend" id="id12" value="반영안함" /><label for="id12"> 반영안함</label>
															</td>
														</tr>
														<tr>
															<td>시험횟수</td>
															<td>
																<input type="radio" name="lec_exam" id="id13" value="네번이상" /> <label for="id13" required>네번이상</label>
																<input type="radio" name="lec_exam" id="id14" value="세번" /><label for="id14"> 세번</label>
																<input type="radio" name="lec_exam" id="id15" value="두번"  checked="checked" /><label for="id15"> 두번</label>
																<input type="radio" name="lec_exam" id="id16" value="한번" /><label for="id16"> 한번</label>
																<input type="radio" name="lec_exam" id="id17" value="없음" /><label for="id17"> 없음</label>
															</td>
														</tr>
														
														<tr>
															<td><h3>총평</h3></td>
															<td>
															</td>
														</tr>
														<tr>
															<td>총점</td>
															<td>
																<!-- <input type="radio" name="lec_score" value="1.0" id="id18" /><label for="id18">  1.0</label>
																<input type="radio" name="lec_score" value="2.0" checked="checked" id="id19" /><label for="id19">  2.0</label>
																<input type="radio" name="lec_score" value="3.0" id="id20" /><label for="id20">  3.0</label>
																<input type="radio" name="lec_score" value="4.0" id="id21" /><label for="id21">  4.0</label>
																<input type="radio" name="lec_score" value="5.0" id="id22" /><label for="id22">  5.0</label>  -->
																<div class="starRev" id="starRev">
																	<span class="starR on" name="starRev" value="1.0" onclick="getScore(this)">1.0</span>
																	<span class="starR" name="starRev" value="2.0" onclick="getScore(this)">2.0</span>
																	<span class="starR" name="starRev" value="3.0" onclick="getScore(this)">3.0</span>
																	<span class="starR" name="starRev" value="4.0" onclick="getScore(this)">4.0</span>
																	<span class="starR" name="starRev" value="5.0" onclick="getScore(this)">5.0</span>
																</div> 
															</td>
														</tr>
														
														<tr>
															<td>수강학기</td>
															<td>
																<select name="att_term"  id="att_term_eval">
																  <option value="수강학기선택" selected="selected">수강학기선택</option>
																  <c:forEach var="lecTermList" items="${lecTermList}">
																  	<option value="${lecTermList.att_term }">${lecTermList.att_term }</option>
																  </c:forEach> 
																</select>
															</td>
														</tr>
														<tr>
															<td colspan="2">
																<textarea style="resize: none;" rows="5" cols="80" name="lec_review" placeholder="이 강의에 대한 총평을 작성해주세요.&#13;&#10;등록 후에는 수정 및 삭제가 불가능하므로 신중히 작성해주세요." required></textarea>
															</td>
														</tr>
														<tr>
															<td colspan="2" align="right">
																<input type="submit" value="작성완료">
															</td>
														</tr>
													</table> 
												</form>
												</div>
								</div>
								
							</section>	
						</div>
					</div>
				</section>
				<!-- Items -->
					<section class="wrapper style1 align-center">
						<div class="inner">
							<h2>시험후기</h2>
							아래에 시험후기를 작성해보세요!
							<div class="items style1 medium onscroll-fade-in">
								
							<c:forEach var="ExamInfoDetail" items="${ExamInfoDetail }">
								<section>
									<span class="icon style2 major fa-diamond"></span>
									<h3>${ExamInfoDetail.att_term }  ${ExamInfoDetail.exam_type }</h3>
									<div style="text-align:left;">
										<span style="color:rgb(103,174,202);">문제유형</span>
											${ExamInfoDetail.que_type}<br />
										<span style="color:rgb(103,174,202);">문제예시</span>
											${ExamInfoDetail.que_Ex}<br />
										<span style="color:rgb(103,174,202);">전략</span>
											${ExamInfoDetail.exam_strat}	<br />						
									</div>
								</section>
							</c:forEach>
								
								<!-- <section>
									<span class="icon style2 major fa-save"></span>
									<h3>Two</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-bar-chart"></span>
									<h3>Three</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-wifi"></span>
									<h3>Four</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-cog"></span>
									<h3>Five</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-paper-plane"></span>
									<h3>Six</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-desktop"></span>
									<h3>Seven</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-refresh"></span>
									<h3>Eight</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-hashtag"></span>
									<h3>Nine</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-bolt"></span>
									<h3>Ten</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-envelope"></span>
									<h3>Eleven</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-leaf"></span>
									<h3>Twelve</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section> -->
								
							</div>
							<!--시험정보 작성하기-->
							<div class="more" onclick="this.innerHTML=(ExamInfo.style.display=='none')?'<h3><a>[닫기]</a></h3>':'<h3><a>[이 수업에 대한 시험정보를 작성해주세요!]</a></h3>';ExamInfo.style.display=(ExamInfo.style.display=='none')?'block':'none';"><h3><a>[이 수업에 대한 시험정보를 작성해주세요!]</a></h3></div>
							<div style="DISPLAY: none" id="ExamInfo">
								<form action="writeExamInfo.do" method="post" name="frm" id="frmExamInfo">
									<c:forEach var="lecEvalDetail" items="${lecEvalDetail }">
										<input type="hidden" value="${lecEvalDetail.lec_no }" name="lec_no" />
										<input type="hidden" value="${lecEvalDetail.uni_no }" name="uni_no" />
										<input type="hidden" value="<%=member_no %>" name="member_no" readonly />
									</c:forEach>
									<table>
										<tr>
											<td>수강학기<select name="att_term" id="att_term_exam">
												<option value="수강학기선택" selected="selected">수강학기선택</option>
												<c:forEach var="lecTermList" items="${lecTermList}">
													<option value="${lecTermList.att_term }">${lecTermList.att_term }</option>
												</c:forEach>
											</select></td>
											<td>시험종류
											<select name="exam_type" id="exam_term_exam">
												<option value="선택" selected="selected">선택</option>
												<option value="중간고사">중간고사</option>
												<option value="기말고사">기말고사</option>
											</select>
										</td>
										</tr>
									</table>	
									<table>
									<tr><td>문제유형(복수선택가능)</td>		
										<td>
											<input type="checkbox" name="que_type" value="객관식" id="cid1"><label for="cid1">객관식</label>
											<input type="checkbox" name="que_type" value="주관식" id="cid2"><label for="cid2">주관식</label>
											<input type="checkbox" name="que_type" value="T/F형" id="cid3"><label for="cid3">T/F형</label>
											<input type="checkbox" name="que_type" value="약술형" id="cid4"><label for="cid4">약술형</label>
											<input type="checkbox" name="que_type" value="논술형" id="cid5"><label for="cid5">논술형</label>
											<input type="checkbox" name="que_type" value="구술형" id="cid6"><label for="cid6">구술형</label>
											<input type="checkbox" name="que_type" value="기타" id="cid7"><label for="cid7">기타</label>
										</td></tr>
									<tr><td>문제예시</td>
										<td>
											<!-- <input name="addButton" type="button" style="cursor:hand" onClick="insRow()" value="추가">
											<table id="addTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
												<tr> 
													<input type="text" name="que_Ex" style="width:350px; height:20px;"></td>
													<td align="left"></td>
												</tr> 
											</table> -->
											<div id="parah"></div>
											<input type="button" value="추가" onclick="addInput();" />
											<input type="button" value="삭제" onclick="deleteInput();"/>
										</td>
									<tr><td>시험전략</td>
										<td>
											<textarea style="resize: none;" rows="5" cols="80" name="exam_strat" placeholder="시험에 대한 전략, 공부방법, 노하우를 자유롭게 작성해주세요!"></textarea>
										</td>
										<tr><td colspan="2" align="right">
											<input type="submit" value="작성완료">	
										</td></tr>		
									</table>
								</form>
							</div>						
						</div>
					</section>

				

				<!-- Footer -->
					<footer class="wrapper style1 align-center">
						<div class="inner">
							<ul class="icons">
								<li><a href="#" class="icon style2 fa-twitter"><span class="label">Twitter</span></a></li>
								<li><a href="#" class="icon style2 fa-facebook"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon style2 fa-instagram"><span class="label">Instagram</span></a></li>
								<li><a href="#" class="icon style2 fa-linkedin"><span class="label">LinkedIn</span></a></li>
								<li><a href="#" class="icon style2 fa-envelope"><span class="label">Email</span></a></li>
							</ul>
							<p>&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
						</div>
					</footer>

			</div>

		 <!-- Scripts -->
			<script src="cssEval/assets/js2/jquery.min.js"></script>
			<script src="cssEval/assets/js2/jquery.scrollex.min.js"></script>
			<script src="cssEval/assets/js2/jquery.scrolly.min.js"></script>
			<script src="cssEval/assets/js2/browser.min.js"></script>
			<script src="cssEval/assets/js2/breakpoints.min.js"></script>
			<script src="cssEval/assets/js2/util.js"></script>
			<script src="cssEval/assets/js2/main.js"></script> 

		<!-- Note: Only needed for demo purposes. Delete for production sites. -->
			<script src="cssEval/assets/js2/demo.js"></script> 
		<!-- <script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
		
		Note: Only needed for demo purposes. Delete for production sites.
			<script src="assets/js/demo.js"></script> -->
	</body>
</html>
