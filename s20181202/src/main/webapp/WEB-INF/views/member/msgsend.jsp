<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../css/html5up-astral/assets/css/main.css?ver=1" />
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
            <c:forEach var="member" items="${msgsend }">
            	<tr onclick="location.href='msgreci.do?msg_sender=${member.msg_sender }&msg_reci=${member.msg_reci}'">
            		<td style="font-size: 15pt; padding-left:50px;">${member.msg_reci }</td>
          			</c:forEach>
          			 <c:forEach var="member2" items="${msgcont }">
          	    	<td>${member2.msg_cont }</td>
          	    	<td>${member2.msg_date }</td>
          	    	</c:forEach>
        		</tr>
        	</table>
<script src="../css/html5up-astral/assets/js/jquery.min.js"></script>
<script src="../css/html5up-astral/assets/js/browser.min.js"></script>
<script src="../css/html5up-astral/assets/js/breakpoints.min.js"></script>
<script src="../css/html5up-astral/assets/js/util.js"></script>
<script src="../css/html5up-astral/assets/js/main.js"></script>

</body>
</html>