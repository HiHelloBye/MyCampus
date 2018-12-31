package oracle.java.s20181202.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.java.s20181202.HomeController;
import oracle.java.s20181202.model.LectureEval;
import oracle.java.s20181202.model.Member;
import oracle.java.s20181202.model.Search;
import oracle.java.s20181202.service.Paging;
import oracle.java.s20181202.service.ResultService;

@Controller
public class ResultPageController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private ResultService rs;
	@RequestMapping(value = "searchResult")
	public String searchA(Search search,LectureEval lectureEval, Model model, Member member, HttpSession session) {
		String code = search.getCode();
		String keyword = search.getKeyword();
		String currentPage = search.getCurrentPage();
		if(currentPage==null) {
			currentPage="1";
		}
		lectureEval.setSearch(keyword);
		System.out.println("code=====>"+code);
		System.out.println("keyword=====>"+keyword);
		if (code.equals("LectureEval")) {
			int searchtotal = rs.searchtotalA(keyword);
			System.out.println("searchtotal=====>"+searchtotal);
			System.out.println("currentPage=====>"+currentPage);
			Paging pgsearch = new Paging(searchtotal, currentPage);
			int start = pgsearch.getStart();
			int end = pgsearch.getEnd();
			lectureEval.setStart(start); 
			lectureEval.setEnd(end); 
			System.out.println("start========>"+start);
			System.out.println("end========>"+end);
			Search vo1 = new Search();
			vo1.setKeyword(keyword);
			vo1.setStart(start);
			vo1.setEnd(end);
			List<Search> searchA = rs.searchA(vo1);

			model.addAttribute("searchA",searchA);
			model.addAttribute("pgsearch",pgsearch);
		} else if (code.equals("Book")) {

			int searchtotal = rs.searchtotalB(keyword);
			Paging pgsearch = new Paging(searchtotal, currentPage);
			int start = pgsearch.getStart();
			int end = pgsearch.getEnd();
			lectureEval.setStart(start); 
			lectureEval.setEnd(end); 

			Search vo2 = new Search();
			vo2.setKeyword(keyword);
			vo2.setStart(start);
			vo2.setEnd(end);
			List<Search> searchB = rs.searchB(vo2);
			for (int i=0;i<searchB.size(); i++) {
				
				String tmpMet = searchB.get(i).getBook_met();
				
				if(tmpMet.equals("10")) {
					searchB.get(i).setBook_met("택배: 가능");
				} else if(tmpMet.equals("01")) {
					searchB.get(i).setBook_met("직거래: 가능");
				} else {
					searchB.get(i).setBook_met("택배: 가능 | 직거래: 가능");
				}
			
			}
			
			model.addAttribute("searchB",searchB);
			model.addAttribute("pgsearch",pgsearch);
		} else {
			
			int searchtotal = rs.searchtotalC(keyword);
			Paging pgsearch = new Paging(searchtotal, currentPage);
			int start = pgsearch.getStart();
			int end = pgsearch.getEnd();
			lectureEval.setStart(start); 
			lectureEval.setEnd(end); 
			System.out.println("start========>"+start);
			System.out.println("end========>"+end);

			Search vo3 = new Search();
			vo3.setKeyword(keyword);
			vo3.setStart(start);
			vo3.setEnd(end);
			List<Search> searchC = rs.searchC(vo3);
			
			model.addAttribute("searchC",searchC);
			model.addAttribute("pgsearch",pgsearch);
		}
		model.addAttribute("Scode",code);
		model.addAttribute("Skeyword",keyword);

		return "member/ResultPage";
		
	}
}
