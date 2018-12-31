package oracle.java.s20181202.dao;

import java.util.HashMap;
import java.util.List;

import oracle.java.s20181202.model.LectureEval;

public interface LectureEvalDao {
	List<LectureEval> list(LectureEval lectureEval);
	List<LectureEval> lecEvalDetail(LectureEval lectureEval);
	List<LectureEval> lecTermList(int lec_no);
	LectureEval lecEvalAvgHw(LectureEval lectureEval);
	LectureEval lecEvalAvgRat(LectureEval lectureEval);
	LectureEval lecEvalAvgEx(LectureEval lectureEval);
	LectureEval lecEvalAvgAtt(LectureEval lectureEval);
	LectureEval lecEvalAvgSc(LectureEval lectureEval);
	
	List<LectureEval> searchList(LectureEval lectureEval);
	
	
	int insert(LectureEval lectureEval);
	int total();
	int searchtotal(String search) ;
	
	//양으뜸
	int resetWarnLec(int leceval_no);
	int resetWarnStu(int study_no);
	int totalLec();
	public List<LectureEval> adminLecList(LectureEval lectureEval);
}
