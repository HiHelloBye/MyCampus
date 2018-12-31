<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../css/html5up-astral/assets/css/main.css" />
<noscript><link rel="stylesheet" href="../css/html5up-astral/assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">
   <div id="wrapper">
      <nav id="nav">
         <a href="#contact" class="icon fa-envelope active"><span>Contact</span></a>
      </nav>
   <div id="main">

   <article id="contact" class="panel">
      <header>
         <h2>나의 쪽지함</h2>
      </header>
   </article>

    <table>
      <tr>
         <th style="font-size: 15pt" >보낸사람</th>
         <th style="font-size: 15pt" >받는사람</th>
         <th style="font-size: 15pt">내용</th>
         <th style="font-size: 15pt" >시간</th>
      </tr>
      <c:forEach var="member" items="${msgreci }">
         <tr>
            <td style="font-size: 15pt" align=center>${member.msg_sender }</td>
            <td style="font-size: 15pt" align=center>${member.msg_reci }</td>
            <td style="font-size: 15pt">${member.msg_cont }</td>
            <td style="font-size: 15pt" align=center>${member.msg_date }</td>
         </tr>
      </c:forEach>
   </table>
   
   <form action="write.do" method="POST">
      <input type="text" style="width: 50%;margin-left:30px" name="msg_cont" placeholder="보내실 쪽지 내용을 여기에 작성하세요" required="required">
      <input style="margin-left:30px;background-color:rgb(103,86,130)" type="submit" value="send">
      <input type="hidden" name="msg_reci" value="${member.msg_reci }">
      <input type="hidden" name="msg_sender" value="${member.msg_sender }">
      <!-- <div class="sendButton">
         <span><input type="submit" value="send"></span>
         <span>icon</span>
      </div> -->
   </form>    
   </div>
</div>

<script src="../css/html5up-astral/assets/js/jquery.min.js"></script>
<script src="../css/html5up-astral/assets/js/browser.min.js"></script>
<script src="../css/html5up-astral/assets/js/breakpoints.min.js"></script>
<script src="../css/html5up-astral/assets/js/util.js"></script>
<script src="../css/html5up-astral/assets/js/main.js"></script>

</body>
</html>