package oracle.java.s20181202.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import oracle.java.s20181202.dao.LectureEvalDao;
import oracle.java.s20181202.model.LectureEval;
@Service
public class LectureEvalServiceImpl implements LectureEvalService{
	@Autowired
	private LectureEvalDao ld;
	@Override
	public int resetWarnLec(int leceval_no) {
		return ld.resetWarnLec(leceval_no);
	}
	@Override
	public int resetWarnStu(int leceval_no) {
		return ld.resetWarnStu(leceval_no);
	}
	@Override
	public int totalLec() {
		return ld.totalLec();
	}
	@Override
	public List<LectureEval> adminLecList(LectureEval lectureEval) {		
		return ld.adminLecList(lectureEval);
	}
}
