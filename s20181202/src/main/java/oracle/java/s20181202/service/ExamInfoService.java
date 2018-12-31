package oracle.java.s20181202.service;

import java.util.List;

import oracle.java.s20181202.model.ExamInfo;


public interface ExamInfoService {
	List<ExamInfo> ExamInfoDetail(ExamInfo examInfo);
	int insertExamInfo(ExamInfo examInfo);
}
