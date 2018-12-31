package oracle.java.s20181202.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20181202.dao.MemberDao;
import oracle.java.s20181202.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao md;

	@Override
	public void check_email(String member_email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(md.check_email(member_email));
		out.close();
	}
	
	@Override
	public void check_nick(String member_nick, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(md.check_nick(member_nick));
		out.close();		
	}

	
	@Override
	public int register(Member member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
	
		if(md.check_email(member.getMember_email()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 이메일이 있습니다.');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
			return 0;
			
		} else if(md.check_nick(member.getMember_nick()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 닉네임이 있습니다.');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
			return 0;
			
		} else {
			member.setApproval_key(create_key());
			md.register(member);
			send_mail(member, "register");
			return 1;
		}
	}
	
	@Override
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();
		
		for(int i=0; i<8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}
	
	// 이메일 발송
	@Override
	public void send_mail(Member member, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "intaek6432@naver.com";
		String hostSMTPpwd = "dlsxor312!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "intaek6432@naver.com";
		String fromName = "마이캠퍼스";
		String subject = "";
		String msg = "";
		
		if(div.equals("register")) {
			// 회원가입 메일 내용
			subject = "[마이캠퍼스] 회원가입 인증 메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getMember_email() + "님 회원가입을 환영합니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
			msg += "<form method='post' action='http://localhost:8080/s20181202/member/approval_member.do'>";
			msg += "<input type='hidden' name='member_email' value='" + member.getMember_email() + "'>";
			msg += "<input type='hidden' name='approval_key' value='" + member.getApproval_key() + "'>";
			msg += "<input type='submit' value='인증'></form><br/></div>";
		} else if(div.equals("find_pw")) {
			// 비밀번호 찾기 메일 내용
			subject = "[마이캠퍼스] 비밀번호 찾기 안내메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getMember_email() + "님의 임시 비밀번호입니다. 비밀번호를 변경하여 사용해주세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getMember_pw() + "</p></div>";
		}
		
		// 받는 사람 Email 주소
		String mail = member.getMember_email();

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setStartTLSEnabled(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();

	     } catch (Exception e) {
	         e.printStackTrace();
	     }
	}
	
	// 회원 인증
	@Override
	public void approval_member(Member member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (md.approval_member(member) == 0) { // 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.href='/member/loginForm.do';");
			out.println("</script>");
			out.close();
		}
	}

	@Override
	public Member login(Member member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(md.check_email(member.getMember_email()) == 0) {
			out.println("<script>");
			out.println("alert('등록된 아이디가 없습니다.');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
			return null;
				
		} else {
			String member_pw = member.getMember_pw();
			member = md.login(member.getMember_email());
			
			if(!member.getMember_pw().equals(member_pw)) {
				out.println("<script>");
				out.println("alert('비밀번호가 틀립니다.');");
				out.println("history.go(-1)");
				out.println("</script>");
				out.close();	
				return null;
				
			} else if(!member.getApproval_status().equals("true")) {
				out.println("<script>");
				out.println("alert('이메일 인증 후 로그인 하세요.');");
				out.println("history.go(-1)");
				out.println("</script>");
				out.close();	
				return null;
			} else {
				md.update_log(member.getMember_email());
				return member;
			}
		}		
	}

	// 로그아웃
	@Override
	public void logout(HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='/member/loginForm.do';");
		out.println("</script>");
		out.close();
	}

	@Override
	public String find_email(HttpServletResponse response, String member_nick) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String member_email = md.find_email(member_nick);
		
		// 이메일이 없으면
		if(member_email == null) {
			out.println("<script>");
			out.println("alert('가입되어 있는 이메일이 없습니다.');");
			out.println("history.go(-1)");
			out.println("</script>");	
			out.close();
			return null;

		} else {
			return member_email;
		}
		
	}

	@Override
	public void find_pw(HttpServletResponse response, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 이메일이 없으면
		if(md.check_email(member.getMember_email()) == 0) {
			out.print("이메일이 없습니다.");
			out.close();
		// 이메일이 잘못되었으면
		} else if(!member.getMember_nick().equals(md.login(member.getMember_email()).getMember_nick())) {
			out.print("잘못된 닉네임입니다.");
			out.close();
		// 임시 비밀번호 생성
		} else {
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}

			member.setMember_pw(pw);
			// 비밀번호 변경
			md.update_pw(member);
			// 비밀번호 변경 메일 발송
			send_mail(member, "find_pw");
			
			out.println("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	@Override
	public Member update_mypage(Member member) throws Exception {
		md.update_mypage(member);
		return md.login(member.getMember_email());
	}

	// 비밀번호 변경
	@Override
	public Member update_pw(Member member, String old_pw, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(!old_pw.equals(md.login(member.getMember_email()).getMember_pw())) {
			out.println("<script>");
			out.println("alert('기존 비밀번호와 다릅니다.');");
			out.println("history.go(-1)");
			out.println("</script>");	
			out.close();
			return null;

		} else {
			out.println("<script>");
			out.println("alert('비밀번호가 변경되었습니다.');");
			out.println("history.go(-1)");
			out.println("</script>");	
			out.close();
			md.update_pw(member);
			return md.login(member.getMember_email());
		}
	}

	@Override
	public boolean withdrawal(Member member, HttpServletResponse response) throws Exception {
		// response.setContentType("text/html;charset=utf-8");
		// PrintWriter out = response.getWriter();
		System.out.println("MemberServiceImpl withdrawal start....");
	
		if(md.withdrawal(member) != 1) {
//			out.println("<script>");
//			out.println("alert('회원 탈퇴 실패!');");
//			out.println("history.go(-1)");
//			out.println("</script>");	
//			out.close();
			System.out.println("MemberServiceImpl withdrawal 회원 탈퇴 실패!...");
			return false;
		} else {
//			out.println("<script>");
//			out.println("alert('회원 탈퇴하였습니다.');");
//			out.println("</script>");	
//			out.close();
			System.out.println("MemberServiceImpl withdrawal 회원 탈퇴하였습니다...");
			return true;
		}	
	}


	@Override
	public Member view(String member_email) {
		// TODO Auto-generated method stub
		return md.view(member_email);
	}


	@Override
	public Member select_profile(int member_no) {
		Member member = md.select_profile(member_no);
		
		return member;
	}


	@Override
	public int update_profile(Member member) {
		
		return md.update_profile(member);
	}
	
	@Override
	public List<Member> lectureBoardList(Member member) {
		return md.lectureBoardList(member);
	}

	@Override
	public List<Member> bookBoardList(Member member) {
		return md.bookBoardList(member);
	}

	@Override
	public List<Member> studyBoardList(Member member) {
		return md.studyBoardList(member);
	}

	@Override
	public int lectureEvalTotal(Member member) {
		return md.lectureEvalTotal(member);
	}

	@Override
	public int bookTotal(Member member) {
		return md.bookTotal(member);
	}

	@Override
	public int studyTotal2(Member member) {
		return md.studyTotal2(member);
	}
	

	// 쪽지함

	public List<Member> msgsend(Member member) {
		System.out.println("MemberserviceImpl msgsend Start...");

		return md.msgsend(member);
	}
	
	public List<Member> msgreci(Member member) {
		System.out.println("MemberserviceImpl msgreci Start...");

		return md.msgreci(member);
	}

	public int send_total(Member member) {
		System.out.println("MemberserviceImpl send_total Start...");
		return md.send_total(member);
	}
	
	public int reci_total(Member member) {
		System.out.println("MemberserviceImpl reci_total Start...");
		return md.reci_total(member);
	}
	
	
	public int write(Member member) {
		System.out.println("MemberserviceImpl write Start...");
		return md.write(member);
	}
	
	// 관리자
	@Override
	public String getAdminPw() {
		return md.getAdminPw();
	}

	@Override
	public Member getMyPhoto(int member_no) {
		// TODO Auto-generated method stub
		return md.getMyPhoto(member_no);
	}

	@Override
	public List<Member> msgcont(Member member) {
		// TODO Auto-generated method stub
		return md.msgcont(member);
	}

}
