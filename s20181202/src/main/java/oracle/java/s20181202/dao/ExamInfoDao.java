package oracle.java.s20181202.dao;

import java.util.List;

import oracle.java.s20181202.model.ExamInfo;


public interface ExamInfoDao {
	List<ExamInfo> ExamInfoDetail(ExamInfo examInfo);
	int insertExamInfo(ExamInfo examInfo);
}
