package oracle.java.s20181202.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import oracle.java.s20181202.model.Member;

public interface MemberService {
	
	void check_email(String member_email, HttpServletResponse response) throws Exception;
	void check_nick(String member_nick, HttpServletResponse response) throws Exception;
	int register(Member member, HttpServletResponse response) throws Exception;
	String create_key() throws Exception;
	void send_mail(Member member, String div) throws Exception;
	void approval_member(Member member, HttpServletResponse response) throws Exception;
	Member login(Member member, HttpServletResponse response) throws Exception;
	void logout(HttpServletResponse response) throws Exception;
	String find_email(HttpServletResponse response, String member_nick) throws Exception;
	void find_pw(HttpServletResponse response, Member member) throws Exception;
	Member update_mypage(Member member) throws Exception;
	Member update_pw(Member member, String old_pw, HttpServletResponse response) throws Exception;
	boolean withdrawal(Member member, HttpServletResponse response) throws Exception;
	Member view(String member_email);
	Member getMyPhoto(int member_no);
	Member select_profile(int member_no);
	int update_profile(Member member);
	List<Member> lectureBoardList(Member member);
	List<Member> bookBoardList(Member member);
	List<Member> studyBoardList(Member member);
	int lectureEvalTotal(Member member);
	int bookTotal(Member member);
	int studyTotal2(Member member);


	// 쪽지함
	List<Member> msgsend(Member member);
	List<Member> msgreci(Member member);
	int send_total(Member member);
	int reci_total(Member member);
	int write(Member member);
	List<Member> msgcont(Member member);
	//관리자 
	String getAdminPw();
}
