<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
	String member_email = (String) session.getAttribute("member_email");
	int member_no = (Integer)session.getAttribute("member_no");
	int member_grade = (Integer)session.getAttribute("member_grade");
	String member_nick = (String)session.getAttribute("member_nick");
	int book_no = (Integer)session.getAttribute("book_no");
	int study_no = (Integer)session.getAttribute("study_no");
	int leceval_no = (Integer)session.getAttribute("leceval_no");
	int uni_no = (Integer)session.getAttribute("uni_no");

%>