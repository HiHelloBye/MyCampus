<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
	String context = request.getContextPath();
	int member_no = (Integer)session.getAttribute("member_no");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="css/bookcss/book_sub_css/assets/css/main.css?ver=11" />

<title>책팔기</title>
<style>
.fileBox {
	margin-left: 48px;
}
.fileBox .btn_file { 
	display:inline-block;
	border:1px solid #67AECA;
	width:100px;
	height:30px;
	font-size:0.8em;
	line-height:30px;
	text-align:center;
	vertical-align:middle;
	color:#67AECA;
}
.fileBox input[type="file"] {
	position:absolute;
	width:1px;
	height:1px;
	padding:0;
	margin:-1px;
	overflow:hidden;
	clip:rect(0,0,0,0);
	border:0
}

#input_img0 {
	display:none;
}
#newFile {
 background-color:black;
 color:white;
 cursor:pointer;
}
.none {
	border-color: rgb(42, 229, 104);
    font-size: large;
    color:rgb(255, 255, 255);
}
.checked{
    color: #67AECA;
}
.locked {
    font-size: large;
    pointer-events:none;
    color: rgb(255, 255, 255);
}
.locked_disable {
    font-size: large;
    color: rgb(255, 255, 255);
}
.locked_div {
	pointer-events:none;
	background-color: #AECAD7;
    opacity: 0.4;
}
.next {
    font-size:large;
    background-color: rgba(255, 255, 255, 0);
    pointer-events:none;
    color: #67AECA;
}
.img_wrap {
    width: 200px;
    margin-top:50px;
}
.img_wrap image {
    max-width: 200px;
}
h2{
	font-family: "NanumSquare";
	text-align: center;
}
.image {
	margin-left: 60px;
}
.wrap {
	margin: auto;
}
p {
	font-size: large;
	text-align: center;
}
input[type="text"] {
	margin-left:210px;
	width:300px;
}
input[type="number"] {
	margin-left:210px;
	width:300px;
}
a {
    border-bottom: none;
}
.bottom_buttons {
	font-size: large;
	text-align: center;
	width: 180px;
	margin: 0 auto;
	text-align: center;
}
.button small {
    border-color: #E52A6F;
}
.button.primary {
	color:white;
}
textarea {
	border-color: #67AECA;
	resize: none;
}
body {
	font-family:"NanumSquare";
}
</style>
</head>
<script type="text/javascript">
	var index;
	var sel_file;
	var clicked = 0;

	jQuery(document).ready(function($) {
		
		$("input").change(function() {
			if($("input").value != '') {
				$(this).closest("div").find('span').removeClass();
				$(this).closest("div").find('span').addClass('button primary small');
				$(this).closest("div").find('a').removeClass();
				$(this).closest("div").find('a').addClass('locked_disable');
			}
		});
		
		
		
		
		
		$("#book_ct").change(function() {
			
			var conts = document.getElementById("book_ct").value;
			
			if(conts.length != 0) {
				
				$(this).closest("div").find('a').removeClass();
            	$(this).closest("div").find('a').addClass('locked_disable');
           	
            	$(this).closest("div").find('span').next().removeClass();
            	$(this).closest("div").find('span').next().addClass('button primary small');
			
			}
			
			if(conts.length == 0) {
				$(this).closest("div").find('a').removeClass();
            	$(this).closest("div").find('a').addClass('locked');
				
				$(this).closest("div").find('span').next().removeClass();
				$(this).closest("div").find('span').next().addClass('button small');
			}
		});
		
		$(".none").on('click', function() {
			$(this).closest("div").addClass('locked_div');
			document.getElementById($(this).closest("div").next().attr('id')).style.display="block";
			
			if (this.hash !== "") {
			      event.preventDefault();

			      var hash = this.hash;8

			      $('html, body').animate({
			        scrollTop: $(hash).offset().top
			      }, 800, function(){
			   
			        window.location.hash = hash;
			      });
			    } 
		});
		
		$(".locked").on('click', function() {
			
			$(this).closest("div").addClass('locked_div');
			document.getElementById($(this).closest("div").next().attr('id')).style.display="block";
			
			if (this.hash !== "") {
			      event.preventDefault();

			      var hash = this.hash;

			      $('html, body').animate({
			        scrollTop: $(hash).offset().top
			      }, 800, function(){
			   
			        window.location.hash = hash;
			      });
			    } 
			clicked = 0;
		});
		

        $('ol.select_checkbox li').click(function(e) {       
        		
        	
        	$(this).toggleClass("checked");
         
            if($(this).attr('value')){
            	$(this).removeAttr('value');
            	clicked--;
            } else {
            	$(this).attr('value',1);
            	clicked++;
            }

            if (clicked == 0) {
            	$(this).closest("div").find('#none').removeClass();
            	
            	$(this).closest("div").find('a').removeClass();
            	$(this).closest("div").find('a').addClass('locked');
            	
            	$(this).closest("div").find('span').next().removeClass();
            	$(this).closest("div").find('span').next().addClass('button small');
            }
            else if(clicked > 0) {
            	$(this).closest("div").find('#none').addClass('locked');
            	
            	$(this).closest("div").find('a').removeClass();
            	$(this).closest("div").find('a').addClass('locked_disable');
            	
            	$(this).closest("div").find('span').next().removeClass();
            	$(this).closest("div").find('span').next().addClass('button primary small');
            }
        });
  
        /* 이미지 핸들 */
        var uploadFile = $('.fileBox .input_img' + index);
    	
        uploadFile.on('change', function(){
    		if(window.FileReader){
    			var filename = $(this)[0].files[0].name;
    		} else {
    			var filename = $(this).val().split('/').pop().split('\\').pop();
    		}
    		$(this).siblings('.fileName').val(filename);
    	});
        
        
        $('ul.alt li').click(function() { 	
        	clicked++;
        	index = $('ul.alt li').index(this);  

        	//alert("");
        	$("#input_img"+index).on("change",handleImgFileSelect);
        	
        	if(clicked > 0) {
            	$('#photo_next').removeClass();
            	$('#photo_next').addClass('locked_disable');
            	
            	$('#photo_s').removeClass();
            	$('#photo_s').addClass('button primary small');
            }
        
        	
        });

         function handleImgFileSelect(e) {
         	
             var files = e.target.files;
             var filesArr = Array.prototype.slice.call(files);

             filesArr.forEach(function(f) {
                 if(!f.type.match("image.*")) {
                     alert("확장자는 이미지 확장자만 가능합니다");
                     return;
                 }
                 
                 sel_file = f;

                 
                 var reader = new FileReader();
                 reader.onload = function(e) {
                     $("#img"+index).attr("src", e.target.result);
                     document.getElementById("path"+index).value = "${pageContext.request.contextPath}/resources/bs/";

                 }
                 reader.readAsDataURL(f);
             });
         }
         
       
	
	});
	
	
    $(document).ready(function() {

        $('#book_sell_info').submit(function() {

        	var items = document.querySelectorAll("#book_sell_info_note .select_checkbox li");
            var values = [];
			for(var n=0; n<items.length; n++) {
				values.push(items[n].value);
			}

			
            var items2 = document.querySelectorAll("#book_sell_info_damage .select_checkbox li");
            var values2 = [];
			for(var n=0; n<items2.length; n++) {
				values2.push(items2[n].value);
			} 
            
			var items3 = document.querySelectorAll("#book_sell_info_met .select_checkbox li");
			var values3 = [];
            for (var n=0; n<items3.length; n++) {
            	values3.push(items3[n].value); 
            }
			
			//cont1
        	document.getElementById("seletedValue").value = values;

            //cont2
        	document.getElementById("seletedValue2").value = values2;
            
            //met
            document.getElementById("seletedValue3").value = values3;

            //form submit
            document.book_sell_info.submit();

        });

    });    
