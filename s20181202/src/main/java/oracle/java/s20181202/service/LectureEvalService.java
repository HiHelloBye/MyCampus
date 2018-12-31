package oracle.java.s20181202.service;

import java.util.List;

import oracle.java.s20181202.model.LectureEval;

public interface LectureEvalService {
	int resetWarnLec(int leceval_no);
	int resetWarnStu(int study_no);
	int totalLec();
	List<LectureEval> adminLecList(LectureEval lectureEval);
	
}
