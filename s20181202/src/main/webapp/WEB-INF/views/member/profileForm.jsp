<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> 
<!DOCTYPE>

<%
	String context = request.getContextPath();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css?ver=3" /> 
<link rel="stylesheet" href="../assets/css/main_sub.css?ver=3" />
<noscript><link rel="stylesheet" href="../assets/css/noscript.css" /></noscript>
<title>프로필 사진 등록</title>
<style>
	.checked{
	    color: rgb(179, 92, 111);
	}
	.locked {
	    background-color: rgb(189, 189, 189);
	    pointer-events:none;
	    opacity:0.4;
	    color: aqua;
	}
	
	.img_wrap {
	    width: 500px;
	    margin-top:50px;
	}
	.img_wrap image {
	    max-width: 200px;
	}
	a { text-decoration:none } 
	.image{
	border: 0px !important;
	
	}
</style>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	var sel_file;
	var index;

	jQuery(document).ready(function($) {
    
        $('div.select_image').click(function() {
        	
           $("#input_img0").on("change",handleImgFileSelect);
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
                    $("#img0").attr("src", e.target.result);
                    document.getElementById("path0").value = "${pageContext.request.contextPath}/resources/ps/";

                }
                reader.readAsDataURL(f);
            });
        }
        
      
       });	
	   $(document).ready(function() {
		   $('#profile_info').submit(function() {
		         document.profile_info.submit();
		     });
	    }); 
    
</script>
<script>

</script>
</head>
<body class="is-preload">
	<div id="page-wrapper">
		<section id="header">
			<div class="container">
				<h1 id="logo"><a href="../Mainpage.do">마이캠퍼스</a></h1>				
				<nav id="nav">
					<ul>
						<li><a class="icon fa-graduation-cap" href="../lectureEvalMain.do"><span>강의평가</span></a></li>
						<li><a href="../booksellList.do" class="icon fa-book"><span>책방</span></a>
							<ul>
								<li><a href="../bookSellForm.do">책 판매</a></li>
							</ul>
						</li>
						<li><a class="icon fa-laptop" href="../study/StudyList.do"><span>스터디</span></a></li>
						<c:if test="${sessionScope.member_grade eq  0}">
							<li><a class="icon fa-home" href="./nlist.do"><span>관리자 페이지</span></a></li>
						<li><a class="icon fa-sign-out" href="logout.do"><span>로그아웃</span></a></li>
						</c:if>
						<c:if test="${sessionScope.member_grade eq 1}" >
							<li><a class="icon fa-home" href="view.do"><span>마이페이지</span></a>
								<ul>
									<li><a href="msgsend.do">나의 쪽지함</a></li>
									<li><a href="myPage.do">회원정보수정</a></li>
									<li><a href="profileForm.do">프로필사진수정</a></li>
									<li><a href="lectureBoardList.do">나의 강의평</a></li>
									<li><a href="bookBoardList.do">나의 책방</a></li>
									<li><a href="studyBoardList.do">나의 스터디</a></li>
								</ul>
							</li>
							<li><a class="icon fa-sign-out" href="logout.do"><span>로그아웃</span></a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</section>
	</div>
	
	<section id="banner">
		<div class="container">
		</div>
	</section>
	
<section id="features">
	<div class="container">
		<div class="row aln-center" >
			<div class="col-4 col-6-medium col-12-small"style="width:700px; margin: 0 auto;">
	   <!-- <div style="margin-left: 600px; margin-top: 100px;"> -->
			<form action="profileUpload.do" method="post" id="profile_info" name="profile_info" enctype="multipart/form-data">
		   		<input type="hidden" name="member_no" value="${member_no }">
		    	<div class="profile_info_photo" style="margin-top: 70px;">
		        	<div class="image"style="width:700px; margin: 0 auto;"id="image">
		            	<div class="wrap">
		                	<div class="select_image">
		                    	<div style="width:700px; margin: 0 auto;">
		                    
		                       		<div class="images_wrap" id="image"style="width: 700px;margin: 0 auto;">
		                          		<div style="width:300px; margin: 0 auto;">
		                            		<input type="file" name="file0" id="input_img0" /> 
		                            		<input type="hidden" id="path0" name="path0" > 	
		                          		</div>  	                       
		                            	<img src='${myPhoto.member_photo}' id="img0" style="width:50%;margin: 0 auto;margin-top: 10px;" />                      
		                         		<div style="width:300px; margin: 0 auto;margin-top: 30px;">		                            
		                            		<input style=" width:300px;margin: 0 auto;" id="imageButton" type="submit" value="등록">
		                        		</div>
		                        	</div> 	                        
		                       </div>
		                  </div>     
		              </div>
		        </div>
		    </div> 
		</form>
	</div>
	</div>
	</div>
	</section>
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script> 
	<script src="../assets/js/jquery.scrollex.min.js"></script>
	<script src="../assets/js/jquery.scrolly.min.js"></script>
	<script src="../assets/js/browser.min.js"></script>
	<script src="../assets/js/breakpoints.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script> 
</body>
</html>