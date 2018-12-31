package oracle.java.s20181202.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.s20181202.model.Lecture;
import oracle.java.s20181202.model.LectureEval;
import oracle.java.s20181202.model.Member;
import oracle.java.s20181202.model.Professor;
import oracle.java.s20181202.model.Study;
import oracle.java.s20181202.model.University;
import oracle.java.s20181202.service.LecEvalService;
import oracle.java.s20181202.service.LectureService;
import oracle.java.s20181202.service.MemberService;
import oracle.java.s20181202.service.Paging;
import oracle.java.s20181202.service.ProfessorService;
import oracle.java.s20181202.service.StudyService;
import oracle.java.s20181202.service.UniversityService;

@Controller
public class adminController {
	
	@Autowired
	private StudyService es;
	@Autowired
	private LectureService ls;
	@Autowired
	private LecEvalService les;
	@Autowired
	private UniversityService us;
	@Autowired
	private MemberService ms;
	@Autowired 
	private ProfessorService ps;
	
	@RequestMapping(value = "nlist")
	public String nlist(Study study, String currentPage, Model model) {
//		String study_type = "공지";
//		int nListCnt = es.nListCnt(study_type);
		int noticetotal = es.noticetotal();
		Paging pg = new Paging(noticetotal,  currentPage);
		study.setStart(pg.getStart());
		study.setEnd(pg.getEnd());
		List<Study> nlist = es.nlist(study);
		model.addAttribute("nlist", nlist);
		model.addAttribute("pg", pg);
		return "/admin/nlist";
		
	}
	@RequestMapping(value="nwriteForm")
	public String nwriteForm() {
		return "/admin/nwriteForm";
		
	}
	@RequestMapping(value = "nwrite", method = RequestMethod.POST)
	public String write (Study study, Model model)  {
		int result = es.noticeInsert(study);
		model.addAttribute("result",result);
		return "/admin/adminNoticeWriteCheck"; 
			
		}
	
	@RequestMapping(value = "ndetail")
	public String ndetail(int study_no, Model model) {
		Study study = es.ndetail(study_no);
		model.addAttribute("study",study);
		return "/admin/ndetail";
	}
	@RequestMapping(value = "nupdateForm")
	public String nupdateForm(int study_no, Model model) {
		Study study = es.ndetail(study_no);
		model.addAttribute("study",study);
		return "/admin/nupdateForm";
	}
	@RequestMapping(value = "nupdate", method=RequestMethod.POST)
	public String nupdate (Study study, Model model) {
		 int result = 0;
	     result = es.nupdate(study);
	   //result = es.nupdate1(study);
	      
	      model.addAttribute("result",result);
	      System.out.println("지금이니?");
	      return "admin/adminNoticeUpdateCheck";	
	}
	@RequestMapping(value = "ndelete")
	public String ndelete(int study_no, Model model) {
		es.ndelete(study_no);
		return "redirect:nlist.do";
	}
	
	@RequestMapping(value = "admin")
	public String admin(HttpServletRequest request) {
		return "/admin/admin" ;
	}

	@RequestMapping(value = "lectureupdateForm")
	public String lectureupdateForm(int lec_no, Model model ) {
		Lecture lecture = ls.lecturedetail(lec_no);
		model.addAttribute("lecture", lecture);
		return "/admin/lectureupdateForm";
		
		
	}
	@RequestMapping(value = "lectureupdate", method = RequestMethod.POST)
	public String lectureupdate(Lecture lecture , String admin_pw, Member member, Model model ) {
		System.out.println("adminController lectureupdate lecture...");
		//String real_admin_pw = ms.getAdminPw();
		int result=0;
		result = ls.lectureupdate(lecture);
		model.addAttribute("result",result);

		System.out.println("지금이니?");
		return "/admin/adminLectureUpdateCheck";
	}
	@RequestMapping(value= "lectureInForm")
	public String lectureInForm() { 
		return "/admin/lectureInForm";
	}
	@RequestMapping(value = "lectureIn", method=RequestMethod.POST)
	public String lectureIn(Lecture lecture,String admin_pw, Member member,  Model model) { 
		
		String real_admin_pw = ms.getAdminPw();
		int result=0;
		if(admin_pw.equals(real_admin_pw)) {
			result = ls.letureinsert(lecture);
			model.addAttribute("result",result);
		}
		else {
			model.addAttribute("result",result);
		}
		return "/admin/adminLectureWriteCheck";
		
	}
	@RequestMapping (value = "lecturedetail")
	public String lecturedetail (int lec_no , Model model) {
		Lecture lecture = ls.lecturedetail(lec_no);
		model.addAttribute("lecture", lecture);
		return "/admin/lecturedetail";
	}
	@RequestMapping(value = "lecturelist")
	public String lecturelist(Lecture lecture, String currentPage,  Model model) {
		int lecturetotal = ls.lecturetotal();
		System.out.println("lecturetotal->"+lecturetotal);
		System.out.println("currentpage->"+currentPage);
		Paging pg = new Paging(lecturetotal, currentPage);
		
		lecture.setStart(pg.getStart());
		lecture.setEnd(pg.getEnd());
		
		System.out.println("pg.getStart()->"+pg.getStart());
		System.out.println("pg.getEnd()->"+pg.getEnd());
		List<Lecture> lecturelist  = ls.lecturelist(lecture);
		model.addAttribute("lecturelist", lecturelist);
		model.addAttribute("pg", pg);
		return "/admin/lecturelist";
				
		
	}
	@RequestMapping(value = "confirmlec")
	public String confirmlec(int lec_no , Model model) {
		Lecture lecture = ls.lecturedetail(lec_no);
		model.addAttribute("lec_no", lec_no);
		if (lecture != null) {
			model.addAttribute("msg", "중복된 번호");
			return "forward:lectureInForm.do";
			
		} else {
			model.addAttribute("msg", "사용 가능");
			return "forward:lectureInForm.do";
		}
	}
	
