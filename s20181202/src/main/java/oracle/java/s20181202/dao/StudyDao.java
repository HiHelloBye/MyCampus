package oracle.java.s20181202.dao;

import java.util.List;

import oracle.java.s20181202.model.Study;
import oracle.java.s20181202.model.StudyComm;

public interface StudyDao {
	int studyTotal();
	int jobTotal();
	int langTotal();
	int intTotal();
	int tesTotal();
	int etc1Total();
	int engTotal();
	int japTotal();
	int chiTotal();
	int etcTotal();
	List<Study> boardStudyList(Study study);
	List<Study> boardJobStudyList(Study study);
	List<Study> boardLangStudyList(Study study);
	List<Study> boardJapStudyList(Study study);
	List<Study> boardEtc1StudyList(Study study);
	List<Study> boardChiStudyList(Study study);
	List<Study> boardEngStudyList(Study study);
	List<Study> boardEtcStudyList(Study study);
	List<Study> boardTesStudyList(Study study);
	List<Study> boardIntStudyList(Study study);
	List<StudyComm> studyComments(int study_no);
	Study studyContent(int study_no);
	int studyWrite(Study study);
	Study StudyUpdateForm(int study_no);
	int studyUpdate(Study study);
	int updateState(int study_no);
	int nextStudy(int study_no);
	int prevStudy(int study_no);

	void writeCmt(StudyComm studyComm);
	int studyCommDelete(int comm_no);
	int studyCompDelete(int comm_no);
	void updateWarnStudy(Study study);
	StudyComm studyCommUpdateForm(StudyComm studyComm);
	StudyComm studyCommUpdate(StudyComm studyComm);
	void writeReCmt(StudyComm studyComm);
		//이태현
		public List<Study> nlist(Study study);
		int noticeInsert(Study study);
		public Study ndetail(int study_no);
		public int nupdate(Study study);
		public int ndelete(int study_no);
		public int noticetotal();
		public int nListCnt(String study_type);
		
		//양으뜸
		int totalStu();	
		public List<Study> adminStudyList(Study study);
	int edyStudyTotal(String keywordStudy);
	List<Study> edySearchStudyList(Study study);
	List<Study> edyStudyList(Study study);
}
