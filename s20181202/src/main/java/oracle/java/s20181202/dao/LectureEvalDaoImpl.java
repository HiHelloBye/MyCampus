package oracle.java.s20181202.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20181202.model.LectureEval;
@Repository
public class LectureEvalDaoImpl implements LectureEvalDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int total() {
		// emp.xml->id(total), return int
		return session.selectOne("total");
	}
	@Override
	public List<LectureEval> list(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return session.selectList("listEvalAll", lectureEval);
	}
	@Override
	public List<LectureEval> lecEvalDetail(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		System.out.println("LecEvalServiceImplDAO  lecEvalDetail Start...");
		return session.selectList("lecEvalDetail", lectureEval);
	}
	@Override
	public List<LectureEval> lecTermList(int lec_no) {
		// TODO Auto-generated method stub
		return session.selectList("lecTermList",lec_no);
	}
	@Override
	public int insert(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return session.insert("insertlLecEval",lectureEval);
	}
	@Override
	public LectureEval lecEvalAvgHw(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return session.selectOne("lecEvalAvgHw",lectureEval);
	}
	@Override
	public LectureEval lecEvalAvgRat(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return session.selectOne("lecEvalAvgRat",lectureEval);
	}
	@Override
	public LectureEval lecEvalAvgEx(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return session.selectOne("lecEvalAvgEx",lectureEval);
	}
	@Override
	public LectureEval lecEvalAvgAtt(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return session.selectOne("lecEvalAvgAtt", lectureEval);
	}
	@Override
	public LectureEval lecEvalAvgSc(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return session.selectOne("lecEvalAvgSc",lectureEval);
	}
	@Override
	public List<LectureEval> searchList(LectureEval lectureEval) {
		// TODO Auto-generated method stub
		return session.selectList("searchList",lectureEval);
	}
	@Override
	public int searchtotal(String search) {
		// TODO Auto-generated method stub
		return session.selectOne("searchtotal",search);
	}
	//양으뜸
	@Override
	public int resetWarnLec(int leceval_no) {
		return session.update("resetWarnLec",leceval_no);
	}
	@Override
	public int resetWarnStu(int study_no) {
		return session.update("resetWarnStu",study_no);
	}
	@Override
	public int totalLec() {
		return session.selectOne("totalLec");
	}
	@Override
	public List<LectureEval> adminLecList(LectureEval lectureEval) {		
		return session.selectList("adminLecList",lectureEval);
	}
}
