<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의평 게시판 상세</title>
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

</head>
<body>

	<h2 onclick="location.href='lectureEvalMain.do'">강의평가</h2>
	<!--강의기본정보 -->
	<c:forEach var="lecEvalDetail" items="${lecEvalDetail }" begin="0" end="0">
	<h2>${lecEvalDetail.lec_name }</h2>
	<table>
		<tr>
			<td>교수명</td><td>${lecEvalDetail.prof_name }</td>
		</tr>
		<tr>
			<td>개설학기</td><td>${lecEvalDetail.att_term }</td>
		</tr>
	</table>		
	<!-- 강의평 평점 및 기본정보 2 -->
	<h2>수강평</h2>
	<table><%-- 
		<tr>
			<td colspan="2"><h2>${lecEvalAvgSc.lec_score }</h2></td>
		</tr> --%>
		<tr>
			<c:if test="${lecEvalAvgSc.lec_score > 0.0 && lecEvalAvgSc.lec_score<=0.5}">
				<td colspan="2"><h2><img src="resources/imgstar/star05.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2></td>
			</c:if>
			<c:if test="${lecEvalAvgSc.lec_score > 0.5 && lecEvalAvgSc.lec_score<=1.0}">
				<td colspan="2"><h2><img src="resources/imgstar/star1.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2></td>
			</c:if>
			
			<c:if test="${lecEvalAvgSc.lec_score > 1.0 && lecEvalAvgSc.lec_score<=1.5}">
				<td colspan="2"><h2><img src="resources/imgstar/star15.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2></td>
			</c:if>
			<c:if test="${lecEvalAvgSc.lec_score > 1.5 && lecEvalAvgSc.lec_score<=2.0}">
				<td colspan="2"><h2><img src="resources/imgstar/star2.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2></td>
			</c:if>
			
			<c:if test="${lecEvalAvgSc.lec_score > 2.0 && lecEvalAvgSc.lec_score<=2.5}">
				<td colspan="2"><h2><img src="resources/imgstar/star25.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2></td>
			</c:if>
			<c:if test="${lecEvalAvgSc.lec_score > 2.5 && lecEvalAvgSc.lec_score<=3.0}">
				<td colspan="2"><h2><img src="resources/imgstar/star3.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2></td>
			</c:if>
			
			<c:if test="${lecEvalAvgSc.lec_score > 3.0 && lecEvalAvgSc.lec_score<=3.5}">
				<td colspan="2"><h2><img src="resources/imgstar/star35.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2></td>
			</c:if>
			<c:if test="${lecEvalAvgSc.lec_score > 3.5 && lecEvalAvgSc.lec_score<=4.0}">
				<td colspan="2"><h2><img src="resources/imgstar/star4.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2></td>
			</c:if>
			
			<c:if test="${lecEvalAvgSc.lec_score > 4.0 && lecEvalAvgSc.lec_score<=4.5}">
				<td colspan="2"><h2><img src="resources/imgstar/star45.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2></td>
			</c:if>
			<c:if test="${lecEvalAvgSc.lec_score > 4.5 && lecEvalAvgSc.lec_score<=5.0}">
				<td colspan="2"><h2><img src="resources/imgstar/star5.JPG" style="width:150px;">${lecEvalAvgSc.lec_score}</h2></td>
			</c:if>
		</tr>
		<tr>
			<td>과제</td><td>${lecEvalAvgHw.lec_hw}</td>
		</tr>
		<tr>
			<td>학점비율</td><td>${lecEvalAvgRat.lec_ratio}</td>
		</tr>
		
		<tr>
			<td>시험횟수</td><td>${lecEvalAvgEx.lec_exam}</td>
		</tr>
		
		<tr>	
			<td>출결</td><td>${lecEvalAvgAtt.lec_attend}</td>
		</tr> 
	</table>
	</c:forEach>
	<!--강의평 작성하기-->
	<div class="more" onclick="this.innerHTML=(LecEval.style.display=='none')?'[닫기]':'[이 수업에 대한 강의평을 작성해주세요!]';LecEval.style.display=(LecEval.style.display=='none')?'block':'none';">[이 수업에 대한 강의평을 작성해주세요!]</div>
	<div style="DISPLAY: none" id="LecEval">
	<!-- writeLecEval.do -->
	<form action="writeLecEval.do " method="post" name="frm" id="frmLecEval">
	<input type="hidden" value="1.0" name="lec_score" id="lec_score">	
	<input type="hidden" value="0" name="lec_warn" >	
	<input type="hidden" value="0" name="lec_state" >	
		 <c:forEach var="lecEvalDetail" items="${lecEvalDetail }">
		<input type="hidden" value="${lecEvalDetail.lec_no }" name="lec_no" />
		<input type="hidden" value="${lecEvalDetail.uni_no }" name="uni_no" />
		
		</c:forEach>
		<table>
		
			<caption><h2>새 강의평 쓰기</h2></caption>
			<tr>
				<td><h3>성적반영</h3></td>
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
					<textarea rows="5" cols="80" name="lec_review" placeholder="이 강의에 대한 총평을 작성해주세요.&#13;&#10;등록 후에는 수정 및 삭제가 불가능하므로 신중히 작성해주세요." required></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="작성완료">
				</td>
			</tr>
		</table> 
	</form>
	</div>

	
	<!--강의평정보 조회-->
	
		<table>
		<c:forEach var="lecEvalDetail" items="${lecEvalDetail }">
			<tr>
				<td colspan="3">
		
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
				</td>
				<td>
					${lecEvalDetail.att_term } <a onclick="confirm('이 글을 정말로 신고하시겠습니까?')" href="insertWarning.do?type_no=2&study_leceval=${lecEvalDetail.leceval_no }&lec_no=${lecEvalDetail.lec_no}&uni_no=${lecEvalDetail.uni_no}&member_no=11&warn_state=1">신고</a>
				</td>
			</tr>
			<tr>
				<td colspan="3">${lecEvalDetail.lec_review }</td>
			</tr>
		</c:forEach>
		</table>
	<hr />
	<h2>시험정보</h2>
	<!--시험정보 작성하기-->
	<div class="more" onclick="this.innerHTML=(ExamInfo.style.display=='none')?'[닫기]':'[이 수업에 대한 시험정보를 작성해주세요!]';ExamInfo.style.display=(ExamInfo.style.display=='none')?'block':'none';">[이 수업에 대한 시험정보를 작성해주세요!]</div>
	<div style="DISPLAY: none" id="ExamInfo">
		<form action="writeExamInfo.do" method="post" name="frm" id="frmExamInfo">
			<c:forEach var="lecEvalDetail" items="${lecEvalDetail }">
			<input type="hidden" value="${lecEvalDetail.lec_no }" name="lec_no" />
			<input type="hidden" value="${lecEvalDetail.uni_no }" name="uni_no" />
			</c:forEach>
			<table>
				<caption><h2>시험정보 공유</h2></caption>
				<tr>
					<td><h3>응시한 시험</h3></td>
				</tr>
				<tr>
					<td>
					수강학기  
					
						<select name="att_term" id="att_term_exam">
						  <option value="수강학기선택" selected="selected">수강학기선택</option>
						   <c:forEach var="lecTermList" items="${lecTermList}">
						  <option value="${lecTermList.att_term }">${lecTermList.att_term }</option>
						  </c:forEach>
						</select>
					
					
					</td>
					
				</tr>
				<tr>
					<td>
					시험종류
					<select name="exam_type" id="exam_term_exam">
							<option value="선택" selected="selected">선택</option>
							<option value="중간고사">중간고사</option>
							<option value="기말고사">기말고사</option>
					</select>
					</td>
					
				</tr>
				
				<tr>
					<td><h3>문제유형</h3>  (복수선택가능)</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="que_type" value="객관식" id="cid1"><label for="cid1">객관식</label>
						<input type="checkbox" name="que_type" value="주관식" id="cid2"><label for="cid2">주관식</label>
						<input type="checkbox" name="que_type" value="T/F형" id="cid3"><label for="cid3">T/F형</label>
						<input type="checkbox" name="que_type" value="약술형" id="cid4"><label for="cid4">약술형</label>
						<input type="checkbox" name="que_type" value="논술형" id="cid5"><label for="cid5">논술형</label>
						<input type="checkbox" name="que_type" value="구술형" id="cid6"><label for="cid6">구술형</label>
						<input type="checkbox" name="que_type" value="기타" id="cid7"><label for="cid7">기타</label>
					</td>
				</tr>
				<tr>
					<td><h3>문제예시</h3><input name="addButton" type="button" style="cursor:hand" onClick="insRow()" value="추가"></td> 
				</tr>
				<tr>
		         <td height="25">
		           <table id="addTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
		            <tr>
		              <td><input type="text" name="que_Ex" style="width:350px; height:20px;"></td>
		              <td align="left"></td>
		            </tr>
		          </table></td>
		        </tr>
					
				<tr>
					<td><h3>시험전략</h3></td>
				</tr>
				<tr>
					<td>
						<textarea rows="5" cols="80" name="exam_strat" placeholder="시험에 대한 전략, 공부방법, 노하우를 자유롭게 작성해주세요!"></textarea>
					</td>
				</tr>
				<tr>
				<td>
					<input type="submit" value="작성완료">
				</td>
			</tr>
			</table>
		</form>
	</div>
	<!--시험정보 조회-->
	<table>
		<c:forEach var="ExamInfoDetail" items="${ExamInfoDetail }">
			<tr>
				<td><h3>${ExamInfoDetail.att_term }  ${ExamInfoDetail.exam_type }</h3></td>
			</tr>
			<tr>
				<td><strong>문제유형</strong></td>
			</tr>
			<tr>
				<td>
					${ExamInfoDetail.que_type}
				</td>
			</tr>
			
			<tr>
				<td><strong>문제예시</strong></td>
			</tr>
			<tr>
				<td>
					${ExamInfoDetail.que_Ex}
				</td>
			</tr>
			<tr>
				<td><strong>전략</strong></td>
			</tr>
			<tr>
				<td>
					${ExamInfoDetail.exam_strat}
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>