package oracle.java.s20181202.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20181202.dao.StudyDao;
import oracle.java.s20181202.model.Study;
import oracle.java.s20181202.model.StudyComm;

@Service
public class StudyServiceImpl implements StudyService{
	@Autowired
	private StudyDao sd;
	//ed->EmpDaoImpl
	@Override
	public int studyTotal() {
		return sd.studyTotal();
	}
	@Override
	public int jobTotal() {
		return sd.jobTotal();
	}
	@Override
	public int langTotal() {
		return sd.langTotal();
	}
	@Override
	public int intTotal() {
		return sd.intTotal();
	}
	@Override
	public int tesTotal() {
		return sd.tesTotal();
	}
	@Override
	public int etc1Total() {
		return sd.etc1Total();
	}
	@Override
	public int etcTotal() {
		return sd.etcTotal();
	}
	@Override
	public int engTotal() {
		return sd.engTotal();
	}
	@Override
	public int japTotal() {
		return sd.japTotal();
	}
	@Override
	public int chiTotal() {
		return sd.chiTotal();
	}

	
	//목록
	@Override
	public List<Study>boardJobStudyList(Study study){
		return sd.boardJobStudyList(study);
	}
	@Override
	public List<Study>boardIntStudyList(Study study){
		return sd.boardIntStudyList(study);
	}
	@Override
	public List<Study>boardTesStudyList(Study study){
		return sd.boardTesStudyList(study);
	}
	@Override
	public List<Study>boardEtcStudyList(Study study){
		return sd.boardEtcStudyList(study);
	}
	@Override
	public List<Study>boardEngStudyList(Study study){
		return sd.boardEngStudyList(study);
	}
	@Override
	public List<Study>boardChiStudyList(Study study){
		return sd.boardChiStudyList(study);
	}
	@Override
	public List<Study>boardEtc1StudyList(Study study){
		return sd.boardEtc1StudyList(study);
	}
	@Override
	public List<Study>boardJapStudyList(Study study){
		return sd.boardJapStudyList(study);
	}
	@Override
	public List<StudyComm>studyComments(int study_no){
		return sd.studyComments(study_no);
	}
	@Override
	public List<Study>boardLangStudyList(Study study){
		return sd.boardLangStudyList(study);
	}
	@Override
	public List<Study>boardStudyList(Study study){
		return sd.boardStudyList(study);
	}
	
	
	//게시글
	@Override
	public Study studyContent(int study_no){
		return sd.studyContent(study_no);
	}
	@Override
	public int nextStudy(int study_no) {
		return sd.nextStudy(study_no);
	}
	@Override
	public int prevStudy(int study_no) {
		return sd.prevStudy(study_no);
	}
	@Override
	public int studyWrite(Study study) {
		return sd.studyWrite(study);
	}
	@Override
	public Study StudyUpdateForm(int study_no){
		return sd.StudyUpdateForm(study_no);
	}
	@Override
	public int studyUpdate(Study study) {			
		 return sd.studyUpdate(study);		
	}
	@Override
	public int updateState(int study_no){
		return sd.updateState(study_no);
	}
	@Override
	public void updateWarnStudy(Study study) {
		 sd.updateWarnStudy(study);
	}
	
	
	//댓글
	@Override
	public void writeCmt(StudyComm studyComm) {
		sd.writeCmt(studyComm);
	}
	@Override
	public int studyCommDelete(int comm_no) {
		return sd.studyCommDelete(comm_no);
	}
	@Override
	public int studyCompDelete(int comm_no) {
		return sd.studyCompDelete(comm_no);
	}
	@Override
	public StudyComm studyCommUpdateForm(StudyComm studyComm){
		return sd.studyCommUpdateForm(studyComm);
	}
	@Override
	public StudyComm studyCommUpdate(StudyComm studyComm){
		return sd.studyCommUpdate(studyComm);
	}
	@Override
	public void writeReCmt(StudyComm studyComm) {
		sd.writeReCmt(studyComm);
	}
	//이태현
		@Override
		public List<Study> nlist(Study study) {
			return sd.nlist(study);
		}
		public int noticeInsert (Study study) {
			return sd.noticeInsert(study) ;
		}
		public Study ndetail (int study_no) {
			Study study = sd.ndetail(study_no);
			return study;
		}
		public int nupdate(Study study) { 
			return sd.nupdate(study);
		}
		public int ndelete(int study_no) {
			return sd.ndelete(study_no);
		}
		public int nListCnt(String study_type) {
			return sd.nListCnt(study_type);
		}	
		
		public int noticetotal() {
			return sd.noticetotal();
		}
		@Override
		public int totalStu() {
			return sd.totalStu();
		}
		@Override
		public List<Study> adminStudyList(Study study) {		
			return sd.adminStudyList(study);
		}
	
	@Override
	public int edyStudyTotal(String keywordStudy) {
		return sd.edyStudyTotal(keywordStudy);
	}
	@Override
	public List<Study> edySearchStudyList(Study study){
		return sd.edySearchStudyList(study);
	}
	@Override
	public List<Study>edyStudyList(Study study){
		return sd.edyStudyList(study);
	}
}
