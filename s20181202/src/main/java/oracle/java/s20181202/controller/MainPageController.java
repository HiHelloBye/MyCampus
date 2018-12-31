/*package oracle.java.s20181202.controller;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.s20181202.HomeController;
import oracle.java.s20181202.model.*;
import oracle.java.s20181202.service.MainService;

@Controller
public class MainPageController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private MainService ms;
	@RequestMapping(value = "Mainpage")
	public String MainPage(HttpServletRequest request, Member member, LectureEval lecE,Book book, Study study, Model model, HttpSession session) {
		String member_email = (String) session.getAttribute("member_email");
		int member_grade = (Integer) session.getAttribute("member_grade");
		int member_no = (Integer) session.getAttribute("member_no");
		String uni_name=(String)session.getAttribute("uni_name");
		int uni_no=(Integer)session.getAttribute("uni_no");
		int leceval_no = (Integer) session.getAttribute("leceval_no");
		int book_no = (Integer) session.getAttribute("book_no");
		int study_no = (Integer) session.getAttribute("study_no");
		
		String MainUni1 = ms.MainUni1();
		String MainLec1 = ms.MainLec1();
		String MainProf1 = ms.MainProf1();
		List<LectureEval> MainCorT1 = ms.MainCorT1();
		float MainScor1 = ms.MainScor1();
		int MainLecNo1 = ms.MainLecNo1();
		
		String MainUni2 = ms.MainUni2();
		String MainLec2 = ms.MainLec2();
		String MainProf2 = ms.MainProf2();
		List<LectureEval> MainCorT2 = ms.MainCorT2();
		float MainScor2 = ms.MainScor2();
		int MainLecNo2 = ms.MainLecNo2();
		
		String MainUni3 = ms.MainUni3();
		String MainLec3 = ms.MainLec3();
		String MainProf3 = ms.MainProf3();
		List<LectureEval> MainCorT3 = ms.MainCorT3();
		float MainScor3 = ms.MainScor3();
		int MainLecNo3 = ms.MainLecNo3();
		
		List<Book> MainBook = ms.MainBook(book);
		List<Study> MainStudy = ms.MainStudy(study);

		LectureEval MainLecUni1 = ms.MainLecUni1(lecE);
		LectureEval MainLecUni2 = ms.MainLecUni2(lecE);
		LectureEval MainLecUni3 = ms.MainLecUni3(lecE);
		
		session.setAttribute("member_email", member_email);
		
		System.out.println("session member_email->"+member_email);
		
		model.addAttribute("study_no",study_no);
		model.addAttribute("book_no",book_no);
		model.addAttribute("leceval_no",leceval_no);

		model.addAttribute("member_email",member_email);
		model.addAttribute("member_no",member_no);
		model.addAttribute("member_grade",member_grade);
		
		System.out.println("model member_email->"+member_email);
		
		model.addAttribute("MainBook",MainBook);
		model.addAttribute("MainStudy",MainStudy);
		
		model.addAttribute("MainScor3",MainScor3);
		model.addAttribute("MainCorT3",MainCorT3);
		model.addAttribute("MainProf3",MainProf3);
		model.addAttribute("MainLec3",MainLec3);
		model.addAttribute("MainUni3",MainUni3);
		model.addAttribute("MainLecNo3",MainLecNo3);

		model.addAttribute("MainScor2",MainScor2);
		model.addAttribute("MainCorT2",MainCorT2);
		model.addAttribute("MainProf2",MainProf2);
		model.addAttribute("MainLec2",MainLec2);
		model.addAttribute("MainUni2",MainUni2);
		model.addAttribute("MainLecNo2",MainLecNo2);

		model.addAttribute("MainScor1",MainScor1);
		model.addAttribute("MainCorT1",MainCorT1);
		model.addAttribute("MainProf1",MainProf1);
		model.addAttribute("MainLec1",MainLec1);
		model.addAttribute("MainUni1",MainUni1);
		model.addAttribute("MainLecNo1",MainLecNo1);
		
		model.addAttribute("MainLecUni1",MainLecUni1);
		model.addAttribute("MainLecUni2",MainLecUni2);
		model.addAttribute("MainLecUni3",MainLecUni3);
		
		member.setMember_email(member_email);
		
		return "/member/Mainpage";
	}

}
*/
package oracle.java.s20181202.controller;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.s20181202.HomeController;
import oracle.java.s20181202.model.*;
import oracle.java.s20181202.service.MainService;

@Controller
public class MainPageController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private MainService ms;
	@RequestMapping(value = "Mainpage")
	public String MainPage(HttpServletRequest request, Member member, LectureEval lecE,Book book, Study study, Model model, HttpSession session) {
		
		String member_email = (String) session.getAttribute("member_email");
		String member_nick = (String) session.getAttribute("member_nick");
		int member_grade = (Integer) session.getAttribute("member_grade");
		int member_no = (Integer) session.getAttribute("member_no");
		//String uni_name=(String)session.getAttribute("uni_name");
		int uni_no=(Integer)session.getAttribute("uni_no");
		int leceval_no = (Integer) session.getAttribute("leceval_no");
		int book_no = (Integer) session.getAttribute("book_no");
		int study_no = (Integer) session.getAttribute("study_no");
		
		//int uni_no = (Integer) session.getAttribute("uni_no");
		lecE.setUni_no(uni_no);
		List<Book> MainBook = ms.MainBook(book);
		List<Study> MainStudy = ms.MainStudy(study);

		List<LectureEval> MainpageLec = ms.MainpageLec(lecE);
		session.setAttribute("member_email", member_email);
		session.setAttribute("uni_no", uni_no);
		session.setAttribute("member_nick", member_nick);
		
		
		System.out.println("session member_email->"+member_email);
		
		model.addAttribute("study_no",study_no);
		model.addAttribute("book_no",book_no);
		model.addAttribute("leceval_no",leceval_no);

		model.addAttribute("member_email",member_email);
		model.addAttribute("uni_no",uni_no);
		model.addAttribute("member_nick",member_nick);
		model.addAttribute("member_no",member_no);
		model.addAttribute("member_grade",member_grade);
		model.addAttribute("MainBook",MainBook);
		model.addAttribute("MainStudy",MainStudy);

		model.addAttribute("MainpageLec",MainpageLec);
		member.setMember_email(member_email);
		//member.setUni_name(uni_name);
		return "/member/Mainpage";
	}

}
