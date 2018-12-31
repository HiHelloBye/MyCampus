package oracle.java.s20181202.dao;

import java.util.List;

import oracle.java.s20181202.model.Member;

public interface MemberDao {
	
	int check_email(String member_email) throws Exception;
	int check_nick(String member_nick) throws Exception;
	int register(Member member) throws Exception;
	int approval_member(Member member) throws Exception;
	Member login(String member_email) throws Exception;
	int update_log(String member_email) throws Exception;
	String find_email(String member_nick) throws Exception;
	int update_pw(Member member) throws Exception;
	int update_mypage(Member member) throws Exception;
	int withdrawal(Member member) throws Exception;
	Member view(String member_email);
	Member select_profile(int member_no);
	Member getMyPhoto(int member_no);
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
