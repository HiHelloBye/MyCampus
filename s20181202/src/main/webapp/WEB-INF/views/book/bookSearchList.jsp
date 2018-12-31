<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp"%> 
<%@ include file="bookHeader.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책방</title>
<style>
.font_line { 
        font-size:medium;
        text-decoration:line-through 
}
.font_sell{
    font-size:x-large;
    font-weight: 800;
    color:#E52A6F;  
}
.selled {
    color: #91959E;
    background: #E9F5FF;
}
    
td {
    vertical-align: middle;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"> </script>
<script type="text/javascript">
    function chk() {
        if (!frm.search.value) {
            alert("검색할 항목을 입력해주세요")
            frm.search.focus();
            
            return false;
        } else if (frm.search.value < 2 ) {
            alert("한 글자 이상 적어주세요.")
            frm.search.focus();

            return false;
        } else {
            location.href = "";
        }
    }
</script>
</head>
<body class="homepage">
    <div id="page-wrapper">
       <!-- Header -->
				<section id="header">
					<div class="container">

						<!-- Logo -->
							<h1 id="logo"><a href="Mainpage.do">마이캠퍼스</a></h1>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a class="icon fa-graduation-cap" href="./lectureEvalMain.do"><span>강의평가</span></a></li>
									<li><a href="./booksellList.do" class="icon fa-book"><span>책방</span></a>
										<ul>
											<li><a href="./bookSellForm.do">책 판매</a></li>
										</ul>
									</li>
									<li><a class="icon fa-laptop" href="./study/StudyList.do"><span>스터디</span></a></li>
									<c:if test="${sessionScope.member_grade eq  0}">
										<li><a class="icon fa-home" href="./nlist.do"><span>관리자 페이지</span></a></li>
									<li><a class="icon fa-sign-out" href="member/logout.do"><span>로그아웃</span></a></li>
									</c:if>
									<c:if test="${sessionScope.member_grade eq 1}" >
										<li><a class="icon fa-home" href="member/view.do"><span>마이페이지</span></a>
											<ul>
												<li><a href="member/msgsend.do">나의 쪽지함</a></li>
												<li><a href="member/myPage.do">회원정보수정</a></li>
												<li><a href="member/profileForm.do">프로필사진수정</a></li>
												<li><a href="member/lectureBoardList.do">나의 강의평</a></li>
												<li><a href="member/bookBoardList.do">나의 책방</a></li>
												<li><a href="member/studyBoardList.do">나의 스터디</a></li>
											</ul>
										</li>
										<li><a class="icon fa-sign-out" href="member/logout.do"><span>로그아웃</span></a></li>
									</c:if>
								</ul>
							</nav>
					</div>
				</section>

    </div>
    <c:set var="num" value="${pg.total - pg.start+1}"></c:set>
    <section id="banner">
        <div class="container"> 
            <p>
                <form action="bookSearch.do" method="POST" name="frm">
                    <input style="float:left; width:90%; padding:10px;" type="text" name="search" placeholder="검색하고 싶은 책 이름을 검색하세요." autocomplete="off" />
                    <input type="submit" value="검색" onclick="chk()" >
                </form>
            </p>
        </div>
    </section>
    
    <section id="features">
        <div class="container" >
            <div class="row aln-center" style="width: 80%; margin: auto;">
                <table>
                    <c:forEach var="book" items="${bookSearchList}">
                        <c:choose>
                            <c:when test="${book.book_state == 0 }">
                                <tr onclick="location.href='bookDetail.do?book_no=${book.book_no}'">
                            </c:when>
                            <c:when test="${book.book_state == 1 }">
                                <tr class="selled" onclick="location.href='bookDetail.do?book_no=${book.book_no}'">
                            </c:when>
                        </c:choose>
                        
                                <td style="padding-top:60px;" width="200" height="70" style="table-layout:fixed">
                                    <c:if test="${book.book_photo1 ne null }">
                                        <a class="image featured">
                                            <img src="${book.book_photo1}" alt=" " style="max-height: 150px;">
                                        </a>       
                                    </c:if>
                                </td>
                                <td>
                                    <h3>${book.book_name}</h3>
                                    ${book.book_writer} | ${book.book_pub}<br />
                                    ${book.uni_name } 재학생 <br />
                                    ${book.book_met}<br />
                                    <font class="font_sell">${book.book_selling}</font> <font class="font_line">${book.book_price}</font><br />
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${book.book_state == 0 }">
                                            <td></td>
                                        </c:when>
                                        <c:when test="${book.book_state == 1 }">
                                            <td>판매 완료</td>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                            <c:set var="num" value="${num - 1}"></c:set>
                    </c:forEach>
                </table>           
            </div>
        </div>
    </section>
</body>
</html>