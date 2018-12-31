package oracle.java.s20181202.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.s20181202.model.ExamInfo;
import oracle.java.s20181202.service.ExamInfoService;

@Controller
public class ExamInfoController {
	@Autowired
	private ExamInfoService eis;
	
	@RequestMapping(value="writeExamInfo",method=RequestMethod.POST)
	public String writeExamInfo(ExamInfo examInfo, Model model,String att_year, String att_term) {
		System.out.println("writeExamInfo start ...");
		
		examInfo.setAtt_term(att_term);
		
		int result = eis.insertExamInfo(examInfo);
		System.out.println("result->"+result);
		model.addAttribute("result",result);
		return "/lecEval/ExamInfoWriteCheck";
		
	}
}
