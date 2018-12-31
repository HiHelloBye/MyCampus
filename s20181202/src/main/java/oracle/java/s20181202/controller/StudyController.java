package oracle.java.s20181202.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.s20181202.model.Study;
import oracle.java.s20181202.model.StudyComm;
import oracle.java.s20181202.service.ChiPaging;
import oracle.java.s20181202.service.EdyStudyPaging;
import oracle.java.s20181202.service.EngPaging;
import oracle.java.s20181202.service.Etc1Paging;
import oracle.java.s20181202.service.EtcPaging;
import oracle.java.s20181202.service.IntPaging;
import oracle.java.s20181202.service.JapPaging;
import oracle.java.s20181202.service.JobPaging;
import oracle.java.s20181202.service.LangPaging;
import oracle.java.s20181202.service.StudyPaging;
import oracle.java.s20181202.service.StudyService;
import oracle.java.s20181202.service.TesPaging;
@Controller
public class StudyController {
	@Autowired
	private StudyService ss;
	
	@RequestMapping(value="study/StudyList")
	public String boardStudyList(HttpServletRequest request,Study study, String currentBoardPage,String currentEtc1Page,
			String currentJapPage,String currentEngPage,String currentLangPage,String currentJobPage, 
			String currentEtcPage,String currentChiPage,String currentIntPage,String currentTesPage,Model model) {
		
		int studyTotal = ss.studyTotal();
		int jobTotal = ss.jobTotal();
		int langTotal = ss.langTotal();
		int intTotal = ss.intTotal();
		int tesTotal = ss.tesTotal();
		int etc1Total = ss.etc1Total();
		int engTotal = ss.engTotal();
		int japTotal = ss.japTotal();
		int chiTotal = ss.chiTotal();
		int etcTotal = ss.etcTotal();
		
		System.out.println("total->"+studyTotal);	
		System.out.println("currentBoardPage->"+currentBoardPage);
		
		StudyPaging sp = new StudyPaging(studyTotal,currentBoardPage);
		LangPaging sp2 = new LangPaging(langTotal,currentLangPage);
		JobPaging sp1 = new JobPaging(jobTotal,currentJobPage);
		EngPaging sp3 = new EngPaging(engTotal,currentEngPage);
		JapPaging sp4 = new JapPaging(japTotal,currentJapPage);
		Etc1Paging sp5 = new Etc1Paging(etc1Total,currentEtc1Page);
		EtcPaging sp6 = new EtcPaging(etcTotal,currentEtcPage);
		ChiPaging sp7 =new ChiPaging(chiTotal,currentChiPage);
		TesPaging sp8 = new TesPaging(tesTotal,currentTesPage);
		IntPaging sp9 =new IntPaging(intTotal,currentIntPage);
		
		study.setStart(sp.getStart());
		study.setEnd(sp.getEnd());
		study.setStartJob(sp1.getStartJob());
		study.setEndJob(sp1.getEndJob());
		study.setStartLang(sp2.getStartLang());
		study.setEndLang(sp2.getEndLang());
		study.setStartEng(sp3.getStartEng());
		study.setEndEng(sp3.getEndEng());
		study.setStartJap(sp4.getStartJap());
		study.setEndJap(sp4.getEndJap());
		study.setStartEtc1(sp5.getStartEtc1());
		study.setEndEtc1(sp5.getEndEtc1());
		study.setStartEtc(sp6.getStartEtc());
		study.setEndEtc(sp6.getEndEtc());
		study.setStartChi(sp7.getStartChi());
		study.setEndChi(sp7.getEndChi());
		study.setStartTes(sp8.getStartTes());
		study.setEndTes(sp8.getEndTes());
		study.setStartInt(sp9.getStartInt());
		study.setEndInt(sp9.getEndInt());
		
		List<Study> boardStudyList = ss.boardStudyList(study);
		List<Study> boardJobStudyList = ss.boardJobStudyList(study);
		List<Study> boardLangStudyList = ss.boardLangStudyList(study);
		List<Study> boardIntStudyList = ss.boardIntStudyList(study);
		List<Study> boardTesStudyList = ss.boardTesStudyList(study);
		List<Study> boardEtcStudyList = ss.boardEtcStudyList(study);
		List<Study> boardEngStudyList = ss.boardEngStudyList(study);
		List<Study> boardChiStudyList = ss.boardChiStudyList(study);
		List<Study> boardEtc1StudyList = ss.boardEtc1StudyList(study);
		List<Study> boardJapStudyList = ss.boardJapStudyList(study);
		
		System.out.println("boardStudyList"+boardStudyList.size());
		
		model.addAttribute("boardStudyList",boardStudyList);
		model.addAttribute("boardJobStudyList",boardJobStudyList);
		model.addAttribute("boardLangStudyList",boardLangStudyList);
		
		model.addAttribute("boardIntStudyList",boardIntStudyList);
		model.addAttribute("boardTesStudyList",boardTesStudyList);
		model.addAttribute("boardEtcStudyList",boardEtcStudyList);
		model.addAttribute("boardEngStudyList",boardEngStudyList);
		model.addAttribute("boardChiStudyList",boardChiStudyList);
		model.addAttribute("boardEtc1StudyList",boardEtc1StudyList);
		model.addAttribute("boardJapStudyList",boardJapStudyList);		
		model.addAttribute("sp",sp);
		model.addAttribute("sp1",sp1);
		model.addAttribute("sp2",sp2);
		model.addAttribute("sp3",sp3);
		model.addAttribute("sp4",sp4);
		model.addAttribute("sp5",sp5);
		model.addAttribute("sp6",sp6);
		model.addAttribute("sp7",sp7);
		model.addAttribute("sp8",sp8);
		model.addAttribute("sp9",sp9);
		
		return "study/StudyList";
	}

