package oracle.java.s20181202.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.s20181202.model.ExamInfo;

import oracle.java.s20181202.model.LectureEval;
import oracle.java.s20181202.model.Member;
import oracle.java.s20181202.service.ExamInfoService;
import oracle.java.s20181202.service.LecEvalService;

import oracle.java.s20181202.service.Paging;



@Controller
public class LecEvalController {
	@Autowired
	private LecEvalService les;
	@Autowired
	private ExamInfoService eis;
	
	
	@RequestMapping(value="lectureEvalMain")
	public String LecEvalList(LectureEval lectureEval, String currentPage, Model model, HttpSession session) {
		int uni_no = (Integer) session.getAttribute("uni_no");
		int total = les.total();
		System.out.println("total=>" + total);
		System.out.println("currentPage=>" + currentPage);
		
		Paging pgeval = new Paging(total, currentPage);
		lectureEval.setStart(pgeval.getStart());   // 시작시 1
		lectureEval.setEnd(pgeval.getEnd());     // 시작시 10 
		lectureEval.setUni_no(uni_no);
		List<LectureEval> listeval = les.list(lectureEval);

		model.addAttribute("listeval",listeval);
		model.addAttribute("pgeval",pgeval);
		
		return "/lecEval/lectureEvalMain";
	}
	@RequestMapping(value="lecEvalDetail")
	public String LecEvalDetail(ExamInfo examInfo,LectureEval lectureEval,int lec_no, int uni_no,Model model) {
		System.out.println("lecEvalDetail Start...");
		//강의평가 상세 내용
		lectureEval.setUni_no(uni_no);
		lectureEval.setLec_no(lec_no);
		List<LectureEval> lecEvalDetail = les.lecEvalDetail(lectureEval);
		
		//수강학기 콤보박스 리스트
		List<LectureEval> lecTermList = les.lecTermList(lec_no);
		
		//강의 평균 총점
		LectureEval lecEvalAvgSc = les.lecEvalAvgSc(lectureEval);
		
		//강의 평균 과제
		LectureEval lecEvalAvgHw = les.lecEvalAvgHw(lectureEval);
		//강의 평균 학점비율
		LectureEval lecEvalAvgRat = les.lecEvalAvgRat(lectureEval);
		//강의 평균 시험횟수
		LectureEval lecEvalAvgEx = les.lecEvalAvgEx(lectureEval);
		//강의 평균 출결
		LectureEval lecEvalAvgAtt = les.lecEvalAvgAtt(lectureEval);
		
		//시험정보 조회
		examInfo.setLec_no(lec_no);
		examInfo.setUni_no(uni_no);
		List<ExamInfo> ExamInfoDetail  = eis.ExamInfoDetail(examInfo);
		
		model.addAttribute("ExamInfoDetail",ExamInfoDetail);
		model.addAttribute("lecEvalAvgAtt", lecEvalAvgAtt);
		model.addAttribute("lecEvalAvgEx", lecEvalAvgEx);
		model.addAttribute("lecEvalAvgRat",lecEvalAvgRat);
		model.addAttribute("lecEvalAvgHw",lecEvalAvgHw);
		model.addAttribute("lecEvalDetail",lecEvalDetail);
		model.addAttribute("lecTermList",lecTermList);
		model.addAttribute("lecEvalAvgSc",lecEvalAvgSc);
		return "/lecEval/lecevalDetail";
	}
	@RequestMapping(value="writeLecEval",method=RequestMethod.POST)
	public String writeLecEval(LectureEval LectureEval, Model model,String lec_score,String att_term) {
		System.out.println("writeLecEval start ...");
	
		float temp = Float.parseFloat(lec_score);
		

		LectureEval.setLec_score(temp);
		LectureEval.setAtt_term(att_term);
		
		int result = les.insert(LectureEval);
		System.out.println("les.insert(LectureEval) end ...->"+result);
		model.addAttribute("result",result);
		return "/lecEval/lectureEvalWriteCheck";
		
	}
}
