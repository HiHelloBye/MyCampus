package oracle.java.s20181202.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import oracle.java.s20181202.model.StudyComm;
import oracle.java.s20181202.service.StudyService;

@RestController
@RequestMapping("/sample")
public class StudyRestController {
	@Autowired
	private StudyService ss;
	
	@RequestMapping(value="writeCmt")
	public StudyComm writeCmt(StudyComm studyComm) {
		ss.writeCmt(studyComm);

		int study_no = studyComm.getStudy_no();
		System.out.println("@RestController study_no->"+study_no);
		String comm_cont = studyComm.getComm_cont();
		int comm_type = studyComm.getComm_type();
		String comm_writer = studyComm.getComm_writer();
		System.out.println("@RestController comm_type->"+comm_type);
		StudyComm vo = new StudyComm();
		vo.setStudy_no(study_no);
		vo.setComm_writer(comm_writer);
		vo.setComm_type(comm_type);
		vo.setComm_cont(comm_cont);
		System.out.println("@RestController comm_cont->"+comm_cont);
		
		return vo;
	}
	
	@RequestMapping(value="studyCommDelete")
	public StudyComm studyCommDelete(StudyComm studyComm,int comm_no) {
		int bgroup = studyComm.getBgroup();
		System.out.println("bgroup"+bgroup);
		int bstep = studyComm.getBstep();
		System.out.println("bstep"+bstep);
		System.out.println("comm_no"+comm_no);
		int k = ss.studyCommDelete(comm_no);
		StudyComm vo = new StudyComm();
		vo.setBgroup(bgroup);
		vo.setBstep(bstep);
		vo.setComm_no(comm_no);		
		return vo;
	}
	@RequestMapping(value="studyCompDelete")
	public StudyComm  studyCompDelete(int comm_no) {
		int k = ss.studyCompDelete(comm_no);
		System.out.println("comm_no"+comm_no);
		StudyComm vo = new StudyComm();
		vo.setComm_no(comm_no);	
		return vo;
		}
	@RequestMapping(value="studyCommUpdateForm")
	public StudyComm studyCommUpdateForm(StudyComm studyComm) {
		int comm_no = studyComm.getComm_no();
		int study_no = studyComm.getStudy_no();
		String comm_cont  = studyComm.getComm_cont();				
		System.out.println("comm_no"+comm_no);
		System.out.println("study_no"+study_no);
		System.out.println("comm_cont"+comm_cont);
		//System.out.println("comm_cont"+comm_cont);
		studyComm =ss.studyCommUpdateForm(studyComm);
		studyComm.setStudy_no(study_no);
		studyComm.setComm_no(comm_no);
		studyComm.setComm_cont(comm_cont);	
		return studyComm;
		
	}
	
	@RequestMapping(value="studyCommUpdate")
	public  StudyComm studyCommUpdate(StudyComm studyComm) {
		int comm_no = studyComm.getComm_no();
		int study_no = studyComm.getStudy_no();
		int comm_type = studyComm.getComm_type();
		String comm_cont  = studyComm.getComm_cont();				
		System.out.println("comm_no"+comm_no);
		System.out.println("study_no"+study_no);
		System.out.println("comm_cont"+comm_cont);
		System.out.println("comm_type"+comm_type);
		StudyComm vo = new StudyComm();
		ss.studyCommUpdate(studyComm);
		vo.setStudy_no(study_no);
		vo.setComm_no(comm_no);
		vo.setComm_cont(comm_cont);
		vo.setComm_type(comm_type);
		return vo;
	}
	@RequestMapping(value="writeReCmt")
	public StudyComm writeReCmt(StudyComm studyComm) {
		ss.writeReCmt(studyComm);
		int study_no = studyComm.getStudy_no();
		System.out.println("@RestController study_no->"+study_no);
		String comm_cont = studyComm.getComm_cont();
		int comm_type = studyComm.getComm_type();
		int bgroup = studyComm.getBgroup();
		int bstep = studyComm.getBstep();
		int comm_no = studyComm.getComm_no();
		String comm_writer = studyComm.getComm_writer();
		System.out.println("@RestController deptno->"+comm_type);
		StudyComm vo = new StudyComm();
		vo.setStudy_no(study_no);
		vo.setComm_writer(comm_writer);
		vo.setComm_type(comm_type);
		vo.setComm_cont(comm_cont);
		vo.setBstep(bstep);
		vo.setBgroup(bgroup);
		System.out.println("@RestController comm_no->"+comm_no);
		System.out.println("@RestController comm_cont->"+comm_cont);
		System.out.println("@RestController bstep->"+bstep);
		System.out.println("@RestController bgroup->"+bgroup);		
		return vo;
	}
}
