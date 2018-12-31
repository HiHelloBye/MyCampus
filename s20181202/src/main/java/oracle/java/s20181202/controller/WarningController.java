package oracle.java.s20181202.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.s20181202.controller.vo.WarningVO;
import oracle.java.s20181202.model.LectureEval;
import oracle.java.s20181202.model.Study;
import oracle.java.s20181202.service.LectureEvalService;
import oracle.java.s20181202.service.StudyService;
import oracle.java.s20181202.service.WarningVOService;

@Controller
public class WarningController {
	@Autowired
	private WarningVOService ws;
	@Autowired
	private StudyService ss;
	@Autowired
	private LectureEvalService ls;
	
	@RequestMapping(value="insertWarningForm",method=RequestMethod.GET)
	public String insertWarningForm(Locale locale,Model model) {
		System.out.println("insertWarningForm Start");
		return"insertWarningForm";
	}
	@RequestMapping(value="insertWarning",method= {RequestMethod.POST,RequestMethod.GET})
	public String insertWarning(WarningVO warningVO,Model model) {
		System.out.println("insertWarning start...");
		int type_no = warningVO.getType_no();
		int study_leceval = warningVO.getStudy_leceval();
		int member_no = warningVO.getMember_no();
		int warn_count=0;
		
		warningVO.setType_no(type_no);
		warningVO.setStudy_leceval(study_leceval);
		warningVO.setMember_no(member_no);

		int k= ws.selectWarn(warningVO);
		System.out.println("k"+k);
		if(k==1) {
				model.addAttribute("msg","1");
				model.addAttribute("msg1","이미 신고를 했습니다.");				
				System.out.println("warning NULL");
				
		} else {				
				ws.insertWarning(warningVO);							
				model.addAttribute("msg1","1");
				model.addAttribute("msg","신고가 완료 되었습니다.");		
				model.addAttribute("warningVO",warningVO);							
		}	
			if(type_no==1) {
				warn_count= ws.selectWarnCnt(warningVO);		
				model.addAttribute("warn_count",warn_count);
				warningVO.setWarn_count(warn_count);
				System.out.println("warn_count"+warn_count);
				
				ws.updateWarnStudy(warningVO);
				System.out.println("warn_count_stu"+warn_count);
				return"study/warnStudyCheck";
			}else {
				warn_count= ws.selectWarnCnt(warningVO);		
				model.addAttribute("warn_count",warn_count);
				warningVO.setWarn_count(warn_count);
				System.out.println("warn_count"+warn_count);
				
				ws.updateWarnLec(warningVO);
				System.out.println("warn_count_lec"+warn_count);
				return"warnCheck";
			}
		}
	@RequestMapping(value = "warnDelLec",method= {RequestMethod.POST,RequestMethod.GET})
	public String warnDelLec(WarningVO warningVO,Model model) {
		int study_leceval = warningVO.getStudy_leceval();
		int type_no = warningVO.getType_no();
		WarningVO vo1 = new WarningVO();
		vo1.setStudy_leceval(study_leceval);
		vo1.setType_no(type_no);
		System.out.println("study_leceval"+study_leceval);
		System.out.println("type_no"+type_no);		
		int result = ws.warnDelLec(warningVO);
		System.out.println("result"+result);
		model.addAttribute("result",result);	
		return "/admin/warnDelLec";
	}
	@RequestMapping(value = "warnDelStu",method= {RequestMethod.POST,RequestMethod.GET})
	public String warnDelStu(WarningVO warningVO,Model model) {
		int study_leceval = warningVO.getStudy_leceval();
		int type_no = warningVO.getType_no();		
		WarningVO vo1 = new WarningVO();
		vo1.setStudy_leceval(study_leceval);
		vo1.setType_no(type_no);
		System.out.println("study_leceval"+study_leceval);
		System.out.println("type_no"+type_no);	
		int result = ws.warnDelStu(warningVO);		
		System.out.println("result"+result);
		model.addAttribute("result",result);
		return "/admin/warnDelStu";
	}
	@RequestMapping(value = "resetWarnLec")
	public String resetWarnLec(int leceval_no,Model model) {
		int result  = ls.resetWarnLec(leceval_no);
		System.out.println("resetWarnLec"+result);
		model.addAttribute("result",result);
		return "/admin/resetWarnLec";	
	}
	@RequestMapping(value = "resetWarnStu")
	public String resetWarnStu(int study_no,Model model) {
		int result  = ls.resetWarnStu(study_no);
		System.out.println("resetWarnStu"+result);
		model.addAttribute("result",result);
		return "/admin/resetWarnStu";		
	}
	
	
}