</script>
<body>
	<div id="page-wrapper">
        
        <div id="main">
            <div class="inner">

            <!-- Header -->
				<header id="header">
                    <a href="./booksellList.do" class="logo">MyCampus 책방</a>       
                </header>
            </div>

            <br />
            <section>
                    <div class="container" >
                        <div class="row aln-center" style="width: 100%; margin:auto; text-align:left;">
                             <article style="width:800px;">
                                 <form action="bookSellUpload.do" method="POST" id="book_sell_info" name="book_sell_info" enctype="multipart/form-data">
                                     <input type="hidden" name="member_no" value="<%=member_no%>">
                                     
                                     <!-- 책 기본정보 -->
                                     <div id="book_sell_info_default" class="box">
                                         <h2>자세한 책 정보를 적어주세요.</h2>
                                         <input type="text" name="book_name" placeholder="책 이름"  required>
                                         <br />
                                         <input type="text" name="book_writer" placeholder="책 저자" required>
                                         <br />
                                         <input type="text" name="book_pub" placeholder="출판사" required>
                                         <br />
                                         <input type="text" name="book_date" placeholder="출판일(ex. 20160101)" required>
                                         <br />
                                         <input type="number" name="book_price" placeholder="정가(ex. 17000)" required>
                                         <br />
                                         <br />		
                                         <p>
                                             <span class="button small">
                                                 <a href="#book_sell_info_note" class="locked" >다음</a>
                                             </span>
                                         </p>
                                     </div>
                                     <!-- 필기/밑줄 -->
                                     <div id="book_sell_info_note" class="box" style="display: none">
                                         <h2>필기한 흔적이 있나요?</h2>
                                         <input type="hidden" id="seletedValue" name="seletedValue" value="${seletedValue}" />
                                         <ol class="select_checkbox" >
                                             <li>
                                                 <span class=""></span> 밑줄 (연필/샤프)
                                             </li>
                                             <li>
                                                 <span class=""></span> 밑줄 (볼펜/형광펜)
                                             </li>
                                             <li>
                                                 <span class=""></span> 필기 (연필/샤프)
                                             </li>
                                             <li>
                                                 <span class=""></span> 필기 (볼펜/형광팬)
                                             </li>    
                                         </ol>
                                         <br />
                                         <p>
                                             <!-- <a href="book_sell_info_default">이전</a> -->
                                             <span class="button small">
                                                 <a class="none" href="#book_sell_info_damage">해당사항없음</a>
                                             </span>
                                             <span class="button small">
                                                 <a class="locked" href="#book_sell_info_damage">다음</a>
                                             </span>                               
                                         <p>
                                     </div>
                                     
                                     <!-- 보존 상태 -->
                                     <div id="book_sell_info_damage" class="box" style="display: none">
                                         <h2>보존 상태는 어떤가요?</h2>
                                         <input type="hidden" name="seletedValue2" id="seletedValue2" value="${seletedValue2}" />
                                         <ol class="select_checkbox">
                                             <li>
                                                 <span class=""></span> 겉표지 깨끗하지 않음
                                             </li>
                                             <li>
                                                 <span class=""></span> 이름(서명) 기입 있음
                                             </li>
                                             <li>
                                                 <span class=""></span> 페이지 변색 있음
                                             </li>
                                             <li>
                                                 <span class=""></span> 페이지 훼손 있음
                                             </li>    
                                         </ol>
                                         <p>
                                             <span class="button small">
                                                 <a class="none" href="#book_sell_info_photo">해당사항없음</a>
                                             </span>
                                             <span class="button small">
                                                 <a class="locked" href="#book_sell_info_photo">다음</a>
                                             </span>
                                         </p>
                                     </div>
                                     
                                     <!-- 실제 사진 -->
                                     <div id="book_sell_info_photo" class="box" style="display: none" >
                                         <h2>실제 사진을 찍어주세요.</h2>
                                         <div class="image">
                                             <div class="wrap">
                                                 <ul class="alt">
                                                     <li style="display:inline-block;">
                                                         <div style="margin-left: 10px;" class="images_wrap" id="image" style="display:inline-block;">
                                                             <input type="hidden" id="path0" name="path0" >                     
                                                             <!-- <input type="file" name="file1" id="input_img0" /> -->
                                                             <p>겉표지</p>
                                                              <div class="image fit" style="width: 200px;">
                                                                 <img id="img0" src="" alt ="" style="width:100%;" />
                                                             </div>
                                                             <div class="fileBox">												
                                                                 <label for="input_img0" class="btn_file">찾아보기</label>
                                                                 <input type="file" name="file0" id="input_img0" class="uploadBtn">
                                                             </div>
                                                         </div>
                                                     </li>
                                                     <li style="display:inline-block;">
                                                         <div class="images_wrap" id="image" style="display:inline-block;">
                                                             <!-- <input type="file" name="file1" id="input_img1" /> --> 
                                                             <input type="hidden" id="path1" name="path1"> 
                                                             <p>내부1</p>
                                                             <div class="image fit" style="width: 200px;">
                                                                 <img id="img1" src="" alt ="" style="width:100%;" />
                                                             </div>
                                                             <div class="fileBox">												
                                                                 <label for="input_img1" class="btn_file">찾아보기</label>
                                                                 <input type="file" name="file1" id="input_img1" class="uploadBtn">
                                                             </div>
                                                             
                                                         </div>
                                                     </li>
                                                     <li style="display:inline-block;">
                                                         <div class="images_wrap" id="image" style="display:inline-block;">
                                                             <!-- <input type="file" name="file2" id="input_img2" /> --> 
                                                             <input type="hidden" id="path2" name="path2" > 
                                                             <p>내부2</p>
                                                             <div class="image fit" style="width: 200px;">
                                                                 <img id="img2"  src="" alt ="" style="width:100%;" />
                                                             </div>
                                                             <div class="fileBox">												
                                                                 <label for="input_img2" class="btn_file">찾아보기</label>
                                                                 <input type="file" name="file2" id="input_img2" class="uploadBtn">
                                                             </div>
                                                         </div>
                                                     </li>
                                                 </ul>     
                                             </div>
                                         </div>
                                         <br />
                                         <br />
                                         <p>
                                             <span class="button small">
                                                 <a class="none" href="#book_sell_info_selling">건너뛰기</a>
                                             </span>
                                             <span id="photo_s" class="button small">
                                                 <a id="photo_next" class="locked" href="#book_sell_info_selling">다음</a>
                                             </span>
                                         </p>            
                                     </div>
                                     
                                     <!-- 판매가격 -->
                                     <div id="book_sell_info_selling" class="box" style="display: none">
                                         <h2> 희망하시는 판매 가격을 적어주세요.</h2>
                                         <input type="number" name="book_selling" placeholder="(단위 : 원)" required>
                                         <p>
                                             <span class="button small">
                                                 <a href="#book_sell_info_met" class="locked">다음</a>
                                             </span>                      	
                                         </p>
                                     </div>
                                     
                                     <!-- 거래 수단 -->
                                     <div id="book_sell_info_met" class="box" style="display: none">
                                         <h2>원하시는 거래 수단을 선택하세요.</h2>
                                         <input type="hidden" name="seletedValue3" id="seletedValue3" value="${seletedValue3}" />
                                         <ol class="select_checkbox">
                                             <li class="">
                                                 <span class=""></span> 직거래
                                             </li>
                                             <li class="">
                                                 <span class=""></span> 택배
                                             </li>
                                         </ol>           
                                         <p>
                                         	<span></span>
                                            <span class="button small">
                                                <a href="#book_sell_info_cont" class="locked">다음</a>
                                             </span> 	
                                         </p>
                                         
                                     </div>
                                     
                                     <!-- 추가 설명  -->
                                     <div id="book_sell_info_cont" class="box" style="display: none" >
                                         <h2>추가 설명을 자유롭게 적어주세요.</h2>
                                         <textarea id="book_ct" name="book_cont" placeholder="(500자 이내)" value=""></textarea>
                                         <br />
                                         <p>
                                             <span class="button small">
                                                 <a class="none" href="#book_sell_info_agreement">건너뛰기</a>
                                             </span>
                                             <span class="button small">
                                                 <a id="ct_a2" href="#book_sell_info_agreement" class="locked">다음</a>
                                             </span>
                                         </p>    
                                     </div>
                                     
                                     <!-- 마지막 확인 -->
                                     <div id="book_sell_info_agreement" class="box" style="display: none" >
                                         <ul>
                                             <li> 등록 후에는 수정 및 삭제가 불가능합니다. </li>
                                             <li> 판매자 정보에 재학 중인 학교가 노출됩니다. </li>
                                             <li> 커뮤니티 이용규칙에 어긋날 경우 삭제됩니다. </li>
                                             <li> 판매 이후 [판매 완료]를 눌러주시기 바랍니다. </li>
                                         </ul>
                                         <p>
                                             <span>
                                                 <input type="submit" class="primary" value="동의 및 등록하기">
                                             </span>
                                         </p>
                                     </div>
                                 </form>
                             </article>
                         </div>
                     </div>
                 </section>
        </div>
	
    </div>  
</body>
</html>