	@RequestMapping(value="uniForm") 
	public String uniForm() {
		return "/admin/uniForm";
	}
	@RequestMapping(value = "uniIn", method = RequestMethod.POST)
	public String uniIn (University university, Model model,String admin_pw,Member member) {
		//if admin pw
		String real_admin_pw = ms.getAdminPw();

		int result=0;
		if(admin_pw.equals(real_admin_pw)) {
			result =us.uinsert(university);
			model.addAttribute("result",result);
		}
		else {
			model.addAttribute("result",result);
		}
		return "/admin/adminUniWriteCheck";
	}
	
	@RequestMapping(value="adminLec")
	public String adminLec() {
		return "/admin/adminLec";
	}
	
	@RequestMapping(value="adminWarn")
	public String adminWarn() {
		return "/admin/adminWarn";
	}
	
	@RequestMapping(value="adminUniList")
	public String adminUniList(University university,String currentPage, Model model) {
		int adminunitotal = us.adminunitotal();
		System.out.println("adminUniTotal->"+adminunitotal);
		Paging adminUnipg = new Paging(adminunitotal,  currentPage);
		university.setStart(adminUnipg.getStart());
		university.setEnd(adminUnipg.getEnd());
		
		System.out.println("adminUnipg.getStart()->"+adminUnipg.getStart());
		System.out.println("adminUnipg.getEnd()->"+adminUnipg.getEnd());
		
		List<University> adminUniList = us.adminUniList(university);
		model.addAttribute("adminUniList", adminUniList);
		model.addAttribute("adminUnipg", adminUnipg);
		return "/admin/adminUniList";
	}
	@RequestMapping(value="admin_lecE")
	public String admin_lecE(LectureEval lectureEval,String currentPage,Model model) {
		int total = les.totalLec();
		Paging pg = new Paging(total,currentPage);
		System.out.println("totalStu"+total);
		lectureEval.setStart(pg.getStart());
		lectureEval.setEnd(pg.getEnd());
		List<LectureEval> adminLecList = les.adminLecList(lectureEval);
		System.out.println("adminLecList"+adminLecList.size());
		model.addAttribute("adminLecList",adminLecList);
		model.addAttribute("pg",pg);
		
		return"/admin/admin_lecE";
	}
	
	@RequestMapping(value="admin_study")
	public String admin_study(Study study,String currentPage,Model model) {
		int total = es.totalStu();
		Paging pg = new Paging(total,currentPage);
		System.out.println("totalStu"+total);
		study.setStart(pg.getStart());
		study.setEnd(pg.getEnd());
		List<Study> adminStudyList = es.adminStudyList(study);
		System.out.println("adminStudyList"+adminStudyList.size());		
		model.addAttribute("adminStudyList",adminStudyList);
		model.addAttribute("pg",pg);
		
		return"/admin/admin_study";
	}
	// 교수---------------------------------------------------------------------------
		@RequestMapping(value = "profList")
		public String profList(Model model ,Professor professor, String currentPage) { 
			int proftotal = ps.proftotal(); 
			Paging profpg  = new Paging(proftotal, currentPage);
			professor.setStart(profpg.getStart());
			professor.setEnd(profpg.getEnd());
			List<Professor> profList = ps.profList(professor);
			model.addAttribute("profList", profList);
			model.addAttribute("pg", profpg);
			
			return "/admin/profList";
		}


		
		@RequestMapping(value = "profInsertForm")
		public String profInsert() {
			return "/admin/profInsertForm";
		}

		@RequestMapping(value  = "profInsert", method = RequestMethod.POST)
		public String profInsert(Model model, Professor professor, Member member, String admin_pw) {
			String real_admin_pw = ms.getAdminPw();
			int result=0;
			if(admin_pw.equals(real_admin_pw)) {
				result = ps.profInsert(professor);
				model.addAttribute("result",result);
			}
			else {
				model.addAttribute("result",result);
			}
			return "/admin/adminProfInsertCheck";
		}
		@RequestMapping(value = "profDetail")
		public String profDetail(Model model, int prof_no) {
			
			Professor professor = ps.profDetail(prof_no);
			model.addAttribute("professor", professor);

			return "/admin/profDetail";
		}
//		@RequestMapping (value = "lecturedetail")
//		public String lecturedetail (int lec_no , Model model) {
//			Lecture lecture = ls.lecturedetail(lec_no);
//			model.addAttribute("lecture", lecture);
//			return "lecturedetail";
//		 
		@RequestMapping(value  = "profUpdateForm")
		public String profUpate(int prof_no, Model model) { 
			System.out.println("uuuuuuuuuuuuuuuuuuuuuuuu" + prof_no );

			Professor professor = ps.profDetail(prof_no);
			model.addAttribute("professor", professor);
			return "/admin/profUpdateForm";
		}
		@RequestMapping (value = "profUpate", method = RequestMethod.POST )
		public String lectureupdate(Professor professor , Model model ) {
			int result=0;
			result = ps.profUpate(professor);
			model.addAttribute("result",result);
			return "/admin/adminProfUpdateCheck";
		}
}
