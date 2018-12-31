package oracle.java.s20181202.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import oracle.java.s20181202.model.Member;
import oracle.java.s20181202.service.MemberService;
import oracle.java.s20181202.service.Sendpaging;
import oracle.java.s20181202.service.StudyPaging;
import oracle.java.s20181202.service.bookTotalPaging;
import oracle.java.s20181202.service.lectureEvalTotalPaging;

@Controller
@RequestMapping("/member/")
public class MemberController {
	@Autowired
	private MemberService ms;
	
	@Resource(name = "uploadPath2")
	private String uploadPath2;

	
	// 이메일 중복 검사
	@RequestMapping(value="/check_email", method=RequestMethod.POST)
	public void check_email(@RequestParam("member_email") String member_email, HttpServletResponse response) throws Exception {
		
		ms.check_email(member_email, response);
	}
	
	// 닉네임 중복 검사
	@RequestMapping(value="/check_nick", method=RequestMethod.POST)
	public void check_nick(@RequestParam("member_nick") String member_nick, HttpServletResponse response) throws Exception {
		
		ms.check_nick(member_nick, response);
	}
	
	// 회원가입 폼
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String register() throws Exception {
		
		return "/member/register";
	}
	
	// 회원가입 처리
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(@ModelAttribute Member member, RedirectAttributes redirectAttributes, HttpServletResponse response) throws Exception {
		
		redirectAttributes.addFlashAttribute("result", ms.register(member, response));
		return "redirect:/member/loginForm.do";
	}
	
	// 회원 인증
	@RequestMapping(value = "/approval_member", method = RequestMethod.POST)
	public void approval_member(@ModelAttribute Member member, HttpServletResponse response) throws Exception{
		
		ms.approval_member(member, response);
	}
	
	// 로그인 폼
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() throws Exception {
		
		return "/member/loginForm";
	}
	