	@RequestMapping(value="study/StudyContent")
	public String studyContent(int study_no,Model model) {
		Study study = ss.studyContent(study_no);		
		List<StudyComm> studyComments = ss.studyComments(study_no);		
		//int nextStudy =ss.nextStudy(study_no);
		//int prevStudy =ss.prevStudy(study_no);

//		String profile 	= study.getMember_photo();
//		String cont 	= study.getStudy_cont();
//		String srcTmp 	= cont;
//		String proTmp = profile;
//		
//		
//		int count = StringUtils.countMatches(cont, "resources");
//		count = StringUtils.countMatches(profile, "resources");
//		
//
//		if (count == 0) {
//		
//		}
//		else {
//			String target = "../resources";
//			srcTmp = srcTmp.replaceAll(target, "./resources");
//			proTmp = proTmp.replaceAll(target, "./resources");
//			
//		}
//		
//		System.out.println(srcTmp);
//		study.setStudy_cont(srcTmp);
//		study.setMember_photo(proTmp);		
		
		
		//System.out.println("nextStudy"+nextStudy);
		model.addAttribute("studyComments",studyComments);
		model.addAttribute("study",study);
		//model.addAttribute("nextStudy",nextStudy);
		//model.addAttribute("prevStudy",prevStudy);
		return"study/StudyContent";
	}
	@RequestMapping(value="study/StudyWriteForm")
	public String StudyWriteForm(Model model) {
		
		return"study/StudyWriteForm";
	}
	@RequestMapping(value="study/studyWrite",method=RequestMethod.POST)
	public String studyWrite(Study study,Model model) {		
		int result = ss.studyWrite(study);
		System.out.println("result"+result);
		
		if (result>0) return "redirect:StudyList.do";
		else {
			model.addAttribute("msg","입력 실패 확인해 보세요");			
		}
		return"forward:study/StudyWriteForm.do";
	}
	@RequestMapping(value="study/StudyUpdateForm")
	public String StudyUpdateForm(int study_no,Model model) {
		Study study = ss.StudyUpdateForm(study_no);
		
		
		model.addAttribute("study",study);
	
		return"study/StudyUpdateForm";
	}
	@RequestMapping(value="study/studyUpdate", method=RequestMethod.POST)
	public String studyUpdate(Study study,Model model) {
		int k = ss.studyUpdate(study);
		int study_no = study.getStudy_no();
		if (k>0) {
			//model.addAttribute("study",study);
			model.addAttribute("study_no",study_no);
			return "redirect:StudyContent.do";
		}
			
		else {
			model.addAttribute("study_no",study_no);
			model.addAttribute("msg","입력 실패 확인해 보세요");			
		}
		return "forward:StudyUpdateForm.do";
	}
	@RequestMapping(value="study/updateState")
	public String updateState(int study_no,String currentPage,Model model) {
		int k = ss.updateState(study_no);
		
		return "redirect:StudyList.do";
	}
	@RequestMapping(value="study/a")
	public void popupOpen(Model model) {
	}
	
	@RequestMapping(value="study/EdyStudySearch",method={RequestMethod.POST,RequestMethod.GET})
	public String EdyStudySearch(Model model,Study study,String currentBoardPage) {
		String keywordStudy = study.getKeywordStudy();
		int studyTotal = ss.edyStudyTotal(keywordStudy);			
		EdyStudyPaging sp = new EdyStudyPaging(studyTotal,currentBoardPage);
		study.setStart(sp.getStart());
		study.setEnd(sp.getEnd());
		study.setKeywordStudy(keywordStudy);		
		
		List<Study> edySearchStudyList = ss.edySearchStudyList(study);
		System.out.println("edySearchStudyList"+edySearchStudyList.size());
		System.out.println("studyTotal"+studyTotal);
		List<Study> edyStudyList = ss.edyStudyList(study);
		model.addAttribute("edyStudyList",edyStudyList);
		model.addAttribute("edySearchStudyList",edySearchStudyList);
		model.addAttribute("sp",sp);

		
		return "study/EdyStudySearch";
	}

}
