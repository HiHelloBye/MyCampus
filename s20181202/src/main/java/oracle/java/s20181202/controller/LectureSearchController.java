package oracle.java.s20181202.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.java.s20181202.model.LectureEval;
import oracle.java.s20181202.service.ExamInfoService;
import oracle.java.s20181202.service.LecEvalService;
import oracle.java.s20181202.service.Paging;

@Controller
public class LectureSearchController {
	@Autowired
	private LecEvalService les;
	
	@RequestMapping(value="lectureSearchResult")
	public String lectureSearchResult(LectureEval lectureEval, String currentPage, Model model,String search, HttpSession session) {
		int uni_no = (Integer) session.getAttribute("uni_no");
		int searchtotal = les.searchtotal(search);
		System.out.println("search searchtotal=>" + searchtotal);
		System.out.println("search currentPage=>" + currentPage);
		
		Paging pgsearch = new Paging(searchtotal, currentPage);
		lectureEval.setSearch(search);
		
		System.out.println("search->"+search);
		lectureEval.setStart(pgsearch.getStart());   // 시작시 1
		lectureEval.setEnd(pgsearch.getEnd());     // 시작시 10 
		lectureEval.setUni_no(uni_no);
		
		System.out.println("pgsearch.getStart()->"+pgsearch.getStart());
		System.out.println("pgsearch.getEnd()->"+pgsearch.getEnd());
		//검색시, 기본 정보 출력
		List<LectureEval> searchList = les.searchList(lectureEval);
		
		model.addAttribute("searchList",searchList);
		model.addAttribute("pgsearch",pgsearch);
		model.addAttribute("search",search);
		
		return "/lecEval/lecSearchResult";
	}
}