	// 로그인 처리
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@ModelAttribute Member member, Model model, HttpSession session, HttpServletResponse response) throws Exception {
		member = ms.login(member, response);
		System.out.println("login getMember_email->"+member.getMember_email());
		System.out.println("login getMember_grade->"+member.getMember_grade());
		System.out.println("login getBook_no->"+member.getBook_no());
		System.out.println("login getStudy_no->"+member.getStudy_no());
		System.out.println("login getLeceval_no	->"+member.getLeceval_no());

		session.setAttribute("member", member);//
		session.setAttribute("member_nick", member.getMember_nick());
		session.setAttribute("member_no", member.getMember_no());
		session.setAttribute("member_grade", member.getMember_grade());
		session.setAttribute("book_no", member.getBook_no());
		session.setAttribute("study_no", member.getStudy_no());
		session.setAttribute("leceval_no", member.getLeceval_no());
		session.setAttribute("member_email", member.getMember_email());
		session.setAttribute("uni_no", member.getUni_no());
		
		/*model.addAttribute("member_grade",member.getMember_grade());
		model.addAttribute("member_no",member.getMember_no());
		model.addAttribute("member_email",member.getMember_email());
		model.addAttribute("member_nick",member.getMember_nick());
		model.addAttribute("book_no", member.getBook_no());
		model.addAttribute("study_no", member.getStudy_no());
		model.addAttribute("leceval_no", member.getLeceval_no());*/

		return "redirect:../Mainpage.do";
//		return "redirect:/member/main.do";
	}

	// 로그아웃 처리
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		System.out.println("logout start");
		return "/member/loginForm";
	}	
	
	// 이메일 찾기 폼
	@RequestMapping(value = "/findEmailForm")
	public String findEmailForm() throws Exception{
		
		return "/member/findEmailForm";
	}
	
	// 이메일 찾기 처리
	@RequestMapping(value="/find_email", method=RequestMethod.POST)
	public String findEmail(HttpServletResponse response, @RequestParam("member_nick") String member_nick, Model model) throws Exception {
		
		model.addAttribute("member_email", ms.find_email(response, member_nick));
		return "/member/find_email";
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping(value="/findPasswordForm")
	public String findPasswordForm() throws Exception {
		
		return "/member/findPasswordForm";
	}
	
	// 비밀번호 찾기 이메일 전송
	@RequestMapping(value="/find_pw")
	public void find_pw(@ModelAttribute Member member, HttpServletResponse response) throws Exception {
		
		ms.find_pw(response, member);
		
	}
	
	// 마이 페이지 이동
	@RequestMapping(value="/myPage")
	public String myPage() throws Exception {
		System.out.println("myPage Start..");
	
		return "/member/myPage";
	}
	
	// 회원정보 수정
	@RequestMapping(value="/update_mypage", method=RequestMethod.POST)
	public String update_mypage(@ModelAttribute Member member, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
		session.setAttribute("member", ms.update_mypage(member));
		
		return "redirect:/member/view.do";
	}
	
	
	// 비밀번호 변경
	@RequestMapping(value="/update_pw", method=RequestMethod.POST)
	public String update_mypage(@ModelAttribute Member member, @RequestParam("old_pw") String old_pw, HttpSession session, HttpServletResponse response, RedirectAttributes redirectAttributes) throws Exception {
		session.setAttribute("member", ms.update_pw(member, old_pw, response));		
		return "redirect:/member/myPage.do";
	}	
	
	// 회원 탈퇴
	@RequestMapping(value="/withdrawal", method=RequestMethod.POST)
	public String deleteForm(@ModelAttribute Member member, HttpSession session, RedirectAttributes redirectAttributes, HttpServletResponse response) throws Exception{
		
		session.setAttribute("member", ms.withdrawal(member, response));
		session.invalidate();
		redirectAttributes.addAttribute("msg", "회원탈퇴 완료");
		
		return "redirect:/member/loginForm.do";
		
	}

	// 회원 페이지 폼
	@RequestMapping(value="/view")
	public String view(@ModelAttribute Member member, Model model, HttpSession session) throws Exception {
		String member_email=(String) session.getAttribute("member_email");
		System.out.println("view getMember_email->"+member_email);
		session.setAttribute("member_email", member_email);
		member.setMember_email(member_email);
		Member memberView= ms.view(member.getMember_email());
		model.addAttribute("memberView", memberView);
		return "/member/view";
	}
	
	// 프로필 폼
	@RequestMapping(value="/profileForm")
	public String profileForm(Member member, Model model, HttpSession session) {
		
		int member_no=(Integer) session.getAttribute("member_no");
		
		session.setAttribute("member_no", member_no);
		member.setMember_no(member_no);
		Member myPhoto=ms.getMyPhoto(member_no);
		model.addAttribute("member_no", member_no);
		model.addAttribute("myPhoto",myPhoto);
		return "/member/profileForm";
	}
	
	// 프로필 이미지 업로드
	@RequestMapping(value="/profileUpload", method = RequestMethod.GET)
	public void profileUpload(Member member, Model model) {
		System.out.println("profileUpload Get Start...");		
	}
	
	// 프로필 이미지 업로드
	@RequestMapping(value="/profileUpload", method = RequestMethod.POST)
	public String profileUpload(Member memberP, String path, HttpServletRequest request, Model model, MultipartFile file0) throws Exception {
		
		Member member = new Member();

		
		System.out.println("profileUpload start ");
			
		String savedName = uploadFile(file0.getOriginalFilename(), file0.getBytes(), uploadPath2);
		
		String dbSaveName = "../resources/ps/" + savedName;	
		
		member.setMember_no(memberP.getMember_no());
		member.setMember_photo(dbSaveName);
		
		int result = ms.update_profile(member);
		
		if(result > 0 ) {
			return "forward:/member/view.do";
		} else {
			
			model.addAttribute("msg", "프로필 이미지 등록에 실패하였습니다");
			
			return "forward:Mainpage.do";
		}
		

	}
	
	// 프로필 이미지 업로드 파일 경로
	private String uploadFile(String originalName, byte[] fileData, String uploadPath2) throws Exception {
		
		long time 					= System.currentTimeMillis(); 
		SimpleDateFormat dayTime 	= new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		String str 					= dayTime.format(new Date(time));
		
		str = str.replaceAll("-", "");
		str = str.replaceAll(":", "");
		str = str.replaceAll(" ", "_");
		
		File fileDirectory = new File(uploadPath2);
		
		if(!fileDirectory.exists()) {
			
			fileDirectory.mkdirs();
			System.out.println("업로드용 폴더 생성 : " + uploadPath2);
		}
		
		String savedName = str + "_" + originalName;

		File target = new File(uploadPath2, savedName);
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	// 내가 쓴 강의평
	@RequestMapping(value="/lectureBoardList")
	public String lectureBoardList(Member member, String currentPage, Model model, HttpSession session) {
		int lectureEvalTotal = ms.lectureEvalTotal(member);
		
		System.out.println("lectureEvalTotal->"+lectureEvalTotal);
		System.out.println("currentPage->"+currentPage);
		
		lectureEvalTotalPaging pg = new lectureEvalTotalPaging(lectureEvalTotal, currentPage);
		member.setStart(pg.getStart());
		member.setEnd(pg.getEnd());
		
		String member_email=(String) session.getAttribute("member_email");
		session.setAttribute("member_email", member_email);
		member.setMember_email(member_email);
		
		List<Member> lectureBoardList =  ms.lectureBoardList(member);
		
		model.addAttribute("lectureBoardList", lectureBoardList);
		model.addAttribute("pg", pg);
		return "/member/lectureBoardList";		
	}
	
	// 내가 쓴 강의평
	@RequestMapping(value="/bookBoardList")
	public String bookBoardList(Member member, String currentPage, Model model, HttpSession session) {
		int bookTotal = ms.bookTotal(member);
		
		System.out.println("bookTotal->"+bookTotal);
		System.out.println("currentPage->"+currentPage);
		
		bookTotalPaging pg = new bookTotalPaging(bookTotal, currentPage);
		member.setStart(pg.getStart());
		member.setEnd(pg.getEnd());
		
		String member_email=(String) session.getAttribute("member_email");
		session.setAttribute("member_email", member_email);
		member.setMember_email(member_email);
		
		List<Member> bookBoardList =  ms.bookBoardList(member);
		
		model.addAttribute("bookBoardList", bookBoardList);
		model.addAttribute("pg", pg);
		
		return "/member/bookBoardList";		
	}
	
	// 내가 쓴 강의평
	@RequestMapping(value="/studyBoardList")
	public String studyBoardList(Member member, String currentPage, Model model, HttpSession session) {
		int studyTotal = ms.studyTotal2(member);
		
		System.out.println("studyTotal->" + studyTotal);
		System.out.println("currentPage->" + currentPage);
		
		StudyPaging pg = new StudyPaging(studyTotal, currentPage);
		member.setStart(pg.getStart());
		member.setEnd(pg.getEnd());
		
		String member_email=(String) session.getAttribute("member_email");
		session.setAttribute("member_email", member_email);
		member.setMember_email(member_email);
		
		List<Member> studyBoardList =  ms.studyBoardList(member);
		
		model.addAttribute("studyBoardList", studyBoardList);
		model.addAttribute("pg", pg);
		
		return "/member/studyBoardList";		
	}
	
	/****************************************************/
	
	   /****************************************************/
	   
	   // 쪽지함 폼
	   @RequestMapping(value="/message")
	   public String message(Member member, Model model, HttpSession session) {
	      
	      String member_nick=(String) session.getAttribute("member_nick");
	      session.setAttribute("member_nick", member_nick);
	      member.setMember_nick(member_nick);
	      model.addAttribute("member", member);
	      
	      return "/member/message";
	   }
	   
	   @RequestMapping(value="/msgsend")
	   public String msgsend(Member member, String currentPage, Model model, HttpSession session) {
	      System.out.println("msgsend getMsg_sender ->"+member.getMsg_sender());
	      int send_total = ms.send_total(member);
	      
	      System.out.println("send_total->"+send_total);
	      System.out.println("currentPage->"+currentPage);
	      
	      Sendpaging mpg = new Sendpaging(send_total, currentPage);
	      member.setStart(mpg.getStart());
	      member.setEnd(mpg.getEnd());
	      
	      String member_nick=(String) session.getAttribute("member_nick");
	      session.setAttribute("member_nick", member_nick);
	      member.setMember_nick(member_nick);
	      System.out.println("여기 member_nick->"+member.getMember_nick());
	      
	      List<Member> msgsend =  ms.msgsend(member);
	      List<Member> msgcont = ms.msgcont(member);
	      model.addAttribute("msgsend",msgsend);
	      model.addAttribute("msgcont",msgcont);
	      model.addAttribute("mpg",mpg);
	      return "/member/msgsend";      
	   }
	   
	   @RequestMapping(value="/msgreci")
	   public String msgreci(Member member, String currentPage, Model model, HttpSession session) {
	      System.out.println("msgreci getMsg_reci ->"+member.getMsg_reci());
	      int reci_total = ms.reci_total(member);
	      
	      System.out.println("reci_total->"+reci_total);
	      System.out.println("currentPage->"+currentPage);
	      
	      Sendpaging mpg = new Sendpaging(reci_total, currentPage);
	      member.setStart(mpg.getStart());
	      member.setEnd(mpg.getEnd());
	      
	      String member_nick=(String) session.getAttribute("member_nick");
	      session.setAttribute("member_nick", member_nick);
	      member.setMember_nick(member_nick);
	      
	      List<Member> msgreci =  ms.msgreci(member);

	      model.addAttribute("msgreci",msgreci);
	      model.addAttribute("mpg",mpg);
	      return "/member/msgreci";      
	   }
	   
	   @RequestMapping(value="/writeform", method=RequestMethod.GET)
	   public String member(Member member,HttpServletRequest request, Model model, HttpSession session) {
	      System.out.println("writeform start...");
	      //String member_nick = request.getParameter("msg_sender");
	      
	      String member_nick=(String) session.getAttribute("member_nick");
	      session.setAttribute("member_nick", member_nick);
	      member.setMember_nick(member_nick);
	      
	      model.addAttribute("msg_sender", member_nick);
	      return "/member/writeform";
	   }
	   
	   @RequestMapping(value="/write", method=RequestMethod.POST)
	   public String write(Model model, HttpServletRequest request, Member member, HttpSession session, String currentPage) {
	      System.out.println("write start...");
	      String msg_cont = request.getParameter("msg_cont");
	      String msg_reci = request.getParameter("msg_reci");
	      System.out.println("여기msg_reci->"+msg_reci);
	      member.setMsg_cont(msg_cont);
	      member.setMsg_reci(msg_reci);
	      int send_total = ms.send_total(member);
	      
	      Sendpaging mpg = new Sendpaging(send_total, currentPage);
	      member.setStart(mpg.getStart());
	      member.setEnd(mpg.getEnd());
	      
	      ms.write(member);
	      System.out.println("테스트성공");

	      String member_nick=(String) session.getAttribute("member_nick");
	      session.setAttribute("member_nick", member_nick);
	      member.setMember_nick(member_nick);
	      System.out.println("여기 member_nick->"+member.getMember_nick());
	      
	      List<Member> msgsend =  ms.msgsend(member);

	      model.addAttribute("msgsend",msgsend);
	      model.addAttribute("mpg",mpg);
	      
	      return "/member/msgsend";
	   }
		
}
