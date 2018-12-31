package oracle.java.s20181202.service;

import java.util.HashMap;
import java.util.List;

import oracle.java.s20181202.model.LectureEval;


public interface LecEvalService {
	List<LectureEval> list(LectureEval lec_no);
	List<LectureEval> lecEvalDetail(LectureEval lectureEval);
	List<LectureEval> lecTermList(int lec_no);
	LectureEval lecEvalAvgSc(LectureEval lectureEval);
	LectureEval lecEvalAvgHw(LectureEval lectureEval);
	LectureEval lecEvalAvgRat(LectureEval lectureEval);
	LectureEval lecEvalAvgEx(LectureEval lectureEval);
	LectureEval lecEvalAvgAtt(LectureEval lectureEval);
	
	
	List<LectureEval> searchList(LectureEval lectureEval);
	
	
	int 	insert(LectureEval lectureEval);
	int       total();
	int searchtotal(String search);
	//양
	int resetWarnLec(int leceval_no);
	int resetWarnStu(int study_no);
	int totalLec();
	List<LectureEval> adminLecList(LectureEval lectureEval);
}
