package oracle.java.s20181202.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20181202.dao.LectureEvalDao;
import oracle.java.s20181202.model.LectureEval;


@Service
public class LecEvalServiceImpl implements LecEvalService {
	@Autowired
	private LectureEvalDao led;
	
		// ed->EmpDaoImpl 
	@Override
	public List<LectureEval> list(LectureEval lectureEval) {
		return led.list(lectureEval);
	}
	// ed->EmpDaoImpl 
	@Override
	public int total() {
		return led.total();
	}
	@Override
	public List<LectureEval> lecEvalDetail(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		System.out.println("LecEvalServiceImpl lecEvalDetail Start...");

		return led.lecEvalDetail(lectureEval);
	}
	@Override
	public List<LectureEval> lecTermList(int lec_no) {
		// TODO Auto-generated method stub
		return led.lecTermList(lec_no);
	}
	@Override
	public int insert(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return led.insert(lectureEval);
	}
	@Override
	public LectureEval lecEvalAvgHw(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return led.lecEvalAvgHw(lectureEval);
	}
	@Override
	public LectureEval lecEvalAvgRat(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return led.lecEvalAvgRat(lectureEval);
	}
	@Override
	public LectureEval lecEvalAvgEx(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return led.lecEvalAvgEx(lectureEval);
	}
	@Override
	public LectureEval lecEvalAvgAtt(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return led.lecEvalAvgAtt(lectureEval);
	}
	@Override
	public LectureEval lecEvalAvgSc(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return led.lecEvalAvgSc(lectureEval);
	}
	@Override
	public List<LectureEval> searchList(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return led.searchList(lectureEval);
	}
	@Override
	public int searchtotal(String search) {
		return led.searchtotal(search);
	}
	@Override
	public int resetWarnLec(int leceval_no) {
		return led.resetWarnLec(leceval_no);
	}
	@Override
	public int resetWarnStu(int leceval_no) {
		return led.resetWarnStu(leceval_no);
	}
	@Override
	public int totalLec() {
		return led.totalLec();
	}
	@Override
	public List<LectureEval> adminLecList(LectureEval lectureEval) {		
		return led.adminLecList(lectureEval);
	}
	
	
}
