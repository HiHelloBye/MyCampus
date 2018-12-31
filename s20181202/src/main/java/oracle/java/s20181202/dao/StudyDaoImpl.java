package oracle.java.s20181202.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20181202.controller.vo.WarningVO;
import oracle.java.s20181202.model.Study;
import oracle.java.s20181202.model.StudyComm;
@Repository
public class StudyDaoImpl implements StudyDao {
	@Autowired
	private SqlSession session;
	@Override
	public int studyTotal() {
		return session.selectOne("studyTotal");
	}
	@Override
	public int jobTotal() {
		return session.selectOne("jobTotal");
	}
	@Override
	public int langTotal() {
		return session.selectOne("langTotal");
	}	
	@Override
	public int intTotal() {
		return session.selectOne("intTotal");
	}
	@Override
	public int tesTotal() {
		return session.selectOne("tesTotal");
	}
	@Override
	public int etc1Total() {
		return session.selectOne("etc1Total");
	}
	@Override
	public int etcTotal() {
		return session.selectOne("etcTotal");
	}
	@Override
	public int engTotal() {
		return session.selectOne("engTotal");
	}
	@Override
	public int japTotal() {
		return session.selectOne("japTotal");
	}
	@Override
	public int chiTotal() {
		return session.selectOne("chiTotal");
	}

	//목록
	@Override
	public List<Study> boardJobStudyList(Study study) {
		return session.selectList("boardJobStudyList",study);
	}
	@Override
	public List<Study> boardLangStudyList(Study study) {
		return session.selectList("boardLangStudyList",study);
	}
	@Override
	public List<Study> boardStudyList(Study study) {
		return session.selectList("boardStudyList",study);
	}

	@Override
	public List<Study> boardIntStudyList(Study study) {
		return session.selectList("boardIntStudyList",study);
	}
	@Override
	public List<Study> boardTesStudyList(Study study) {
		return session.selectList("boardTesStudyList",study);
	}
	@Override
	public List<Study> boardEtcStudyList(Study study) {
		return session.selectList("boardEtcStudyList",study);
	}
	@Override
	public List<Study> boardEngStudyList(Study study) {
		return session.selectList("boardEngStudyList",study);
	}
	@Override
	public List<Study> boardChiStudyList(Study study) {
		return session.selectList("boardChiStudyList",study);
	}
	@Override
	public List<Study> boardEtc1StudyList(Study study) {
		return session.selectList("boardEtc1StudyList",study);
	}
	@Override
	public List<Study> boardJapStudyList(Study study) {
		return session.selectList("boardJapStudyList",study);
	}
	
	
	//게시글
	@Override
	public Study studyContent(int study_no) {
		return session.selectOne("studyContent",study_no);
	}
	@Override
	public int nextStudy(int study_no) {
		return session.selectOne("nextStudy",study_no);
	}
	@Override
	public int prevStudy(int study_no) {
		return session.selectOne("prevStudy",study_no);
	}
	
	@Override
	public List<StudyComm> studyComments(int study_no) {
		return session.selectList("studyComments",study_no);
	}
	@Override
	public int studyWrite(Study study) {				
		return session.insert("studyWrite",study);
	}	
	@Override
	public Study StudyUpdateForm(int study_no) {
		return session.selectOne("StudyUpdateForm",study_no);
	}
	@Override
	public int studyUpdate(Study study) {			
		 return session.update("studyUpdate",study);		
	}
	@Override
	public int updateState(int study_no) {
		return session.update("updateState",study_no);
	}
	@Override
	public void updateWarnStudy(Study study) {
		session.update("updateWarnStudy",study);
	}
	
	
	//댓글
	@Override
	public int studyCommDelete(int comm_no) {
		return session.update("studyCommDelete",comm_no);
	}
	@Override
	public int studyCompDelete(int comm_no) {
		return session.delete("studyCompDelete",comm_no);
	}
	@Override
	public void writeCmt(StudyComm studyComm) {
		StudyComm vo = new StudyComm();
		int bstep = 0;
		vo.setBgroup(vo.getBgroup());
		vo.setBstep(bstep);
		System.out.println("Bstep"+bstep);
		session.selectOne("writeCmt",studyComm);
	}
	@Override
	public StudyComm studyCommUpdateForm(StudyComm studyComm) {
		return session.selectOne("studyCommUpdateForm",studyComm);
	}
	@Override
	public StudyComm studyCommUpdate(StudyComm studyComm) {
		return session.selectOne("studyCommUpdate",studyComm);
	}
	@Override
	public void writeReCmt(StudyComm studyComm) {
		System.out.println("writeReCmt start");
		session.selectOne("writeReCmt",studyComm);
	}
	@Override
	public List<Study> nlist(Study study) {
		return session.selectList("nlist", study);
	}
	public int noticeInsert(Study study) {
		return session.insert("noticeInsert", study);
	}
	public Study ndetail(int study_no) {
		Study study = session.selectOne("ndetail", study_no);
		return study;
	}
	public int nupdate(Study study) {
		return session.update("studytype",study);
		
	}
	public int ndelete(int study_no) {
		return session.delete("ndelete",study_no);
	}
	public int noticetotal() {
		// emp.xml->id(total), return int
		return session.selectOne("noticetotal");
	}
	@Override
	public int nListCnt(String study_type) {
		// emp.xml->id(total), return int
		return session.selectOne("nListCnt", study_type);	
		}
	//양으뜸
	@Override
	public int totalStu() {
		return session.selectOne("totalStu");
	}
	@Override
	public List<Study> adminStudyList(Study study) {		
		return session.selectList("adminStudyList",study);
	}
	@Override
	public int edyStudyTotal(String keywordStudy) {
		return session.selectOne("edyStudyTotal",keywordStudy);
	}
	@Override
	public List<Study> edySearchStudyList(Study study){
		return session.selectList("edySearchStudyList",study);
	}
	@Override
	public List<Study>edyStudyList(Study study){
		return session.selectList("edyStudyList",study);
	}
}
