package oracle.java.s20181202.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import oracle.java.s20181202.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;

	@Transactional
	public int register(Member member) throws Exception{
		return session.insert("register", member);
	}

	@Override
	public int check_email(String member_email) throws Exception{
		return session.selectOne("check_email", member_email);
	}

	@Override
	public int check_nick(String member_nick) throws Exception{
		return session.selectOne("check_nick", member_nick);
	}
	
	@Transactional
	public int approval_member(Member member) throws Exception{
		return session.update("approval_member", member);
	}

	@Override
	public Member login(String member_email) throws Exception {
		return session.selectOne("login", member_email);
	}

	@Transactional
	public int update_log(String member_email) throws Exception {
		return session.update("update_log", member_email);
	}

	@Override
	public String find_email(String member_nick) throws Exception {
		return session.selectOne("find_email", member_nick);
	}

	@Transactional
	public int update_pw(Member member) throws Exception {
		return session.update("update_pw", member);
	}
	
	@Transactional
	public int update_mypage(Member member) throws Exception{
		return session.update("update_mypage", member);
	}

	@Transactional
	public int withdrawal(Member member) throws Exception {
		return session.delete("withdrawal", member);
	}

	@Override
	public Member view(String member_email) {
		return session.selectOne("view", member_email);
	}

	@Override
	public Member select_profile(int member_no) {
		return session.selectOne("select_profile", member_no);
	}

	@Override
	public int update_profile(Member member) {
		

		int i = 0;
		
		try {
			i = session.update("update_profile", member);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return i;
	}
	
	@Override
	public List<Member> lectureBoardList(Member member) {
		List<Member> lectureBoardList = session.selectList("lectureBoardList", member);
		return lectureBoardList;
	}

	@Override
	public List<Member> bookBoardList(Member member) {
		List<Member> bookBoardList = session.selectList("bookBoardList", member);
		return bookBoardList;
	}

	@Override
	public List<Member> studyBoardList(Member member) {
		List<Member> studyBoardList = session.selectList("studyBoardList", member);
		return studyBoardList;
	}

	@Override
	public int lectureEvalTotal(Member member) {
		return session.selectOne("lectureEvalTotal", member);	
	}

	@Override
	public int bookTotal(Member member) {
		return session.selectOne("bookTotal", member);	
	}

	@Override
	public int studyTotal2(Member member) {
		return session.selectOne("studyTotal2", member);
	}


	// 쪽지함
	@Override
	public List<Member> msgsend(Member member) {
		System.out.println("MemberDaoImpl msgsend Start...");
		List<Member> list = session.selectList("msgsend", member);
		return list;
	}
	
	@Override
	public List<Member> msgreci(Member member) {
		System.out.println("MemberDaoImpl msgreci Start...");
		List<Member> list = session.selectList("msgreci", member);
		return list;
	}

	@Override
	public int send_total(Member member) {
		System.out.println("MemberDaoImpl send_total Start...");
		int kkk = 0;
		try {
			System.out.println("MemberDaoImpl send_total getMember_nick -> " + member.getMember_nick());
			System.out.println("MemberDaoImpl send_total getMsg_sender -> " + member.getMsg_sender());
			kkk = session.selectOne("send_total");
		} catch (Exception e) {
			System.out.println("MemberDaoImpl send_total getMessage -> " + e.getMessage());
		}
		return kkk;
	}
	
	@Override
	public int reci_total(Member member) {
		System.out.println("MemberDaoImpl reci_total Start...");
		int k = 0;
		try {
			System.out.println("MemberDaoImpl reci_total getMember_nick -> " + member.getMember_nick());
			System.out.println("MemberDaoImpl reci_total getMsg_reci -> " + member.getMsg_reci());
			k = session.selectOne("reci_total");
		} catch (Exception e) {
			System.out.println("MemberDaoImpl reci_total getMessage -> " + e.getMessage());
		}
		return k;
	}

	
	public int write(Member member) {
		System.out.println("MemberDaoImpl write Start...");
		return session.insert("write", member);
	}
	
	// 관리자
	@Override
	public String getAdminPw() {
		// TODO Auto-generated method stub
		return session.selectOne("getAdminPw");
	}

	@Override
	public Member getMyPhoto(int member_no) {
		// TODO Auto-generated method stub
		return session.selectOne("getMyPhoto",member_no);
	}

	@Override
	public List<Member> msgcont(Member member) {
		// TODO Auto-generated method stub
		return session.selectList("msgcont",member);
	}


}
