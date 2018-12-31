package oracle.java.s20181202.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20181202.dao.ExamInfoDao;
import oracle.java.s20181202.model.ExamInfo;
@Service
public class ExamInfoServiceImpl implements ExamInfoService {
	@Autowired
	private ExamInfoDao eid;
	@Override
	public List<ExamInfo> ExamInfoDetail(ExamInfo examInfo) {
		// TODO Auto-generated method stub
		return eid.ExamInfoDetail(examInfo);
	}
	@Override
	public int insertExamInfo(ExamInfo examInfo) {
		// TODO Auto-generated method stub
		return eid.insertExamInfo(examInfo);
	}

}
